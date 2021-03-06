class PostsController < ApplicationController
  def new
    @post = Post.new
    @post.build_spot
  end

  def create
    @post = current_user.posts.new(post_params)
    tag_list = params[:post][:tag_name].split(nil)
    @post.score = Language.get_data(post_params[:body])
    if @post.save
      @post.save_tag(tag_list)
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def index
    @posts = Post.page(params[:page]).reverse_order
  end

  def show
    @post = Post.find(params[:id])
    @lat = @post.spot.latitude
    @lng = @post.spot.longitude
    gon.lat = @lat
    gon.lng = @lng
    @post_comment = PostComment.new
    @post_tags = @post.tags
  end

  def edit
    @post = Post.find(params[:id])
    if @post.user == current_user
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    @post = Post.find(params[:id])
    tag_list = params[:post][:tag_name].split(nil)
    @post.update(post_params)
    @post.save_tag(tag_list)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to :root
  end

  # タグ検索用
  def search
    @tag_list = Tag.all
    @tag = Tag.find(params[:tag_id])
    @posts = @tag.posts.all
  end

  private

  def post_params
    params.require(:post).permit(:image, :title, :body, :tag, spot_attributes: [:address])
  end
end
