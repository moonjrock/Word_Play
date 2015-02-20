require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('./lib/dictionary')

get('/') do
  @words = Word.all()
  erb(:index)
end

post('/word') do
  name = params.fetch("name")
  word = Word.new(name)
  word.save()
  @definition = Definition.find(params.fetch('definition_id').to_i())
  erb(:index)
end

get('/words/:id') do
  @word = Word.find(params.fetch("id"))
  erb(:word)
end

get('/definitions/:id') do
  @definition = Definition.find(params.fetch('id').to_i())
  erb(:definition)
end
