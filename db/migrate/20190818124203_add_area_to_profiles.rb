class AddAreaToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :area, :integer, default: 2, null: false, limit: 1
  end
end
