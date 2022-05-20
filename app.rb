require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
require('pry')
also_reload('lib/**/*.rb')
require("pg")

DB = PG.connect({:dbname => "volunteer_tracker"})

get('/') do
  redirect to('/projects')
end

get('/projects') do
  @projects = Project.all
  erb(:projects)
end

post('/projects') do
  title = params[:title]
  if title.downcase.count('a-z') > 0
    project = Project.new({:title => title, :id => nil})
    project.save
  end
  redirect to('/projects')
end

get('/projects/:id') do
  @project = Project.find(params[:id].to_i)
  erb(:edit_project)
end

get('/projects/:id/edit') do 
  @project = Project.find(params[:id].to_i())
  erb(:edit_project)
end

patch('/projects/:id') do
  @project = Project.find(params[:id].to_i)
  title = params[:title]
  @project.update({:title => title, :id => @project.id})
  redirect to('/projects')
end