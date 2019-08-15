class RemoveTimestampFromTalkCategory < ActiveRecord::Migration[5.2]
  def change
    remove_column :talk_categories, :created_at, :datetime
    remove_column :talk_categories, :updated_at, :datetime
  end
end
