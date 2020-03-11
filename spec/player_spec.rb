require 'spec_helper'

describe Player do
  describe '#initialize' do
    it 'raises an exception when initialized with {}' do
      expect { Player.new({}) }.to raise_error
    end

    it 'does not raise an error when initialized with a valid input hash' do
      input = { color: 'X', name: 'Robert' }
      expect { Player.new(input) }.to_not raise_error
    end
  end

  describe '#color' do
    it 'returns the color of the player' do
      input = { color: 'X', name: 'Robert' }
      player1 = Player.new(input)
      expect(player1.color).to eql('X')
    end
  end

  describe '#name' do
    it 'returns the name of the player' do
      input = { color: 'X', name: 'Robert' }
      player1 = Player.new(input)
      expect(player1.name).to eql('Robert')
    end
  end
end