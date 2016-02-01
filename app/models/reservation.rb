class Reservation < ActiveRecord::Base
  include ReservationsHelper
  belongs_to :restaurant
  belongs_to :table

  validates :start_time, presence: true
  validates :name, presence: true
  validates :party_size, presence: true
  validate  :not_past

  def not_past
    if start_time.past?
      errors.add :start_time, "cannot be in past"
    end
  end

  def self.check_availability(reservation)

    table_type = ReservationsHelper.table_type(reservation.party_size)
    same_reserved_time = where(start_time: reservation.start_time.beginning_of_hour).joins(:table).where(:tables => { :table_type => table_type }).count

    if same_reserved_time > 0
      at_capacity = Table.at_capacity?(table_type, same_reserved_time)
      at_capacity == true ? false : true
    else
      true
    end

  end

end
