class AddPeriodToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :period, :datetime
  end
end
