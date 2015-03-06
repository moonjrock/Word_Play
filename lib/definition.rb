class Definition
  attr_reader(:add_definition, :id)

  @@definitions = []

  define_method(:initialize) do |attributes|
    @add_definition = attributes.fetch(:add_definition)
    @id = @@definitions.length.+(1)
  end

  define_method(:save) do
    @@definitions.push(self)
  end

  define_singleton_method(:all) do
    @@definitions
  end

  define_singleton_method(:clear) do
    @@definitions = []      #you forgot the "s" here
  end

  define_singleton_method(:find) do |id|
    found_definition = nil
    @@definitions.each() do |definition|
      if definition.id() == id
        found_definition = definition
      end
    end
    found_definition
  end
end
