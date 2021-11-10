class RelationshipsController < ApplicationController

 def create
    current_user.follow(params[:user_id])
    redirect_to user_path(current_user)

 end

 def destroy
    current_user.unfollow(params[:user_id])
    redirect_to user_path(current_user)
 end

 def followings
    # user = User.find(params[:user_id])
    @users = current_user.followings
 end

 def followers
    # user = User.find(params[:user_id])
    @users = current_user.followers
 end

 private

 def relationship_params
  params.require(:relationship).permit(:followed_id,:follower_id)
 end
end
