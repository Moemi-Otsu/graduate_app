require 'rails_helper'

RSpec.describe Comment, type: :system do
  let(:user) { create(:user) }
  let(:second_user) { create(:second_user) }
  # let(:comment) { create(:comment, talk_id: user.talk.first.id) }
  

  describe 'CommentのCRUD機能' do
    it 'Commentの新規投稿ができること' do
      comment_new
      expect(page).to have_content 'コメントを投稿しました。'
      expect(page).to have_content 'CommentCommentComment'
    end

    it 'Commentの編集ができること' do
      user_logged_in
      talk = user.talks.first
      visit talk_path(talk.id)
      click_on 'コメントする'
      fill_in 'comment[content]', with: 'CommentCommentComment'
      click_on 'commit'
      comment = talk.comments.first
      visit edit_talk_comment_path(talk.id, comment.id)
      fill_in 'comment[content]', with: 'Edit-CommentCommentComment'
      click_on 'commit'
      expect(page).to have_content 'Edit-CommentCommentComment'
    end

    it 'Commentの削除ができること' do
      user_logged_in
      talk = user.talks.first
      visit talk_path(talk.id)
      click_on 'コメントする'
      fill_in 'comment[content]', with: 'CommentCommentComment'
      click_on 'commit'
      find(:css, "button[id$='dropdown1']").click
      find(:css, "a[id$='comment_delete']").click
      visit talk_path(talk.id)
      expect(page).not_to have_content 'CommentCommentComment'
      expect(page).not_to have_content 'コメントを削除しました。'
    end
  end

  private

  def comment_new
    user_logged_in
    talk = user.talks.first
    visit talk_path(talk.id)
    click_on 'コメントする'
    fill_in 'comment[content]', with: 'CommentCommentComment'
    click_on 'commit'
  end

end