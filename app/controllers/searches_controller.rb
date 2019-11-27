class SearchesController < ApplicationController

  def new
    @search = Search.new
  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
    @profiles = user_signed_in? ? @search.profiles : @search.profiles.limit(3)
  end

  def update
    @search = Search.find(params[:id])
    @search.update(search_params)
    redirect_to @search
  end

  private

  def search_params
    params.require(:search).permit(:keywords, :location, :role, :min_invest, :max_invest)
  end
end
