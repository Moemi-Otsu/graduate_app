class CreateTalks < ActiveRecord::Migration[5.2]
  def change
    create_table :talks do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.boolean :complete, default: false, null: false

      t.timestamps
    end
  end
end
