require('sinatra')
require('sinatra/reloader')
also_reload('./lib/**/*.rb')
require('./lib/word')
require('./lib/definition')

get('/') do
  @words = Word.all()
  erb(:index)
end

post('/words') do
  word = params.fetch('word')
  Word.new({:word => word}).save()
  @words = Word.all()
  redirect (:/)
end

post('/definitions') do
  word_definition = params.fetch('definitions')
  definition = Definition.new({:definition => word_definition})
  definition.save
  @word = Word.find(params.fetch('definitions').to_i())
  @word.add_definition(definition)
  redirect (:/)
end

get('/words/:id') do
  @word = Word.find(params.fetch("id"))
  redirect(:/)
end

get('/definitions/:id') do
  @definition = Definition.find(params.fetch('id').to_i())
  redirect (:/)
end
