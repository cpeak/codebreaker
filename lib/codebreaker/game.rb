module Codebreaker
  class Game

    INVALID_GUESS_MESSAGE = 'All your base are belong to us. Guess again'
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
      if valid_guess?(guess)
        marker = Marker.new(@secret, guess)
        @output.puts '+'*marker.exact_match_count + 
                     '-'*marker.number_match_count
        if perfect_guess?(guess)
          @output.puts "\e[H\e[2J"
          @output.puts CODEBREAKER_WIN_MESSAGE
          abort
        end
      else
        @output.puts INVALID_GUESS_MESSAGE
      end
    end

    def valid_guess?(guess)
      guess_char_count = guess.split('').count

      guess_char_count == 4 && 
      /\d{4}/.match(guess)
    end

    def perfect_guess?(guess)
      guess == @secret
    end
  end
end
