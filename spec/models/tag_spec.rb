require 'rails_helper'

RSpec.describe 'Tagモデルのテスト', type: :model do
  let(:tag) { FactoryBot.build(:tag) }

  describe 'アソシエーションのテスト' do
    context 'TagMapモデルとの関係' do
      it '1:Nとなっている' do
        expect(Tag.reflect_on_association(:tag_maps).macro).to eq :has_many
      end
    end
  end

end