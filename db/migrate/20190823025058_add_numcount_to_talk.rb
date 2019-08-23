class AddNumcountToTalk < ActiveRecord::Migration[5.2]
  def change
    add_column :talks, :likes_count, :integer
  end
end
