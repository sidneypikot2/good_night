class CreateClockIns < ActiveRecord::Migration[7.0]
  def change
    create_table :clock_ins do |t|
      t.timestamp :wake_time
      t.timestamp :sleep_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
