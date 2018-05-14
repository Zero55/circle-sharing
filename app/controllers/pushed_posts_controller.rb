# frozen_string_literal: true

class PushedPostsController < ApplicationController
  before_action :find_post, only: [:push_post]

  def create
    post = Post.find(params[:post_id])
    pushed_post = PushedPost.new(user_id: current_user.id, post_id: post.id)

    if pushed_post.save
      flash[:notice] = 'Successfully pushed post'
      redirect_to posts_path
    else
      flash[:error] = 'Failed to push posts'
      redirect_to posts_path
    end
  end
end
