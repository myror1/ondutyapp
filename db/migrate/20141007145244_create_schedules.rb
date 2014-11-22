class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.date :duty_date
      t.time :duty_time
      t.references :user, index: true

      t.timestamps
    end
  end
end
