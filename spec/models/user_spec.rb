require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  let(:second_user) { create(:second_user) }

  describe 'バリデーション確認' do
    it "nameが存在しなければ、エラーを出す" do
      user = User.new
      expect(user.valid?).to be false
      expect(user.errors[:name]).to include("を入力してください")
      expect(user.errors.full_messages).to include("名前を入力してください")
    end

    it "nameに重複があれば、エラーを出す" do
      duplicated_user = User.new(name: user.name)
      expect(duplicated_user.valid?).to be false
      expect(duplicated_user.errors[:name]).to include('はすでに存在します')
    end

    it "passwordが存在しなければ、エラーを出す" do
      user = User.new(password: nil)
      expect(user.valid?).to be false
      expect(user.errors[:password]).to include('を入力してください')
    end

    it "passwordが6文字以上でなければ、エラーを出す" do
      user = User.new(password: 'aaa')
      expect(user.valid?).to be false
      expect(user.errors[:password]).to include('は6文字以上で入力してください')
    end

    it "passwordが128文字以内でなければ、エラーを出す" do
      user = User.new(password: 'a' * 129)
      expect(user.valid?).to be false
      expect(user.errors[:password]).to include('は128文字以内で入力してください')
    end

    it "emailに重複があれば、エラーを出す" do
      duplicated_user = User.new(email: user.email)
      expect(duplicated_user.valid?).to be false
      expect(duplicated_user.errors[:email]).to include('はすでに存在します')
    end

    it "emailに@を含む前後の文字列が含まれていなければ、エラーを出す" do
      user = User.new(email: 'asdfaa')
      expect(user.valid?).to be false
      expect(user.errors[:email]).to include('は不正な値です')
    end
  end
end