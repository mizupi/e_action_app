require 'rails_helper'
def basic_pass(path)
  username = ENV['BASIC_AUTH_USER']
  password = ENV['BASIC_AUTH_PASSWORD']
  visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
end

def sign_in(user)
  basic_pass root_path
  visit user_session_path
  fill_in 'user[email]', with: user.email
  fill_in 'user[password]', with: user.password
  find('button[name="button"]').click
  expect(current_path).to eq(root_path)
  sleep 0.5
end

RSpec.describe 'アクション記録', type: :system do
  before do
    @user_activity = FactoryBot.create(:user_activity)
    sleep 0.5
  end

  context 'アクションが記録できるとき' do
    it 'ログインしたユーザーはアクションを記録できる' do
      # ログインする
      basic_pass root_path
      sign_in(@user_activity.user)
      # アクションページに遷移するリンクを見つけて移動する
      find_link('アクションをきろく', href: '/activities/new').click
      expect(current_path).to eq(new_activity_path)
      # アクションボタンを見つけてクリックすると、UserActivityモデルのカウントが1上がることを確認する
      expect do
        find('button[name="button"]').click
      end.to change { UserActivity.count }.by(1)
      sleep 0.5
      # ページが移動しないことを確認する
      expect(current_path).to eq(new_activity_path)
    end
  end
end
