class ReservationsController < ApplicationController
  before_filter :set_restaurant

  def index
    @upcoming_reservations = @restaurant.upcoming_reservations
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    reserve_params = params[:reservation]
    blah = Date.new(reserve_params["start_time(1i)"].to_i,reserve_params["start_time(2i)"].to_i,reserve_params["start_time(3i)"].to_i,reserve_params["start_time(4i)"].to_i)

    puts "================"
    puts @reservation.start_time
    puts "================"

    # @reservation.end_time = params[:start_time] + 1.hour

    if @reservation.save
      respond_to do |format|
        format.html
        format.js { render 'show', content_type: 'text/javascript' }
      end
    end
  end

  private

    def set_restaurant
      @restaurant = Restaurant.first
    end

    def reservation_params
      params.require(:reservation).permit(:start_time, :end_time, :party_size, :restaurant_id, :name)
    end

end
