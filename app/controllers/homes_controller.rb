class HomesController < ApplicationController
  # 投稿をいいね順に表示
  def top
    @posts = Post.includes(:favorited_users).sort_by {|post| post.favorites.count}.reverse
    @tag_list = Tag.all
  end
end
