# require_relative "./chess/core_extensions.rb"
lib_path = File.expand_path(File.dirname(__FILE__))
Dir[lib_path + "/chess/**/*.rb"].each { |file| require file }
