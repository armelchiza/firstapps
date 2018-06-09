class PostsController < ApplicationController

  def index
    @posts = Post.order("updated_at DESC").all
  end

  def new
    @post = Post.new();
  end

  def create
    @post = Post.new(post_params)
    @post.before_save
    if @post.save
      redirect_to posts_path
    end
  end

  # before_action :calculate_percentDFO
  # def calculate_percentDFO
  #   @post = Post.where(id: params[:id]).first
  #   logger.info "_____________________ >>>>> "
  #   logger.info @post
  # end

  def edit
    @post = Post.where(id: params[:id]).first
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

  def show
    @post = Post.where(id: params[:id]).first
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :fot, :dfow, :dfol, :percentDFO)
  end
end
