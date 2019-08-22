require 'rails_helper'

RSpec.describe "User", type: :system do

  before do
    @user = User.create!(name: 'hoge', email: 'hoge@mail.com', password: 'hogehoge')
  end

  describe 'newアクション' do
    let(:user) { User.new(name: 'hoge', age: age) }

    context 'userの新規登録テスト' do
      it '通常の新規user登録' do
        visit new_user_registration_path
        fill_in 'user_name', with: 'aaa'
        fill_in 'user_email', with: 'aaa@mail.com'
        fill_in 'user_password', with: 'aaaaaa'
        fill_in 'user_password_confirmation', with: 'aaaaaa'
        click_on 'commit'
        # 新規投稿成功後のリダイレクト先-プロフィールページの見出しが表示されていたら成功
        expect(page).to have_content('プロフィール')
      end

      it '新規user作成-プロフィール登録' do
        visit new_profile_path
        fill_in 'profile_age', with: '32'
        select '関東', from: 'profile_area'
        # click_on 'commit'
      end
    end

  end
end