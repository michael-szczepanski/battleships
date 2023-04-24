require './lib/io_handler.rb'

RSpec.describe IOHandler do
  context 'prompts for player count' do
    it 'prompts for player count' do
      io = double :IO
      expect(io).to receive(:gets).and_return("2")
      expect(
        IOHandler.get_player_count(io)
      ).to eq "2"
    end
    it 'prompts for a retry if non-integer entered' do
      io = double :IO
      expect(io).to receive(:gets).and_return("one")
      expect(io).to receive(:puts).with("Please enter an integer higher than 1 for player count")
      expect(io).to receive(:puts).with("Please enter the player count")
      expect(io).to receive(:gets).and_return("2")
      expect(
        IOHandler.get_player_count(io)
      ).to eq "2"
    end
  end
end