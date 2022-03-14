require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    # ユーザー2名を事前に生成して登録
    @user = FactoryBot.create(:user)
    @another_user = FactoryBot.create(:user)
    # app/models/user.rbで定義したfollowメソッド（友達申請）を実行
    @relationship = @user.follow(@another_user)
    sleep 0.1
  end

  describe '友達申請' do
    context '友達申請に成功する場合' do
      it 'follower_idとfollowed_idがある場合は友達申請に成功する' do
        expect(@relationship).to be_valid
      end
    end

    context '友達申請に失敗する場合' do
      it '友達申請する側の値（follower_id）がなければ保存できない' do
        @relationship.follower_id = ''
        @relationship.valid?
        expect(@relationship.errors.full_messages).to include('Follower must exist')
      end
      it '友達申請される側の値（followed_id）がなければ保存できない' do
        @relationship.followed_id = ''
        @relationship.valid?
        expect(@relationship.errors.full_messages).to include('Followed must exist')
      end
      it '同じ組み合わせの友達申請のデータがすでに保存されている場合は保存できない' do
        @relationship.save
        # @relationshipとは別のレコードとしてanother_relationshipを用意
        another_relationship = @user.follow(@another_user)
        # another_relationshipに@relationshipと同じ値を代入
        another_relationship.follower_id = @relationship.follower_id
        another_relationship.followed_id = @relationship.followed_id
        another_relationship.valid?
        expect(another_relationship.errors.full_messages).to include('Follower has already been taken')
      end
    end
  end
end
