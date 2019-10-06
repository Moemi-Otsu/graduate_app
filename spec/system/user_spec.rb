require 'rails_helper'

RSpec.describe User, type: :system do
  let(:user) { create(:user) }
  let(:second_user) { create(:second_user) }

  describe 'Userの新規登録' do
    it 'User新規作成' do
      visit new_user_registration_path
      fill_in 'user[name]', with: 'hogehoge'
      fill_in 'user[email]', with: 'hogehoge@mail.com'
      fill_in 'user[password]', with: 'hogehoge'
      fill_in 'user[password_confirmation]', with: 'hogehoge'
      click_on 'commit'
      expect(page).to have_content 'アカウント登録が完了しました。'
    end
  end

  describe 'Sessionログイン／ログアウトの確認' do
    it 'ログインできること' do
      user
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_on 'commit'
      expect(page).to have_content 'ログインしました。'
    end
    it 'ログアウトできること' do
      user
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_on 'commit'
      click_on 'ログアウト'
      expect(page).to have_content 'ログアウトしました。'
    end
  end

  describe 'User一覧（role:adminのみの権限）' do
    context '正常系' do
      it 'Userが表示されること' do
        user
        visit users_path
        expect(current_path).to eq users_path
      end

      it 'Userの編集ができること' do
        user
        visit edit_user_path(second_user.id)
        fill_in 'user[name]', with: 'edit_name'
        fill_in 'user[email]', with: 'edit@mail.com'
        click_on 'commit'
        expect(page).to have_content '変更しました。'
        expect(page).to have_content 'edit_name'
        expect(page).to have_content 'edit@mail.com'
      end
    end
  
    context '異常系' do
      it 'ログインしていない、もしくはadmin権限ではないユーザーの場合、一覧ページが表示されない' do
        second_user
        visit users_path
        expect(page).to have_content '管理者ユーザー以外アクセスできません。'
      end
    end
  end

end