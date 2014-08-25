require "rspec"
require "pry"

PROJECT_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..')).freeze
Dir[File.join(PROJECT_ROOT, 'spec/support/**/*.rb')].each { |file| require(file) }

require File.join(PROJECT_ROOT, "lib/paperclip/ghostscript")

RSpec.configure do |config|
  config.include SupportHelpers
end
