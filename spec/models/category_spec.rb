require 'rails_helper'

RSpec.describe Category, type: :model do

  describe 'バリデーション確認' do
    it 'nameが存在しなければ、エラーを出す' do
      category = Category.new
      expect(category.valid?).to be false
      expect(category.errors[:name]).to include("を入力してください")
    end

    it 'nameに重複があった場合、エラーを出す' do
      category1 = Category.create(name: 'カテゴリ名')
      category = Category.new(name: category1.name)
      expect(category.valid?).to be false
      expect(category.errors[:name]).to include("はすでに存在します")
    end
  end
end