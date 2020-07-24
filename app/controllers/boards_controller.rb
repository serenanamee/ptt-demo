class BoardsController < ApplicationController




def index
  @boards = Board.all
end
def new

  @board = Board.new

end
   def create

  @board = Board.new (border_params)
  if @board.save  
     redirect_to root_path, notice: "Successfully created a new board" 
  
  else
    render 'new'
  end
end

def show
      @board = Board.find(params[:id])
end

def edit
  @board = Board.find(params[:id])

end

def update
  @board = Board.find(params[:id])

  if @board.update(board_params)
     redirect_to boards_path, notice: "update"
  
  else
    render :edit
  end

end


private

def border_params
  params.require(:board).permit(:title, :intro)
end

end
