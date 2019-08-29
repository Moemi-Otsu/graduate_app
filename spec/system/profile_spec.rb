require 'rails_helper'

RSpec.describe Profile, type: :system do
  let(:user) { create(:user) }
  let(:second_user) { create(:second_user) }

  describe 'Profileの新規登録' do
    second_user
    visit new_profile_path
    fill_in 'profile[age]', with: ''
    select 'kanto', from: 'profile[area]'
    select 'sales', from: 'profile[occupation]'
    select 'it_communication', from: 'profile[industry]'
    fill_in 'profile[image]', with: nil
    fill_in 'profile[working_company]', with: 'ほげ株式会社'
    select 'half_year', from: 'profile_length_worked'
    fill_in 'profile[previous_company]', with: 'パストカンパニージャパン株式会社'
    fill_in 'profile[address]', with: '東京都世田谷区代沢2-8'
    click_on 'commit'
    expect(page).to have_content 'アカウント登録が完了しました。'
  end

end