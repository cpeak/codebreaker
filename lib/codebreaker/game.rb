module Codebreaker
  class Game

    CODEBREAKER_WIN_MESSAGE = 'You have disarmed the bomb'

    def initialize(output)
      @output = output
    end
    
    def start(secret)
      @secret = secret
      @output.puts "Somebody set us up the bomb"
      @output.puts "You have no chance to survive. Make your time"
      @output.puts "Enter guess:"
    end

    def guess(guess)
      marker = Marker.new(@secret, guess)
      @output.puts '+'*marker.exact_match_count + 
                   '-'*marker.number_match_count
      @output.puts CODEBREAKER_WIN_MESSAGE if perfect_guess?(guess)
    end

    def perfect_guess?(guess)
      guess == @secret
    end
  end
end
