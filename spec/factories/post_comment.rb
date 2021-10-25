FactoryBot.define do
  factory :post_comment do
    comment {"コメント本文。"}
    post
    user
  end
end