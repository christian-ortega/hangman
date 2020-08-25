class Hangman

  public

  def initialize(word, number_of_attempts)
    @word = word.split(//)
    @revealed_word = Array.new(word.length)
    @incorrect_guesses = Array.new
    @number_of_attempts = number_of_attempts
  end

  private

end