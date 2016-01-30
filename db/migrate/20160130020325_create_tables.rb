class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :table_type
      t.references :restaurant, index: true

      t.timestamps
    end
  end
end
