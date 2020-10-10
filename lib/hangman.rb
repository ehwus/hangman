# frozen_string_literal: true
require 'yaml'

class Game
  def initialize
    choice = nil
    loop do
      puts "Press 1 to start a new game, or 2 to load a game"
      choice = gets.chomp.to_i
      if choice == 2
        load_game
        break
      elsif choice == 1
        @word = Word.new(random_word)
        @player = Player.new
        break
      end
    end
  end

  def save_game
    File.open('save.yml', 'w') do |file|
      data = YAML.dump ({
        :word => @word,
        :player => @player
      })
      file.puts data
    end
    puts "Game saved, see you next time!"
    exit
  end

  def load_game
    data = YAML.load(File.read('save.yml'))
    @word = data[:word]
    @player = data[:player]
  end  

  def random_word
    line = IO.readlines('5desk.txt')
    c = rand * line.length.to_i
    possible_word = line[c - 1].chomp.downcase
    if possible_word.length > 4 && possible_word.length < 13
      possible_word
    else
      random_word
    end
  end

  def play_game
    loop do
      if @player.guesses_left == 0
        puts "You're out of lives!"
        break
      end
      puts "You have #{@player.guesses_left} guesses remaining"
      show_word_take_input
      if @word.guessed_correctly?
        puts "You win, well done!"
        break
      end
    end
  end

  def show_word_take_input
    puts @word.display_word
    puts
    puts 'Choose a letter'
    choice = gets.chomp.downcase
    @word.make_guess(choice)
    @player.use_guess unless @word.correct_letters.include?(choice)
  end
end

class Word
  attr_reader :correct_letters, :word

  def initialize(word)
    @word = word
    @correct_letters = []
  end

  def display_word
    return_word = ''
    @word.split('').each_with_index do |char, index|
      return_word += if correct_letters.include?(char)
                       char
                     else
                       '_'
                     end
      return_word += ' ' if index != @word.length - 1
    end
    return_word
  end

  def make_guess(letter)
    correct_letters.push(letter) if @word.split('').include?(letter)
  end

  def guessed_correctly?
    @word.split('').all? { |char| correct_letters.include?(char) }
  end
end

class Player
  attr_reader :guesses_left

  def initialize
    @guesses_left = 6
  end

  def use_guess
    @guesses_left -= 1
  end
end

test = Game.new
test.play_game