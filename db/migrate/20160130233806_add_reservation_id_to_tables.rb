class AddReservationIdToTables < ActiveRecord::Migration
  def change
    add_reference :tables, :reservation, index: true
  end
end
