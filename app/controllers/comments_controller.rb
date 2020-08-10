class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    redirect_to @post
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user: current_user)
  end
  
  
end
