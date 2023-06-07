class AddStateForProgressToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :state_for_progress, :string
  end
end
