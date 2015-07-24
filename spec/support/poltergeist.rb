# require 'capybara/poltergeist'
# Capybara.javascript_driver = :poltergeist
require 'phantomjs'

begin
  require 'capybara/poltergeist'
rescue => LoadError
  raise "Poltergeist support requires the poltergeist gem to be available."
end
options = {js_errors: false}
Phantomjs.path # Force install on require
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, options, :phantomjs => Phantomjs.path)
end
