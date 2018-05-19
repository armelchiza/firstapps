class PostsController < ApplicationController

  def index
    @posts = Post.order("updated_at DESC").all
  end

  def calculate_percentDFO
    posts = Post.all
    posts.percentDFO == 22
  end

  def new
    @post = Post.new();
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    end
  end

  def edit
    @post = Post.where(id: params[:id]).first
    @calculate_percentDFO
  end

  def update
    @post = Post.where(id: params[:id]).first
    if @post.update_attributes(post_params)
      redirect_to posts_path
    else
      #jfbsjkdfnbajksf
    end
  end

  def destroy
    @post = Post.where(id: params[:id]).first
    if @post.destroy
      redirect_to posts_path
    else
      #jfbsjkdfnbajksf
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :fot, :dfow, :dfol, :percentDFO)
  end
end
