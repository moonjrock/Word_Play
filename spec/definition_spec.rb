require('rspec')
require('definition')

describe(Definition) do
  before() do
    Definition.clear()
  end

  describe("meaning") do
    it("returns the meaning of word") do
      test_definition = Definition.new("used as a greeting")
      expect(test_definition.meaning()).to(eq("used as a greeting"))
    end
  end

  describe("id") do
  it('will return a definition id') do
    definition = Definition.new({:meaning => "used as a greeting"})
    expect(definition.id()).to(eq(1))
  end
end

  describe("save") do
    it ("saves the definition") do
      test_definition = Definition.new({:meaning => "used as a greeting"})
      test_definition.save()
      expect(Definition.all()).to(eq([test_definition]))
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
      test_definition = Definition.new({:meaning => "used as a greeting"})
      test_definition.save()
      test_definition2 = Definition.new({:meaning => "used to express good wishes"})
      test_definition.save2()
      expect(Definition.find(test_definition.id())).to(eq(1))
    end
  end
end
