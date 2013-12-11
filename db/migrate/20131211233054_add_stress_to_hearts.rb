class AddStressToHearts < ActiveRecord::Migration
  def change
    add_column :hearts, :stress_level, :integer
  end
end
