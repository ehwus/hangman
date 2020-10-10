# frozen_string_literal: true

class Word
  attr_reader :correct_letters

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
