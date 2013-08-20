require 'spec_helper'

module Codebreaker
  describe Game do 
    let(:output) { double('output').as_null_object }
    let(:game)   { Game.new(output) }
    
    describe "#start" do 
      it "sends a welcome message" do
        output.should_receive(:puts).with('Somebody set us up the bomb')
        output.should_receive(:puts).with('You have no chance to survive. Make your time')
        game.start('1234')
      end

      it "prompts for the first guess" do
        output.should_receive(:puts).with('Enter guess:')
        game.start('1234')
      end
    end

    describe "#guess" do
      context "with no matches" do  

        it "returns error if invalid guess" do
          game.start('1234')
          output.should_receive(:puts).with('All your base are belong to us. Guess again')
          game.guess('abcd')
        end

        it "returns a mark of ''" do
          game.start('1234')
          output.should_receive(:puts).with('')
          game.guess('5555')
        end

        it "informs user of correct guess" do
          game.start('1234')
          output.should_receive(:puts).with('++++')
          output.should_receive(:puts).with('You have disarmed the bomb')
          game.guess('1234')
        end
      end
    end
  end
end
