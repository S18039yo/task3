class SearchesController < ApplicationController
    before_action :authenticate_user!

  def result
  end 

  def search
    @range = params[:range]
    @content = params[:word]
    if @range == "User"
      @users = User.looks(params[:search], params[:word])
      render "search"
    else
      @books = Book.looks(params[:search], params[:word])
      render "search"
    end
  end
  
end
