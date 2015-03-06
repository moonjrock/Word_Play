require('rspec')
require('word')

describe(Word) do
  before() do
    Word.clear()
  end

  describe("add_word") do
    it("adds a word to the dictionary") do
      test_word = Word.new({:add_word => "hello"})
      # test_word.save()
      expect(test_word.add_word()).to(eq("hello"))
    end
  end

  describe("save") do
    it ("saves a word in the array of words") do
      test_word = Word.new({:add_word => "goodbye"})
      test_word.save()
      expect(Word.all()).to(eq([test_word]))
    end
  end

  describe(".clear") do
    it("clears out all the saved words") do
      test_word = Word.new({:add_word => "gone"})
      test_word.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe("id") do
    it("returns the ID number of a word") do
      test_word = Word.new({:add_word => "identify"})
      test_word.save()
      expect(test_word.id()).to(eq(1))
    end
  end

  describe(".find") do
    it("returns the word by its ID number") do
      test_word = Word.new({:add_word => "what"})
      test_word.save()
      expect(Word.find(test_word.id())).to(eq(test_word))
    end
  end
end
