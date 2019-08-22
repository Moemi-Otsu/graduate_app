require 'rails_helper'

RSpec.describe "Talk", type: :system do

  before do
    @user = User.create!(name: 'hoge', email: 'hoge@mail.com', password: 'hogehoge')
  end

  describe 'newアクション' do
    # let(:user) { User.new(name: 'hoge', age: age) }

    context 'userの新規登録テスト' do
      it '通常の新規登録' do
        visit new_task_path
      end
    end

  end
end