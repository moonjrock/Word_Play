class Word
  @@words = []

  define_method(:initialize) do |name, language, origin|
    @name = name
    @language = language
    @origin = origin
    @id = @@words.length().+(1)
  end

  define_method(:name) do
    @name
  end

  define_method(:language) do
    @language
  end

  define_method(:origin) do
    @origin
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

  define_singleton_method(:find) do |identification|
    found_word = nil
    @@words.each() do |word|
      if word.id().eq?(identification.to_i())
        found_word = word
      end
    end
    found_word
  end
end
