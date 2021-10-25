require 'rails_helper'

RSpec.describe 'Contactモデルのテスト', type: :model do
  let(:contact) { FactoryBot.build(:contact) }

  describe 'お問い合わせ送信のテスト' do
    it "氏名がない場合は送信できないこと" do
      contact.name = "氏名"
      expect(contact).to be_valid
    end

    it "メールアドレスがない場合は送信できないこと" do
      contact.email = "メールアドレス"
      expect(contact).to be_valid
    end

    it "電話番号がない場合は送信できないこと" do
      contact.phone = "電話番号"
      expect(contact).to be_valid
    end

    it "メッセージが１文字以上５００文字以下でない場合は送信できないこと" do
      contact.message = "お問い合わせ内容"
      expect(contact).to be_valid
    end
  end

end