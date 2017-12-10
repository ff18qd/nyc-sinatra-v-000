class FiguresController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets

  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  get '/figures/new' do

    erb :"figures/new"
  end

  post '/figures' do
    @figure = Figure.create(name: params[:figure_name])
    if params[:new_title] !=""
      @newtitle = Title.create(name: params[:new_title])
      @figure.titles << @newtitle
    end

    if params[:new_landmark] !=""
      @newlandmark = Landmark.create(name: params[:new_landmark])
      @figure.landmarks << @newlandmark
    end

    if params["figure"]["title_ids"]
      @figure.titles << Title.find_by_id(params["figure"]["title_ids"][0])
    end

    if params["figure"]["landmark_ids"]
      @figure.landmarks << Landmark.find_by_id(params["figure"]["landmark_ids"][0])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get "/figures/:id" do
    # binding.pry
    @figure = Figure.find_by_id(params[:id])
    erb :"figures/show"
  end

  get "/figures/:id/edit" do
    @figure = Figure.find_by_id(params[:id])
    erb :"figures/edit"
  end

  patch "/figures/:id" do
    binding.pry
    @figure = Figure.find_by_id(params[:id])
    @figure.name = params["figure_name"]

    redirect to "/figures/#{@figure.id}"
  end

end
