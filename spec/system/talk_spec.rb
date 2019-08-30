require 'rails_helper'

RSpec.describe "Talk", type: :system do
  let(:user) { create(:user) }
  let(:second_user) { create(:second_user) }

  describe 'talkのCRUD - ログイン状態' do
    it 'talkの新規登録' do
      user_logged_in
      visit new_talk_path
      fill_in 'talk[title]', with: 'タイトルのテスト'
      fill_in 'talk[content]', with: 'コンテンツです。コンテンツです。'
      click_on 'commit'
      click_on 'commit'
      expect(page).to have_content '相談を投稿しました！'
      expect(page).to have_content 'タイトルのテスト'
      expect(page).to have_content 'コンテンツです。コンテンツです。'
    end

    it 'talkの編集ができること' do
      user_logged_in
      talk = user.talks.first
      visit edit_talk_path(talk.id)
      fill_in 'talk[title]', with: 'これはタイトルのテスト編集済み'
      fill_in 'talk[content]', with: 'これはコンテンツのテスト編集済み'
      click_on 'commit'
      expect(page).to have_content '編集しました。'
      expect(page).to have_content 'これはタイトルのテスト編集済み'
      expect(page).to have_content 'これはコンテンツのテスト編集済み'
    end

    it 'talkの削除ができること' do
      user_logged_in
      talk = user.talks.first
      visit talk_path(talk.id)
      click_on '削除'
      expect(Talk.all).not_to have_content talk.title
      expect(Talk.all).not_to have_content talk.content
    end

    it 'talkのコメント締め切り（complete）がtrueになった時、
    コメントが投稿できなくすること' do
      user_logged_in
      talk = user.talks.first
      visit talk_path(talk.id)
      click_on '相談を解決(コメントを締め切る)'
      visit talk_path(talk.id)
      expect(page).to have_content 'この相談は解決済みとなり、コメントを締め切りました。'
    end
  end

end