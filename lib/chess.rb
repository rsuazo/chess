require_relative "./chess/core_extensions.rb"
lib_path = File.expand_path(File.dirname(__FILE__))
Dir[lib_path + "/chess/**/*.rb"].each { |file| require file }


puts "Welcome to Chess"
robert = Player.new({color: "white", name: "robert"})
tiffany = Player.new({color: "black", name: "tiffany"})
players = [robert, tiffany]
game = Game.new(players)
game.play
