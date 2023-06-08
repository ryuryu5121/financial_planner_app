class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.string :FP_id
      t.date :day
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
