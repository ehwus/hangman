# frozen_string_literal: true

require 'hangman'

describe Word do
  describe '#display_word' do
    it "returns '_' in place of each char by default" do
      no_letters_guessed = Word.new('apple')
      expect(no_letters_guessed.display_word).to eq('_ _ _ _ _')
    end

    it 'uses letter if it has been guessed' do
      some_letters_guessed = Word.new('banana')
      some_letters_guessed.make_guess('a')
      expect(some_letters_guessed.display_word).to eq('_ a _ a _ a')
    end
  end

  describe '#make_guess' do
    it 'adds to array of correctly guessed characters' do
      test_guesses = Word.new('example')
      test_guesses.make_guess('e')
      expect(test_guesses.correct_letters).to eq(['e'])
    end

    it 'works with multiple guesses' do
      test_guesses = Word.new('example')
      test_guesses.make_guess('e')
      test_guesses.make_guess('x')
      expect(test_guesses.correct_letters).to eq(%w[e x])
    end

    it "doesn't return incorrect letters" do
      test_guesses = Word.new('example')
      test_guesses.make_guess('z')
      expect(test_guesses.correct_letters).to eq([])
    end
  end

  describe '#guessed_correctly?' do
    it 'returns true if all letters guessed' do
      all_guessed = Word.new('example')
      all_guessed.make_guess('e')
      all_guessed.make_guess('x')
      all_guessed.make_guess('a')
      all_guessed.make_guess('m')
      all_guessed.make_guess('p')
      all_guessed.make_guess('l')
      expect(all_guessed.guessed_correctly?).to eq(true)
    end

    it 'returns false if no letters guessed' do
      none_guessed = Word.new('test')
      expect(none_guessed.guessed_correctly?).to eq(false)
    end

    it 'returns false if some letters are guessed' do
      some_guessed = Word.new('badger')
      some_guessed.make_guess('b')
      some_guessed.make_guess('a')
      expect(some_guessed.guessed_correctly?).to eq(false)
    end  
  end
end
