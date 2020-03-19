require 'spec_helper'

RSpec.describe Game do
  let (:tiffany) { Player.new({color: "X", name: "tiffany"}) }
  let (:robert) { Player.new({color: "O", name: "robert"}) }
  let (:game) { Game.new([tiffany, robert]) }

  describe '#solicit_move' do
    it "asks the player to make a move" do
      game = Game.new([tiffany, robert])
      allow(game).to receive(:current_player) { tiffany }
      expected = "tiffany: Enter a number between 1 and 7 to make your move"
      expect(game.solicit_move).to eq expected
    end
  end

  TestCell = Struct.new(:value)
  let(:x_cell) { TestCell.new("X") }
  let(:y_cell) { TestCell.new("Y") }
  let(:empty) { TestCell.new }

  describe "#get_move" do

    it "converts human_move of 'd3' to [3, 2]" do
      expect(game.get_move("d3")).to eq [3, 2]
    end
  end
end
