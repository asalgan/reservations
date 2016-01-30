class AddEndTimeToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :end_time, :datetime
  end
end
