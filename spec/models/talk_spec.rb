require 'rails_helper'

RSpec.describe Talk, type: :model do
  let(:user) { create(:user) }

  describe 'バリデーション確認' do
    it "titleが存在しなければ、エラーを出す" do
      talk = Talk.new
      expect(talk.valid?).to be false
      expect(talk.errors[:title]).to include("を入力してください")
    end

    it "titleが1..255文字以内であること" do
      talk = Talk.new(title: 'a' * 256)
      expect(talk.valid?).to be false
      expect(talk.errors[:title]).to include('は255文字以内で入力してください')
    end
  end
end