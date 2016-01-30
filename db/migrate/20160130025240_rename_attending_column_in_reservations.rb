class RenameAttendingColumnInReservations < ActiveRecord::Migration
  def change
    rename_column :reservations, :attending, :party_size
  end
end
