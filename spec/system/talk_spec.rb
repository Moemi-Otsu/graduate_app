require 'rails_helper'

# 例文
# RSpec.describe "トーク機能", type: :system do
#   describe '#greet' do

#     context '12歳以下の場合' do
#       it 'ひらがなで答えること' do
#         # ... your test
          # user = User.new(name: 'たろう', age: 12)
          # expect(user.greet).to eq 'ぼくはたろうだよ。'
#       end
#     end

#     context '12歳以下の場合' do
#       it 'ひらがなで答えること' do
#         # ... your test
          # user = User.new(name: 'たろう', age: 13)
          # expect(user.greet).to eq '僕はたろうです。'
#       end
#     end

#   end
# end

RSpec.describe "Talk", type: :system do

  before do
    @user = User.create!(name: 'hoge', email: 'hoge@mail.com', password: 'hogehoge')
  end

  describe 'indexアクション' do
    # let(:user) { User.new(name: 'hoge', age: age) }

    context 'talkの新規投稿テスト' do
      it 'does something' do
        # ... your test
      end
    end

    xcontext '' do
      it 'does something' do
        # ... your test
        talk = FactoryBot.create(:talk)
        visit new_talk_path
        save_and_open_page
        fill_in 'title', with: 'タイトルx'
      end
    end

  end
end