class ReservationsController < ApplicationController
  before_action :ensure_logged_in, only: [:create, :edit, :destroy]
  before_action :load_restaurant

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end

  def edit
    # @reservation = Reservation.find(params[:id])
  end

  def create
  # @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user = current_user

    if @reservation.save
      redirect_to restaurant_url(@restaurant), notice: 'Reservation created successfully'
    else
      render 'restaurants/show'
    end
  end

  def update
    # @reservation = Reservation.find(params[:id])
    if @reservation.update_attributes(reservation_params)
      redirect_to restaurant_url
    else
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to restaurants_url
  end

  private
  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def reservation_params
    params.require(:reservation).permit(:restaurant_id, :user_id, :size, :when)
  end
end
