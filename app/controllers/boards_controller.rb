class BoardsController < ApplicationController

	def show
		@board = Board.find(params[:id])
		@pins = @board.pins.all
	end

	def new
		@board = Board.new
		@user = current_user
	end

	def create
		@user = current_user
		@board = @user.boards.create(board_params)
		if @board.save
			redirect_to board_path(@board)
		else
			render 'new'
		end
	end


	def edit
		@board = Board.find params[:id]
	end

	def update
		@board = Board.find params[:id]
		if @board.update(board_params)
			redirect_to board_path(@board)
		else
			render 'edit'
		end
	end

	def destroy
		@board = Board.find(params[:id])
		@board.destroy
		redirect_to welcome_index_path
	end

	private
		def board_params
			params.require(:board).permit(:name, :description)
		end
end
