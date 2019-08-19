class RemoveOccupationAndIndustryFromProfiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :occupation, :string
    remove_column :profiles, :industry, :string
  end
end
