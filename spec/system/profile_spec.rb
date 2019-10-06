require 'rails_helper'

RSpec.describe Profile, type: :system do
  let(:image_path) { File.join(Rails.root, 'spec/fixtures/image.jpg') }
  let(:image) { Rack::Test::UploadedFile.new(image_path) }

  describe 'Profileの新規登録' do
    it 'Profileが新規登録できるか' do
      visit new_user_registration_path
      fill_in 'user[name]', with: 'hogehoge'
      fill_in 'user[email]', with: 'hogehoge@mail.com'
      fill_in 'user[password]', with: 'hogehoge'
      fill_in 'user[password_confirmation]', with: 'hogehoge'
      click_on 'commit'
      visit new_profile_path
      fill_in 'profile[age]', with: '27'
      select '関東', from: 'profile[area]'
      select '営業職', from: 'profile[occupation]'
      select 'IT・通信', from: 'profile[industry]'
      attach_file 'profile[image]', "#{Rails.root}/spec/files/default.jpg"
      fill_in 'profile[working_company]', with: 'ほげ株式会社'
      select '半年以下', from: 'profile_length_worked'
      fill_in 'profile[previous_company]', with: 'パストカンパニージャパン株式会社'
      fill_in 'profile[address]', with: '東京都世田谷区代沢2-8'
      click_on 'commit'
      expect(page).to have_content 'プロフィールを作成しました。「マイページ」から確認いただけます。'
    end
  end

end