class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    micropost = Micropost.find(params[:micropost_id])
    user = micropost.user
    current_user.favorite(user,micropost)
    flash[:success] = 'お気に入りに追加しました。'
    redirect_to user
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    user = micropost.user
    current_user.unfavorite(user,micropost)
    flash[:success] = 'お気に入りから削除しました'
    redirect_to user
  end
end
