# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :user_signed_in?, only: [:index, :edit, :update]
  before_action :current_user,    only: [:edit, :update]

  def index
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
  end
end
