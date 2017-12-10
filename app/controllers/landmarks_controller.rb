class LandmarksController < ApplicationController

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets

  get "/landmarks" do
    binding.pry
    @landmarks = Landmark.all
    erb :"landmarks/index"
  end

  get "/landmarks/new" do
    erb :"landmarks/new"
  end

  get "/landmarks/:id" do
    # binding.pry
    @landmark = Landmark.find_by_id(params[:id])
    erb :"landmark/show"
  end

end
