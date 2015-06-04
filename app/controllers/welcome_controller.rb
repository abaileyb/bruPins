class WelcomeController < ApplicationController
	def index
		@user = current_user
		@boards = @user.boards.all.order(:name)
	end
end
