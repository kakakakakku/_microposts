class StaticPagesController < ApplicationController
  def home
    @micropost = current_user.microposts.build if logged_in?
    @feed_items = current_user.feed_items.includes(:user).page(params[:page]).order(created_at: :desc) if logged_in?
  end
end