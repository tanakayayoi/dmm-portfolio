require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'ユーザー登録' do
    it "ニックネーム、メールアドレス、パスワードと確認用パスワードが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid  # user.valid? が true になればパスする
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it '1:Nとなっている' do
        expect(User.reflect_on_association(:posts).macro).to eq :has_many
      end
    end
  end

end