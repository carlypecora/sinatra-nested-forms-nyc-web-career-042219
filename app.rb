require './environment'

module FormsLab
  class App < Sinatra::Base

    # code other routes/actions here
    get "/" do 
    	"Welcome to the Nested Forms Lab!"
    end

    get "/new" do 
    	erb :"pirates/new"
    end

    post "/pirates" do 
    	
    	# binding.pry
    	@pirate = Pirate.new(params[:pirate])
    	params[:pirate][:ships].each do |details|
    		Ship.new(details)
    	end
    	# binding.pry
    	@ships = Ship.all

    	erb :"pirates/show"
    end

  end
end
