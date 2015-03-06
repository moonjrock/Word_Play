require('sinatra')
require('sinatra/reloader')
also_reload('./lib/**/*.rb')
require('./lib/word.rb')
require('./lib/definition.rb')

get('/') do
  @words = Word.all()
  erb(:index)
end

post('/word') do
  @name = params.fetch("name")
  @word = Word.new({:add_word => @name})
  @word.save()
  #@definition = Definition.find(params.fetch('definition_id').to_i())
  @words = Word.all   #you need this here. You dont need the code above, because each word will have its own definitions on their page  "/words/:id"
  redirect "/"     #better to redirect because browser is trying to render (GET) original index of Words.all. But you are actually changing the page with post.
end

get('/words/:id') do
  @word = Word.find(params.fetch("id"))
  #@great_definitions = @word.definition    (We are calling our definition method in the Word class which is an empty array that will be holding words )
  erb(:word)
end


#You need this code to post definitions on "/words/:id"

#Put a form on word.erb  named definition. All the code you have there is wrong.  It should look almost the same as the form you have on index, but with definition instead.

post '/definition' do
  @a_definition = params.fetch("a_definition")
  @new_definition = Definition.new({:add_definition => @a_definition})
  @new_definition.save
  @word = Word.find(params.fetch("id").to_i)
  @word.add_definition(@new_definition)
  @great_definitions = Definition.all
  redirect '/'
end
