class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :substance
      t.text :content
      t.timestamps
    end
  end
end
