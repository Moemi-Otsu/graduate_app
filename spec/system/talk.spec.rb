require 'rails_helper'

# RSpec.describe "トーク機能", type: :system do
#   describe '' do
#     context '' do
#       it 'does something' do
#         # ... your test
#         talk = FactoryBot.create(:talk)
#         visit new_talk_path
#         save_and_open_page
#         fill_in 'title', with: 'タイトルx'
#       end
#     end
#   end
# end

RSpec.describe "トーク機能", type: :system do
  context '' do
    it 'does something' do
      # ... your test
      talk = FactoryBot.create(:talk)
      visit new_talk_path
      save_and_open_page
      fill_in 'title', with: 'タイトルx'
    end
  end
end