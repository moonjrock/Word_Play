require('rspec')
require('definition')

describe(Definition) do
  before() do
    Definition.clear()
  end

  describe("add_definition") do
    it("adds a definition of the word") do
      test_definition = Definition.new({:add_definition => "used as a greeting"})
      expect(test_definition.add_definition()).to(eq("used as a greeting"))
    end
  end

  describe(".all") do
    it 'list all definitions' do
      expect(Definition.all).to eq ([])
    end
  end   #(you forgot this spec)

  describe("save") do
    it ("saves a definition in the array of definitions") do
      test_definition = Definition.new({:add_definition => "used to express good wishes"})
      test_definition.save()
      expect(Definition.all()).to(eq([test_definition]))
    end
  end

  describe(".clear") do
    it("clears out all the saved definitions") do
      test_definition = Definition.new({:add_definition => "no longer present"})
      test_definition.save()
      Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end

  describe("id") do
    it("return the ID number of a definition") do
      test_definition = Definition.new({:add_definition => "establish or indicate who or what"})
      expect(test_definition.id()).to(eq(1))  #just make this 1 because the spec wants 1. Maybe because its the first time you are calling id for the word.
    end
  end

  describe(".find") do
    it("returns the definition by its ID number") do
      test_definition = Definition.new({:add_definition => "asking for information specifying something"})
      test_definition.save()
      expect(Definition.find(test_definition.id())).to(eq(test_definition))
    end
  end
end
