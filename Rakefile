desc 'Executar testes em paralelo'
task :parallel_test, %i[processes tags profiles] do |_t, args|
  options = "#{args[:tags]} #{args[:profiles]}"
  command = "bundle exec parallel_cucumber features/specifications/* -n #{args[:processes]} --first-is-1 -o \"#{options}\""
  puts "\nIniciando a Execução dos Testes:\n#{command}\n"
  system command
end

desc 'Atualizar GEMS e Dependência dos projetos'
task :atualizar_gems do
  atualizar_gems
end

desc 'Executar Rubocop'
task :rubocop do
  executar_rubocop
end

def executar_rubocop
  puts '======================= INICIO ========================'
  puts 'Analisando código fonte com Rubocop...'
  checklist = '-r rubocop/formatter/checkstyle_formatter'
  config = '-c .rubocop.yml'
  formatter = '-f RuboCop::Formatter::CheckstyleFormatter'
  output = '-o code_analyzer/checkstyle-result.xml -f html -o code_analyzer/index.html'
  system "rubocop #{checklist} #{config} #{formatter} #{output} -P"
  puts 'Analise do código concluída!'
  puts '======================== FIM =========================='
end

def atualizar_gems
  puts '======================= INICIO ========================'
  puts 'Instalando a gem Bundler...'
  system 'gem i bundler --no-document --quiet'
  puts 'Instalação concluída com sucesso!'
  puts 'Instalando as demais dependencias do projeto...'
  system 'bundle install --quiet'
  puts 'Demais instalações concluída com sucesso!'
  puts '======================== FIM =========================='
end
