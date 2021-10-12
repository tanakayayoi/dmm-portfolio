class Post < ApplicationRecord

  belongs_to :user
  attachment :image
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def save_tag(sent_tags)
    #現在存在するすべてのタグの取得
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    #既存のタグ
    old_tags = current_tags - sent_tags
    #新規のタグ
    new_tags = sent_tags - current_tags
    #送信されてきたタグから既存のタグを削除
    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end
    #新規のタグを保存
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_post_tag
    end
  end

end
