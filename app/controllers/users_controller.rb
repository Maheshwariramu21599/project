class UsersController < ApplicationController
    def index
        @user =User.new
    end
    def create
        user=User.new(user_params)
        if user.save
            redirect_to player_path
        else
            flash[:errors]= User.errors.full_message
            redirect_to :back
        end
    end
private
def user_params
	params.require(:user).permit(:name, :email ,:password,:password_confirmation)
end
end
