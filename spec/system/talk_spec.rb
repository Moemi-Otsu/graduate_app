require 'rails_helper'

RSpec.describe "Talk", type: :system do
  let(:user) { create(:user) }
  let(:second_user) { create(:second_user) }

  describe 'talkの新規登録' do
    it 'talkの新規登録' do
      second_user
      visit new_talk_path
      fill_in 'talk[title]', with: 'タイトルのテスト'
      fill_in 'talk[content]', with: 'コンテンツです。コンテンツです。'
    end

  end
end