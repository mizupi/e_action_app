require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    sleep 0.2
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '必須項目に適切な値が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'アイコン画像がなくても登録できる' do
        @user.image = nil
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'user_nameが空では登録できない' do
        @user.user_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ユーザー名を入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa222'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'user_nameが11文字以上だと登録できない' do
        @user.user_name = Faker::String.random(length: 11)
        @user.valid?
        expect(@user.errors.full_messages).to include('ユーザー名は10文字以内で入力してください')
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aa111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは128文字以内で入力してください')
      end
      it 'passwordが数字のみだと登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードが正しくありません。アルファベットと数字の両方を入れてください')
      end
      it 'passwordが英字のみだと登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードが正しくありません。アルファベットと数字の両方を入れてください')
      end
      it 'passwordに全角文字を含んでいると登録できない' do
        @user.password = 'ＡＡＡ111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードが正しくありません。アルファベットと数字の両方を入れてください')
      end
    end
  end
end
