# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    if current_user.present?
      redirect_to posts_path
    end
  end

  def help
  end
end
