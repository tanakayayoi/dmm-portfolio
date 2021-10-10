class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to post_path(@post)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def tag_search
  end

  private

  def post_params
    params.require(:post).permit(:image, :title, :body, :tag)
  end

end
