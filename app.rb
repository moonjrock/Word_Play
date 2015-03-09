require('sinatra')
require('sinatra/reloader')
also_reload('./lib/**/*.rb')
require('./lib/word')
require('./lib/definition')

get('/') do
  @words = Word.all()
  erb(:index)
end

post('/definition') do
  word = params.fetch('word')
  Word.new({:add_word => word}).save()
  @words = Word.all()
  erb (:index)
end

post('/words') do
  add_definition = params.fetch('definition')
  new_definition = Definition.new({:add_definition => word_definition})
  new_definition.save
  @word = Word.find(params.fetch('word').to_i())
  @word.add_definition(new_definition)
  erb (:word)
end

get('/definitions/:id') do
  @word = Word.find(params.fetch("id").to_())
  erb (:definition)
end

get('/word/:id') do
  @definition = Definition.find(params.fetch('id').to_i())
  redirect (:/)
end
