class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.date :limit, null: false
      t.integer :priority, default: 0, null: false
      t.string :status, default: "未着手"
    end
  end
end
