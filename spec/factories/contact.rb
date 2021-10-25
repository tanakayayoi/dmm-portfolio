FactoryBot.define do
  factory :contact do
    name    {"山田太郎"}
    email   {"test@gmail.com"}
    phone   {"01234567890"}
    subject {"サイトに関するお問い合わせ"}
    message {"お問い合わせ内容。"}
  end
end