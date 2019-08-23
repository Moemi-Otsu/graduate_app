class AddNotNullLikesCountToTalk < ActiveRecord::Migration[5.2]
  def up
    change_column_null :talks, :likes_count, false, 0
  end

  def down
    change_column_null :talks, :likes_count, true, nil
  end
end
