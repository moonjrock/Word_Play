require('rspec')
require('word')

describe(Word) do
  before() do
    Word.clear()
  end

  describe("name") do
    it("returns the name of word") do
      test_word = Word.new("Hello", "English", 1865)
      test_word.save()
      expect(test_word.name()).to(eq("Hello"))
    end
  end

  describe("language") do
    it("returns the language of the word") do
      test_word = Word.new("Hello", "English", 1865)
      test_word.save()
      expect(test_word.language()).to(eq("English"))
    end
  end

  describe("origin") do
    it("returns the origin of the word") do
      test_word = Word.new("Hello", "English", 1865)
      test_word.save()
      expect(test_word.origin()).to(eq(1865))
    end
  end

  describe("save") do
    it ("adds a word to the array of saved words") do
      test_word = Word.new("Hello", "English", 1865)
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
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
      test_word = Word.new("Hello", "Englsh", 1865)
      test_word.save()
      test_word2 = Word.new("Goodbye", "English", 1565)
      test_word2.save()
      expect(Word.find(test_word.id())).to(eq(test_word))
    end
  end
end
