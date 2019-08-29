require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:second_user) { create(:second_user) }

  describe 'バリデーション確認' do
    it "nameが存在しなければ、エラー" do
      user = User.new
      expect(user.valid?).to be false
      expect(user.errors[:name]).to include("を入力してください")
      expect(user.errors.full_messages).to include("名前を入力してください")
    end
  end

end