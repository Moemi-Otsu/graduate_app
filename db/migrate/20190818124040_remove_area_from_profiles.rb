class RemoveAreaFromProfiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :area, :string
  end
end
