require 'rails_helper'

RSpec.describe User, type: :system do
  let(:user) { create(:user) }
  let(:second_user) { create(:second_user) }

  describe 'User一覧（role:adminのみの権限）' do
    context '正常系' do
      it 'Userが表示されること' do
        user
        visit users_path
        expect(current_path).to eq users_path
      end
    end
  
    context '異常系' do
      it 'ログインしていない、もしくはadmin権限ではないユーザーの場合、一覧ページが表示されない' do
        second_user
        byebug
        visit users_path
        expect(duplicated_user.valid?).to be false
        expect(duplicated_user.errors[:name]).to include('はすでに存在します')
        expect(page).to have_content '管理者ユーザー以外アクセスできません。'
      end
    end
  end

end