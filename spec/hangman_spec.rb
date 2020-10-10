require 'hangman'

describe Word do
  describe "#display_word" do
    it "returns '_' in place of each char by default" do
      expect(Word.new('apple').display_word).to eq("_ _ _ _ _")
    end
  end
end