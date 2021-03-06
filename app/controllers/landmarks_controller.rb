class LandmarksController < ApplicationController

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets

  get "/landmarks" do
    @landmarks = Landmark.all
    erb :"landmarks/index"
  end

  get "/landmarks/new" do
    erb :"landmarks/new"
  end

  post "/landmarks" do
    @landmark = Landmark.create(name: params["landmark_name"], year_completed: params["landmark_year_completed"])
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end

  get "/landmarks/:id" do
    @landmark = Landmark.find_by_id(params[:id])
    erb :"landmarks/show"
  end

  get "/landmarks/:id/edit" do
    @landmark = Landmark.find_by_id(params[:id])
    erb :"landmarks/edit"
  end

  patch "/landmarks/:id" do
    # binding.pry
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(name: params["name"], year_completed: params["year_completed"])
    redirect to "/landmarks/#{@landmark.id}"
  end

end
