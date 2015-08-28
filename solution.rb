require 'sinatra'
require 'rubygems'
require "make_todo"

get '/' do
   @title = "Tareas"
   @tareas  = Tarea.all
   erb :home
end

post '/' do
  Tarea.create(params[:content].to_s)
  redirect '/'
end

get '/:id/delete' do
  @tarea = Tarea.find(params[:id].to_s)
  @title = "Confirmación Borrar Tarea ##{params[:id]}"
  erb :delete
end

delete '/:id' do
  Tarea.destroy(params[:id].to_s)
  redirect '/'
end

get '/:id/complete' do
  Tarea.update(params[:id].to_s)
  redirect '/'
end