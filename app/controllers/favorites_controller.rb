class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(record_id: params[:record_id])
    redirect_to records_url, notice: "#{favorite.record.user.name}さんの投稿をお気に入りしました。"
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to records_url, notice: "#{favorite.record.user.name}さんの投稿をお気に入り解除しました。"
  end
end
