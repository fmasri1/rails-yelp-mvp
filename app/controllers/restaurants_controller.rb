class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[show edit update destroy]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    # @restaurant from set_restaurant
    @reviews = Review.select { |review| review.restaurant_id == @restaurant.id }
  end

  def edit
    # @restaurant from set_restaurant
  end

  def update
    # @restaurant from set_restaurant
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      # COME BACK HERE
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path, status: :see_other
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
