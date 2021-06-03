class RelationshipsController < ApplicationController
  # ——————フォロー機能を作成・保存・削除する————————————
  def create
    current_user.follow(params[:user_id])   #followメソッドの引数にはActiveRecordの仕様(便利機能)により生成された仮想的な属性user_idを入れる
    redirect_to request.referer
  end
  
  def destroy
    current_user.unfollow(params[:user_id])  #unfollowメソッドの引数にはActiveRecordの仕様(便利機能)により生成された仮想的な属性user_idを入れる
    redirect_to request.referer
  end
  
  #————————フォロー・フォロワー一覧を表示する-————————————
  def followings
    user = User.find(params[:user_id])
    @users = user.followings   #user.rbの13行目で定義しているfollowings(与フォロー関係relationshipを通じて各ユーザに対するfollowedを集めてくる)
  end
  
  def followers
    user = User.find(params[:user_id])
    @users = user.followers    #user.rbの15行目で定義しているfollowers(被フォロー関係passive_relationshipを通じて各ユーザに対するfollowerを集めてくる)
  end
end  
