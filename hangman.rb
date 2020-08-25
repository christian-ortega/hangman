class Hangman

  public

  def initialize(word, number_of_attempts)
    @word = word.split(//)
    @revealed_word = Array.new(word.length, "_")
    @incorrect_guesses = Array.new
    @number_of_attempts = number_of_attempts
  end

  def game
    update_display
    until number_of_attempts <= 0 || word == revealed_word do
      player_turn
      update_display
    end

    if word == revealed_word
      puts "GAME OVER. You Win!"
    else
      puts "GAME OVER. You Lose..."
    end
  end

  private

  attr_accessor :number_of_attempts
  attr_reader :word, :revealed_word, :incorrect_guesses

  def update_display
    puts revealed_word.join(" ")
    puts "Incorrect guesses: #{incorrect_guesses.join(", ")}"
    puts "Number of attempts left: #{number_of_attempts}"
    puts ""
  end

  def player_turn
    print "Make your guess: "
    guess = gets.chomp
    puts ""

    is_guess_correct = false
    word.each_with_index do |character, index|
      if character == guess
        revealed_word[index] = character 
        is_guess_correct = true
      end
    end

    if is_guess_correct
      puts "Your guess was right!"
    else
      puts "Your guess was wrong..."
      self.number_of_attempts -= 1
      incorrect_guesses.push(guess)
    end
    
    puts ""
  end

end

hangman = Hangman.new("sapphire", 5)
hangman.game