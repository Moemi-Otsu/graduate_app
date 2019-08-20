class AddOccupationAndIndustryToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :occupation, :integer, limit: 1
    add_column :profiles, :industry, :integer, limit: 1
  end
end