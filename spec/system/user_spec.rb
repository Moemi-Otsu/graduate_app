require 'rails_helper'

RSpec.describe User, type: :system do
  let(:user) { create(:user) }
  let(:second_user) { create(:second_user) }

  describe 'Userの新規登録' do
  end

  describe 'ログイン／ログアウト' do
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
        # select '管理者ユーザー', from: 'user[role]'
        click_on 'commit'
        expect(page).to have_content '変更しました。'
        expect(page).to have_content 'edit_name'
        expect(page).to have_content 'edit@mail.com'
        # expect(page).to have_selector '.#{information', content: 'admin'
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