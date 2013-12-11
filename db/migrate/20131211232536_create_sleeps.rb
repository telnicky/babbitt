class CreateSleeps < ActiveRecord::Migration
  def change
    create_table :sleeps do |t|
      t.string :integer
      t.start_time :datetime
      t.end_time :datetime

      t.timestamps
    end
    add_index :sleeps, :integer
  end
end
