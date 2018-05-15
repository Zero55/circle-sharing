# frozen_string_literal: true

class SharesController < ApplicationController
  before_action :find_post, only: [:push_post]

  def index
    @shares = Share.followed(current_user)
  end

  def show  
    if share.peeped? || share.expired?
      redirect_to shares_path
    end

    @share = Share.find params[:id]
    seen_share = Peep.create(user_id: current_user.id, share_id: @share.id)
  end

  def create
    post = Post.find(params[:post_id])

    if pushed_post.save
      flash[:notice] = 'Successfully pushed post'
      redirect_to shares_path
    else
      flash[:error] = 'Failed to push posts'
      redirect_to shares_path
    end
  end
end
