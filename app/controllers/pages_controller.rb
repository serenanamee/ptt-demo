class PagesController < ApplicationController
  def index

  end

  def about
    @boards = Board.all
  end

end
