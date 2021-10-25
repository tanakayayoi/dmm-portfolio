require 'rails_helper'

RSpec.describe 'PostCommentモデルのテスト', type: :model do
  let(:post_comment) { FactoryBot.build(:post_comment) }

  describe 'コメント投稿のテスト' do
    it "本文が１文字以上１００文字以下でない場合は投稿できないこと" do
      post_comment.comment = "コメント本文"
      expect(post_comment).to be_valid
    end
  end


  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(PostComment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Postモデルとの関係' do
      it 'N:1となっている' do
        expect(PostComment.reflect_on_association(:post).macro).to eq :belongs_to
      end
    end
  end

end