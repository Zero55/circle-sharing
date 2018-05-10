# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find params[:id]
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = 'Post created!'
      redirect_to posts_path
    else
      flash[:error] = @post.errors.messages
      redirect_to new_post_path
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = 'Post deleted'
      redirect_to posts_path
    else
      flash[:error] = 'There was an error deleting your post'
      redirect_to posts_path
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :image, :user_id, :expire)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to posts_path if @post.nil?
    end
end
