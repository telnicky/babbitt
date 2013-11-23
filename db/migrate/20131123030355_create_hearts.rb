class CreateHearts < ActiveRecord::Migration
  def change
    create_table :hearts do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :bpm
      t.integer :so2_sat

      t.timestamps
    end
  end
end
