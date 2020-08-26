class Hangman
  MIN_LENGTH = 5
  MAX_LENGTH = 12


  public

  def initialize(filename, number_of_attempts)
    @word = random_word_from_file(filename)
    @revealed_word = Array.new(word.length, "_")
    @incorrect_guesses = Array.new
    @number_of_attempts = number_of_attempts
  end

  def game
    begin_game

    update_display
    until number_of_attempts <= 0 || word == revealed_word do
      player_turn
      update_display
    end

    game_over
  end

  private

  attr_accessor :number_of_attempts
  attr_reader :word, :revealed_word, :incorrect_guesses

  def random_word_from_file(filename)
    file = File.open(filename)
    dictionary = file.readlines.map(&:chomp)
    
    new_word = ""
    until new_word.length >= MIN_LENGTH && new_word.length <= MAX_LENGTH do
      new_word = dictionary.sample
    end
    
    return new_word.split(//)
  end

  def begin_game
    puts "Welcome to Hangman!"
    puts ""
    puts "A random word has been chosen."
    puts ""
  end

  def update_display
    puts revealed_word.join(" ")
    puts "Incorrect guesses: #{incorrect_guesses.join(", ")}"
    puts "Number of attempts left: #{number_of_attempts}"
    puts ""
  end

  def player_turn
    guess = ""

    # take user input, prevent duplicate or invalid entries
    loop do
      print "Make your guess: "
      guess = gets.chomp.downcase
      puts ""
      break unless revealed_word.include?(guess) || 
                revealed_word.include?(guess.upcase) ||
                incorrect_guesses.include?(guess) || 
                guess.length != 1 || 
                !(guess =~ /[a-z]/) 
      puts "Invalid Entry! Try again."
			puts ""
    end
    
    # check if the guessed letter is in the word
    is_guess_correct = false
    word.each_with_index do |character, index|
      if character.downcase == guess
        revealed_word[index] = character 
        is_guess_correct = true
      end
    end

    # provide feedback, update game info if guess is wrong
    if is_guess_correct
      puts "Your guess was right!"
    else
      puts "Your guess was wrong..."
      self.number_of_attempts -= 1
      incorrect_guesses.push(guess)
    end
    
    puts ""
  end

  def game_over
    if word == revealed_word
      puts "GAME OVER. You Win!"
    else
      puts "GAME OVER. You Lose..."
    end

    puts "The word is \"#{word.join}\""
  end
end

hangman = Hangman.new("5desk.txt", 8)
hangman.game