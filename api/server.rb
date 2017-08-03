require 'sinatra'

get '/' do
  p 'received request'
  sleep(3)
  p 'responding'
  'Hello world!'
end
