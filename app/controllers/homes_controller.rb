class HomesController < ApplicationController

  def top
    @posts = Post.all
    @tag_list = Tag.all
    #@post_tags = @post.tags
  end

end
