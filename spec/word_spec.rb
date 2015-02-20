require('rspec')
require('word')
require('definition')

describe(Word) do
  before() do
    Word.clear()
  end

  describe("name") do
    it("returns the name of word") do
      test_word = Word.new("Hello")
      test_word.save()
      expect(test_word.name()).to(eq("Hello"))
    end
  end

  describe("save") do
    it ("saves the input word") do
      test_word = Word.new("Hello")
      test_word.save()
      expect(Word.all()).to(eq(test_word))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("empties out all the saved words") do
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a word by its id number") do
      test_word = Word.new("Hello")
      test_word.save()
      test_word2 = Word.new("Goodbye")
      test_word2.save()
      expect(Word.find(test_word.id())).to(eq(test_word))
    end
  end
end
