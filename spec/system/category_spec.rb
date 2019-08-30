require 'rails_helper'

RSpec.describe Category, type: :system do
  let(:user) { create(:user) }
  let(:second_user) { create(:second_user) }

  describe 'CategoryのCRUD' do
    it 'Category一覧ページへのアクセス' do
      user_logged_in
      visit categories_path
      expect(page).to have_content 'カテゴリ一覧'
    end

    it 'Category新規作成' do
      user_logged_in
      visit new_category_path
      fill_in 'category[name]', with: 'Category01'
      click_on 'commit'
      expect(page).to have_content 'Category01'
    end
    
    it 'Category編集' do
      category = Category.create(name: "Category01")
      user_logged_in
      visit edit_category_path(category.id)
      fill_in 'category[name]', with: 'Category01-Edit'
      click_on 'commit'
      expect(page).to have_content 'Category01-Edit'
    end
  end
end