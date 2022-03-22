require 'rails_helper'

RSpec.describe Contact, type: :model do
  before do
    @contact = FactoryBot.build(:contact)
  end

  describe 'リクエストフォーム' do
    context 'リクエストフォームの送信ができる場合' do
      it '必須項目に適切な値が存在すれば登録できる' do
        expect(@contact).to be_valid
      end
    end
    context 'リクエストフォームの送信ができない場合' do
      it 'nameが空では送信できない' do
        @contact.name = ''
        @contact.valid?
        expect(@contact.errors.full_messages).to include("ユーザー名を入力してください")
      end
      it 'contentが空では登録できない' do
        @contact.content = ''
        @contact.valid?
        expect(@contact.errors.full_messages).to include("内容を入力してください")
      end
      it 'nameが11文字以上だと登録できない' do
        @contact.name = Faker::String.random(length: 11)
        @contact.valid?
        expect(@contact.errors.full_messages).to include('ユーザー名は10文字以内で入力してください')
      end
      it 'contentが101文字以上だと登録できない' do
        @contact.content = Faker::String.random(length: 101)
        @contact.valid?
        expect(@contact.errors.full_messages).to include('内容は100文字以内で入力してください')
      end
      it 'userが紐づいていないと登録できない' do
        @contact.user = nil
        @contact.valid?
        expect(@contact.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
