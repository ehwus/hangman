class Word
  attr_reader :correct_letters

  def initialize(word)
    @word = word
    @correct_letters = []
  end

  def display_word
    '_ ' * (@word.length - 1) + '_'
  end

  def make_guess(letter)
    if @word.split('').include?(letter)
      correct_letters.push(letter)
    end
  end
end