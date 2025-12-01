class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|

      t.string :title
      t.text :description
      t.integer :status
      t.integer :user_id
      t.date :due_date
      t.datetime :completed_date

      t.timestamps
    end
  end
end
