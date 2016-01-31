class AddTableToReservations < ActiveRecord::Migration
  def change
    add_reference :reservations, :table, index: true
  end
end
