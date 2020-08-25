class Hangman

  public

  def initialize(word, number_of_attempts)
    @word = word.split(//)
    @revealed_word = Array.new(word.length, "_")
    @incorrect_guesses = Array.new
    @number_of_attempts = number_of_attempts
  end

  def game
    until number_of_attempts <= 0 do
      update_display
    end
  end

  private

  attr_reader :revealed_word, :incorrect_guesses, :number_of_attempts

  def update_display
    puts revealed_word.join(" ")
    puts "Incorrect guesses: #{incorrect_guesses.join(", ")}"
    puts "Number of attempts left: #{number_of_attempts}"
    puts ""
  end

end

hangman = Hangman.new("sapphire", 5)
hangman.game