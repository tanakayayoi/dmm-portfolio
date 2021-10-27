class HomesController < ApplicationController
  # 投稿をいいね順に５つ表示
  def top
    @posts = Post.includes(:favorited_users).limit(5).sort_by {|post| post.favorites.count}.reverse
    @tag_list = Tag.all
  end
end
