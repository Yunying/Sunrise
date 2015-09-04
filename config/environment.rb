# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

Encoding.default_internal="UTF-8"

require 'pdf/writer'
