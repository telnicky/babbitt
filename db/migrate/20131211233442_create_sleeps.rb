class CreateSleeps < ActiveRecord::Migration
  def change
    create_table :sleeps do |t|
      t.integer :index
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
