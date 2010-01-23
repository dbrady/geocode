$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib')))

require 'ruby-debug'
require 'numeric_degrad_conv'
require 'result'
require 'location'
require 'earth_constants'

def require_all_files_in_folder(folder, extension = "*.rb")
  Dir[File.join(folder, "**/#{extension}")].each do |file|
    require File.expand_path(file)
  end
end

require_all_files_in_folder File.join(File.dirname(__FILE__), "spec_helpers")


