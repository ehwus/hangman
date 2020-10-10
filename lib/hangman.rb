class Word
  def initialize(word)
    @word = word
  end

  def display_word
    '_ ' * (@word.length - 1) + '_'
  end
end