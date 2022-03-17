require 'rails_helper'

RSpec.describe UserActivity, type: :model do
  before do
    @user_activity = FactoryBot.build(:user_activity)
  end

  describe 'アクションの記録' do
    context 'アクションが登録できる場合' do
      it '必須項目に適切な値が存在すれば登録できる' do
        expect(@user_activity).to be_valid
      end
    end

    context 'アクションが登録できない場合' do
      it 'userが紐づいていないと登録できない' do
        @user_activity.user = nil
        @user_activity.valid?
        expect(@user_activity.errors.full_messages).to include('User must exist')
      end
      it 'activityが紐づいていないと登録できない' do
        @user_activity.activity = nil
        @user_activity.valid?
        expect(@user_activity.errors.full_messages).to include('Activity must exist')
      end
    end
  end
end
