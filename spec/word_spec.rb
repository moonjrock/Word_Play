require('rspec')
require('word')
require('definition')

describe(Word) do
  before() do
    Word.clear()
  end

  describe("name") do
    it("returns the name of word") do
      test_word = Word.new({:name => "Hello"})
      test_word.save()
      expect(test_word.name()).to(eq("Hello"))
    end
  end

  describe("save") do
    it ("saves the input word") do
      test_word = Word.new({:name => "Hello"})
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
      test_word = Word.new({:name => "Hello"})
      test_word.save()
      expect(Word.find(test_word.id())).to(eq(test_word))
    end
  end

  describe("add_definition") do
    it("adds a definition to the word") do
      new_word = Word.new({ :name => "carrot" })
      new_definition = Definition.new({ :meaning => "orange, long, pointy" })
      new_word.add_definition(new_definition)
      expect(new_word.new_definition()).to(eq([new_definition]))
    end
  end
end
