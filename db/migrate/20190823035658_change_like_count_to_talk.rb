class ChangeLikeCountToTalk < ActiveRecord::Migration[5.2]
  def change
    change_column_null :talks, :likes_count, null: false
    change_column :talks, :likes_count, :integer, default: 0
  end
end
