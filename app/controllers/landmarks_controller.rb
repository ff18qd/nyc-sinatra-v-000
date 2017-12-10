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
      binding.pry
    @landmark = Landmark.create(name: params["landmark_name"], year_completed: params["landmark_year_completed"])
    redirect to "/landmarks/#{@landmark.id}"
  end

  get "/landmarks/:id" do
    @landmark = Landmark.find_by_id(params[:id])
    erb :"landmarks/show"
  end

end
