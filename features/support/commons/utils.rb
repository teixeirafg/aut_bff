module Utils
  include HTTParty

  def json_delete_field(key_path, object)
    item = JSON.parse(object.to_json, object_class: OpenStruct)
    key_path.split('.').inject(item) do |memo, value|
      memo.delete_field(value.to_s) if value == key_path.split('.').last
      memo.send(value)
    end
    convert_to_hash_recursive(item)
  end

  def parse_cookie(response)
    cookie_hash = CookieHash.new
    response.get_fields('Set-Cookie').each { |cookie| cookie_hash.add_cookies(cookie) }
    cookie_hash.to_cookie_string
  end

  def generate_evidence(response)
    evidence_folder = FOLDER_PATH
    verb = response.request.http_method::METHOD
    evidence_file = "#{evidence_folder}/#{Time.now.strftime('%Hh%Mm%Ss%L')}_#{verb}.txt"
    request_response_log(response, evidence_file, verb)
  end

  def format_json(json)
    JSON.parse(json)
  rescue JSON::ParserError
    JSON.parse(json.to_json)
  end

  def switch_ip
    hosts_resolver = Resolv::Hosts.new("features/support/hosts/#{SERVIDOR}/hosts")
    dns_resolver = Resolv::DNS.new
    Resolv::DefaultResolver.replace_resolvers([hosts_resolver, dns_resolver])
    puts "[Aviso] IP alterado. API irá ser testada no Servidor: #{SERVIDOR}"
  end

  private

  def convert_to_hash_recursive(obj)
    result = obj
    case result
    when OpenStruct
      result = result.marshal_dump
      result.each do |k, v|
        result[k] = convert_to_hash_recursive(v)
      end
    when Array
      result = result.map { |v| convert_to_hash_recursive(v) }
    end
    result
  end

  def time_now
    Time.now.strftime('%d/%m/%Y %H:%M:%S.%L - GMT %z')
  end

  def request_response_log(response, evidence_file, verb)
    response_debug_console(response) if DEBUG
    File.open(evidence_file, 'w:ASCII-8BIT') do |f|
      f << "===================== REQUEST =================== \n"
      f << ">>>> ENDPOINT: #{response.request.last_uri} \n"
      f << ">>>> BANDEIRA: #{BANDEIRA.upcase} \n"
      f << ">>>> AMBIENTE: #{AMBIENTE.upcase} \n\n"
      f << ">>>> REQUEST BODY: \n"
      f << "#{response.body.empty? ? response : JSON.pretty_generate(format_json(response.body))}\n" unless verb.eql?('GET')
      f << "================================================= \n\n"
      f << "==================== RESPONSE =================== \n"
      f << "\n>>>> RESPONSE HEADERS <<<< \n"
      response.header.each { |key, value| f << "#{key}: #{value} \n" }
      f << "\n>>>> RESPONSE BODY <<<< \n"
      f << "#{response.body.empty? ? response.body : JSON.pretty_generate(format_json(response.body))} \n"
      f << "================================================= \n"
    end
  end

  def response_debug_console(response)
    puts "\n================= RESPONSE BODY ================="
    puts response.body.empty? ? response.body : JSON.pretty_generate(format_json(response.body))
    puts '================================================='
  end
end
