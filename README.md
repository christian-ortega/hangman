# hangman
THE ODIN PROJECT: FILE I/O AND SERIALIZATION

### Hangman ([View in Repl.it](https://repl.it/@chrisortegax/hangman#lib/hangman.rb))

This is a command-line interface implementation of the classic game of Hangman.

The focus on this project was on File I/O and Serialization. The program reads a file with a list of words and chooses a random word from the list. Additionally, the program is able to save the current state of a game into a file, and the program is able to load a save file to resume the game that was saved. This is made possible through the File and Marshal classes in Ruby, encapsulated within the Hangman class with its own set of public and private functions.
