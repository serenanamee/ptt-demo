class BoardsController < ApplicationController


  before_action :find_board, only: [:show, :update, :edit , :destroy]

  before_action :authenticate_user!, except: [:index, :show]
 
def index
  @boards = Board.all
end


def show
end

def new
    @board = Board.new
end

def create
  @board = Board.new (board_params)
  if @board.save  
     redirect_to boards_path, notice: "Successfully created a new board" 
  else
    render 'new'
  end
end


def edit
end

def update
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
