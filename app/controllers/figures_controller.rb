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
    binding.pry
    @figure = Figure.create(name: params[:figure_name])

    if params[:new_title] !=""
      @newtitle = Title.create(name: params[:new_title])
      @figure.titles << @newtitle
    end

    if params[:new_landmark] !=""
      @newlandmark = Landmark.create(name: params[:new_landmark])
      @figure.landmarks << @newlandmark
    end

    @figure.save
    redirect to "figures/#{@figure.id}"
  end



end
