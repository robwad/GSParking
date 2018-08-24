class UsersController < ApplicationController
	def index
	end
	def create
	end
	def edit
	end
	def show
	end
	def update
	end
	def destroy
	end
	def new
	end
	private
	  def user_params
		  params.require(:user).permit(:email, :password)
	  end
end
