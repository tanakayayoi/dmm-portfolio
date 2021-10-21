class Contact < ApplicationRecord
  enum subject: { サイトに関するお問い合わせ: 0, 有害投稿の報告: 1, その他のお問い合わせ: 2 }
end
