class PostsController < ApplicationController

  before_action :find_board, only: [:new, :create]
  before_action :authenticate_user!, except:[:show]
  
  def new
    @post = @board.posts.new
  end
  
  def create
     @post = @board.posts.new(post_params) 
    #  看板角度新增文章（少了user_id）
    # @post.user = current_user
    # @post = current_user.pots.new(post_params) 使用者角度新增文章
    if @post.save
    redirect_to @board, notice: "successfully created"      
    else
      render :new
    end
  end  

  def edit
    # @post = Post.find_by(id:params[:id],user: current_user)
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: 'successfully updated'
    else
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end
  
  

  private

  def post_params
    params.require(:post).permit(:title, :content).merge(user: current_user)
  end
  

  def find_board
    @board = Board.find(params[:board_id])

  end

  
end
