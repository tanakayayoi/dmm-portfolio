require 'rails_helper'

RSpec.describe 'Postモデルのテスト', type: :model do
  let(:post) { FactoryBot.build(:post) }

  describe '新規投稿のテスト' do
    it "タイトルがない場合は投稿できないこと" do
      post.title = "タイトル"
      expect(post).to be_valid  # post.valid? が true になればパスする
    end

    it "本文が１文字以上２００文字以下でない場合は投稿できないこと" do
      post.body = "投稿の本文。"
      expect(post).to be_valid  # post.valid? が true になればパスする
    end
  end


  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end

end