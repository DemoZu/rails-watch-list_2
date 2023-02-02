class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    # redirect_to lists_path(@list)
  end

  def show
    @list = List.find(params[:id])
    @movies = @list.movies
  end

  private

  def list_params
    params.require(:list).permit(:name, :movie_id, :bookmark_ids)
  end
end
