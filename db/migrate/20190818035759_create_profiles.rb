class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :age
      t.text :image
      t.string :working_company
      t.string :previous_company
      t.integer :length_worked
      t.string :occupation
      t.string :industry
      t.string :area
      t.string :address
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
