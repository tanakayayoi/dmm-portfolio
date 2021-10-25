FactoryBot.define do
  factory :post do
    title {"タイトル"}
    body  {"投稿の本文。"}
    tag   {"タグ名"}
    user
  end
end