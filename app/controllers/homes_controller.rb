class HomesController < ApplicationController
  # 過去１週間の投稿をいいね順に５つ表示
  def top
    to = Time.current.at_end_of_day
    from = (to - 6.day).at_beginning_of_day
    @posts = Post.includes(:favorited_users).limit(5)
                 .sort do |a, b|
      b.favorited_users.includes(:favorites).where(created_at: from...to).size <=>
        a.favorited_users.includes(:favorites).where(created_at: from...to).size
    end
    @tag_list = Tag.all
  end
end
