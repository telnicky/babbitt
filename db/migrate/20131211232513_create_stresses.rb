class CreateStresses < ActiveRecord::Migration
  def change
    create_table :stresses do |t|
      t.string :integer
      t.start_time :datetime
      t.end_time :datetime

      t.timestamps
    end
    add_index :stresses, :integer
  end
end
