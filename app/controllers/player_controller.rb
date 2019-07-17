class PlayerController < ApplicationController
	def index
		@Player = Player.all
	end
	def new
	end
	def create
		player= Player.new(player_params)
        if player.save
        	redirect_to "/player"
        else
        	flash[:errors] = player.errors.full_messages
        	redirect_to "/player/new"
        end

	end
	def show
		@player = Player.find(params[:id])
	end
	def edit
		@player = Player.find(params[:id])
	end
	def update
		player = Player.find(params[:id])
		if player.update(player_params)
			redirect_to player_path
		else
			flash[:errors] = player.errors.full_messages
			redirect_to player_path
	    end
	end
	def destroy
		player =Player.find(params[:id])
		player.destroy
		redirect_to "/player"
	end
private
def player_params
	params.require(:player).permit(:first_name, :last_name)
end

end