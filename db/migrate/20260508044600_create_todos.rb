class CreateTodos < ActiveRecord::Migration[8.1]
  def change
    create_table :todos do |t|
      t.string :content
      t.references :goal, null: false, foreign_key: true
      t.integer :position
      t.boolean :done, null: false, default:false

      t.timestamps
    end
  end
end
