require 'rails_helper'

describe Restaurant do

  before(:each) do
    @restaurant = FactoryGirl.create(:restaurant)
  end

  it 'returns only upcoming reservations' do
    future_reservation = create(:reservation, restaurant_id: @restaurant.id)
    past_reservation   = build(:reservation, restaurant_id: @restaurant.id, start_time: Date.today - 5.days)
    past_reservation.save(:validate => false)

    result = @restaurant.upcoming_reservations
    expect(result).to eq([future_reservation])
  end

end

