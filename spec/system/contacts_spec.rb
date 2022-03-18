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
  sleep 0.1
  expect(current_path).to eq(root_path)
  sleep 0.5
end

RSpec.describe "Contacts", type: :system do
  before do
    @contact = FactoryBot.create(:contact)
  end

  it 'ログインしたユーザーはアクションリクエストフォームからリクエストできる' do
    # ログインする
    basic_pass root_path
    sign_in(@contact.user)
    # リクエストフォームページに遷移する
    visit new_contact_path
    # フォームに情報を入力する
    fill_in 'contact[name]', with: @contact.name
    fill_in 'contact[content]', with: @contact.content
    # コメントを送信すると、Contactモデルのカウントが1上がることを確認する
    sleep 0.5
    expect{find('button[name="button"]').click}.to change {Contact.count }.by(1)
    sleep 0.5
    # 詳細ページにリダイレクトされることを確認する
    expect(current_path).to eq(root_path)
  end
end
