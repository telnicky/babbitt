class AddIndexToHearts < ActiveRecord::Migration
  def change
    add_index :hearts, :start_time
  end
end
