require 'sinatra'
require 'pg'
require 'sinatra/reloader' if development?

get '/' do
  erb :home
end
