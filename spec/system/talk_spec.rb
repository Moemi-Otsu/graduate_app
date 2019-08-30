require 'rails_helper'

RSpec.describe "Talk", type: :system do
  let(:user) { create(:user) }
  let(:second_user) { create(:second_user) }

  describe 'talkの新規登録' do
    it 'talkの新規登録' do
      # user
      user_create
      visit new_talk_path
      fill_in 'talk[title]', with: 'タイトルのテスト'
      fill_in 'talk[content]', with: 'コンテンツです。コンテンツです。'
      click_on 'commit'
      click_on 'commit'
      expect(page).to have_content '相談を投稿しました！'
      expect(page).to have_content 'タイトルのテスト'
      expect(page).to have_content 'コンテンツです。コンテンツです。'
    end

  end
  
  private

  def user_create
    user
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_on 'commit'
  end

end