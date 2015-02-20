class Word
  attr_reader(:name, :definition, :id)

  @@words = []

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @definition = []
    @id = @@words.length().+(1)
  end

  define_singleton_method(:all) do
    @@words
  end

  define_method(:save) do
    @@words.push(self)
  end


  define_singleton_method(:clear) do
    @@words = []
  end

  define_singleton_method(:find) do |id|
    found_word = nil
    @@words.each() do |word|
      if word.id(). == identification.to_i()
        found_word = word
      end
    end
    found_word
  end
end
