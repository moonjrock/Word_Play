class Word
  attr_reader(:add_word, :definition, :id)

  @@words = []

  define_method(:initialize) do |attributes|
    @add_name = attributes.fetch(:add_word)
    @definition = []
    @id = @@words.length().+(1)
  end

  define_method(:save) do
    @@words.push(self)
  end

  define_singleton_method(:all) do
    @@words
  end

  define_singleton_method(:clear) do
    @@words = []
  end

  define_singleton_method(:find) do |id|
    found_word = nil
    @@words.each() do |word|
      if word.id() == id
        found_word = word
      end
    end
    found_word
  end

  define_method(:add_definition) do |definition|
    @definition.push(definition)
  end
end
