class BoardsController < ApplicationController

  include UsersHelper

  before_action :find_board, only: [:show, :update, :edit , :destroy]
 
def index
  @boards = Board.all
end


def show
  @posts = @board.posts.all
end

def new
  if user_signed_in?
    @board = Board.new
  else
    redirect_to root_path, notice: 'successfully signed_in'
  end
end

def create
  @board = Board.new (board_params)
  if @board.save  
     redirect_to root_path, notice: "Successfully created a new board" 
  else
    render 'new'
  end
end


def edit
end

def update
  @board = Board.find(params[:id])

  if @board.update(board_params)
     redirect_to boards_path, notice: "updated"
  
  else
    render :edit
  end
end

def destroy
 @board.destroy
 redirect_to boards_path, notice: "delete" 
end



private

def board_params
  params.require(:board).permit(:title, :intro)
end

def find_board
  @board = Board.find(params[:id])  
end


end
