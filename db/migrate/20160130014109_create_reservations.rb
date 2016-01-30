class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :start_time
      t.integer :attending

      t.timestamps
    end
  end
end
