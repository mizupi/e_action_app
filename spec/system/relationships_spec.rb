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

RSpec.describe 'Relationships', type: :system do
  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    sleep 0.5
  end

  describe 'フォロー' do
    it 'ユーザーをフォロー・解除できる' do
      # @user1としてログイン
      sign_in(@user1)

      # @user1としてユーザー一覧ページへ遷移する
      visit user_path(@user2)

      # @user2をフォローする
      find('button[name="button"]').click
      expect(page).to have_content('ともだちリクエスト中')
      # カウントアップする
      expect(@user2.followers.count).to eq(1)
      expect(@user1.following.count).to eq(1)
      # ボタンの表示が変わったことを確認する
      expect(page).to have_no_content('ともだちリクエストを送る')

      # @user2をフォロー解除する
      find('button[name="button"]').click
      expect{
        expect(page.accept_confirm).to eq 'リクエストを取り消しますか？'
        sleep 0.5
        }. to change(@user2.followers, :count).by(-1)
      # カウントダウンする
      expect(@user2.followers.count).to eq(0)
      expect(@user1.following.count).to eq(0)
      # ボタンの表示が変わったことを確認する
      expect(page).to have_no_content('ともだちリクエスト中')
    end
  end
end
