require('rspec')
require('word')
require('definition')

describe(Definition) do
  before() do
    Definition.clear()
  end

  describe("meaning") do
    it("returns the meaning of word") do
      test_definition = Definition.new("used as a greeting")
      test_definition.save()
      expect(test_definition.name()).to(eq("used as a greeting"))
    end
  end

  describe("save") do
    it ("saves the definition") do
      test_definition = Definition.new("used as a greeting")
      test_definition.save()
      expect(Definition.all()).to(eq(test_definition))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Definition.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("empties out all the saved definitions") do
      Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a definition by its id number") do
      test_definition = Definition.new("used as a greeting")
      test_definition.save()
      test_definition2 = Definition.new("used to express good wishes")
      test_definition2.save()
      expect(Definition.find(test_definition.id())).to(eq(test_definition))
    end
  end
end
