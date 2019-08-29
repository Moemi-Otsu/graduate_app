require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:second_user) { create(:second_user) }

  describe 'バリデーション確認' do

    it "nameが存在しなければ、エラーを出す" do
      user = User.new
      # byebug
      expect(user.valid?).to be false
      expect(user.errors[:name]).to include("を入力してください")
      expect(user.errors.full_messages).to include("名前を入力してください")
    end

    it "nameに重複があれば、エラーを出す" do
      duplicated_user = User.new(name: user.name)
      # byebug
      expect(duplicated_user.valid?).to be false
      expect(duplicated_user.errors[:name]).to include('はすでに存在します')
    end

  end

end