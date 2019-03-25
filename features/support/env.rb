require 'rspec'
require 'httparty'
require 'pry'
require 'faker'
require 'logger'
require 'brstring'
require_relative 'commons/utils'
require_relative 'commons/commons'

Faker::Config.locale ||= 'pt-BR'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

$LOG ||= Logger.new('automation_log.log')

PATH_API_REST ||= ENV['PATH_API_REST']
PATH_API_REST.nil? ? ENV['PATH_API_REST'] : PATH_API_REST

Dir[File.join(File.dirname(__FILE__), '../../fixtures/factories/**/*.rb')].sort.each { |file| require file }
Dir[File.join(File.dirname(__FILE__), 'spec_helper/*.rb')].sort.each { |file| require file }

# Mapeamento dos arquivos de massa
API_DATA_USUARIOS ||= YAML.load_file(File.dirname(__FILE__) + '/data/usuarios.yml')
API_DATA_PRODUTOS ||= YAML.load_file(File.dirname(__FILE__) + '/data/produtos.yml')

# Mapeamento dos arquivos de configuracao dos endpoints
URL ||= YAML.load_file(File.dirname(__FILE__) + '/config/urls.yml')
ENDPOINT ||= YAML.load_file(File.dirname(__FILE__) + '/config/endpoints.yml')

# Mapeamento dos perfis de execucao
BANDEIRA ||= ENV['BANDEIRA']
AMBIENTE ||= ENV['AMBIENTE']
SERVIDOR ||= ENV['SERVIDOR']
DISPOSITIVO ||= ENV['DISPOSITIVO']
DEBUG ||= ENV['DEBUG']

# Disponibiliza de forma global
World(REST)
