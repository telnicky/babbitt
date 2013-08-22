class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :amount

      t.timestamps
    end
  end
end
