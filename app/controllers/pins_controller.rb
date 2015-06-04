class PinsController < ApplicationController

	def show
		@pin = Pin.find(params[:id])
		@board = Board.find(params[:board_id])
	end

	def new
		@pin = Pin.new
		@board = Board.find(params[:board_id])
	end


	def create
		@board = Board.find(params[:board_id])

		@pin = @board.pins.create(pin_params)
		if @pin.save
			redirect_to board_pin_path(@board, @pin)
		else
			render 'new'
		end
	end

	def edit
		@board = Board.find(params[:board_id])
		@pin = @board.pins.find(params[:id])
	end

	def update
		
		@board = Board.find(params[:board_id])
		@pin = @board.pins.find(params[:id])

		if @pin.save
			redirect_to board_pin_path(@board, @pin)
		else
			render 'edit'
		end
	end


	def destroy
		@board = Board.find(params[:board_id])
		@pin = Pin.find(params[:id])
		@pin.destroy
		redirect_to user_board_path(current_user, @board)
	end

	private
		def pin_params
			params.require(:pin).permit(:title, :description, :url)
		end
end
