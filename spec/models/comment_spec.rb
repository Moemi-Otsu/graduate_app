require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user) }

  describe 'バリデーション確認' do
    it 'content内容が1文字以上入力されていること' do
      comment = Comment.new
      expect(comment.valid?).to be false
      expect(comment.errors[:content]).to include("は1文字以上で入力してください")
    end
  end
end