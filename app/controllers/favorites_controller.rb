class FavoritesController < ApplicationController
  
  def create
    micropost = Micropost.find(params[:micropost_id]) # @micropost　とならないのは、お気に入り登録ボタンの設置先のuser#showで、インスタンス変数@micropostが、繰り返し処理を受けて|micropost|という変数に代入されているため。
    current_user.favorite(micropost)
    flash[:success] = "お気に入りに追加しました"
    redirect_to root_path
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavorite(micropost)
    flash[:success] = "お気に入りを解除しました"
    redirect_to root_path
  end
end
