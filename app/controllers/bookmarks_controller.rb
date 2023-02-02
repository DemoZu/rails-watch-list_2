class BookmarksController < ApplicationController
  before_action :set_list, only: %i[new create]

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new # Needed to instantiate the form_with
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def review_params
    params.require(:bookmark).permit(:comment)
  end
end
