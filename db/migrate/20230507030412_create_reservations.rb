class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :day
      t.string :time
      t.date :start_time
      t.text :content

      t.timestamps
    end
  end
end
