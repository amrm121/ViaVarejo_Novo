require 'rubygems'
require 'capybara/cucumber'
require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec/matchers'
require 'rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'pry'
require 'fileutils'
require_relative 'helper.rb'
require_relative 'commons.rb'
require_relative 'page_helper.rb'

Dir[File.join(File.dirname(__FILE__), '/support/utils/*.rb')].sort.each { |file| require file }

AMBIENTE = ENV['AMBIENTE']
CONFIG = YAML.load_file(File.dirname(__FILE__) + "/ambientes/#{AMBIENTE}.yml")

Capybara.register_driver :selenium_chrome do |app|
  Selenium::WebDriver::Chrome::Service.driver_path = 'C:\Windows\chromedriver.exe'
  caps = Selenium::WebDriver::Remote::Capabilities.chrome  
  $driver = Capybara::Selenium::Driver.new(app, { :browser => :chrome, :desired_capabilities => caps })
end

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = CONFIG['url_padrao']
  config.default_max_wait_time = 20
end

World(Pages)
World(Commons)
World(Helper)