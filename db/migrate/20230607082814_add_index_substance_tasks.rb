class AddIndexSubstanceTasks < ActiveRecord::Migration[6.1]
  def change
    add_index :tasks, :substance
  end

end
