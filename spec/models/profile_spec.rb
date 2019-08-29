require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe 'バリデーション確認' do
    it "age（年齢）が存在しなければ、エラーを出す" do
      profile = Profile.new
      expect(profile.valid?).to be false
      expect(profile.errors[:age]).to include("を入力してください")
    end

    it "area（お住いのエリア）が存在しなければ、エラーを出す" do
      profile = Profile.new(area: nil)
      expect(profile.valid?).to be false
      expect(profile.errors[:area]).to include("を入力してください")
    end

    it "industry（お住いのエリア）が存在しなければ、エラーを出す" do
      profile = Profile.new
      expect(profile.valid?).to be false
      expect(profile.errors[:industry]).to include("を入力してください")
    end

    it "occupation（業種）が存在しなければ、エラーを出す" do
      profile = Profile.new
      expect(profile.valid?).to be false
      expect(profile.errors[:occupation]).to include("を入力してください")
    end
  end
end