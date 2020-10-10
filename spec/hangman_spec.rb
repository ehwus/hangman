require 'hangman'

describe Word do
  describe '#display_word' do
    it "returns '_' in place of each char by default" do
      no_letters_guessed = Word.new('apple')
      expect(no_letters_guessed.display_word).to eq("_ _ _ _ _")
    end
  end
  describe '#make_guess' do
    it "adds to array of correctly guessed characters" do
      test_guesses = Word.new('example')
      test_guesses.make_guess('e')
      expect(test_guesses.correct_letters).to eq(['e'])
    end
  end
end