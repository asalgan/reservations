class ReservationsController < ApplicationController
  before_filter :set_restaurant

  def index
    @upcoming_reservations = @restaurant.upcoming_reservations
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.start_time = @reservation.start_time.beginning_of_hour
    @reservation.end_time = @reservation.start_time + 1.hour

    is_available = Reservation.check_availability(@reservation)

    if is_available == true

      respond_to do |format|
        if @reservation.save

          table = Table.create_table(@restaurant, @reservation)
          @reservation.update(table: table)

          format.html { render action: 'index' }
          format.js   { render action: 'create', status: :created, location: @reservation }
        else
          format.html { render action: 'index', status: :unprocessable_entity }
          format.js   { render 'error', status: :unprocessable_entity, errors: @reservation.errors.full_messages }
        end
      end

    else
      respond_to do |format|
        format.js { render 'error' }
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
