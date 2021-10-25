class Contact < ApplicationRecord
  enum subject: { サイトに関するお問い合わせ: 0, 有害投稿の報告: 1, その他のお問い合わせ: 2 }

  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :subject, presence: true
  validates :message, length: {in: 1..500}
end
