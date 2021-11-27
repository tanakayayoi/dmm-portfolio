class HomesController < ApplicationController
  # 投稿をいいね順に表示
  def top
    @posts = Post.left_joins(:favorites).group(:id).order('count(post_id) desc').limit(5)
    @tag_list = Tag.all
  end
end
