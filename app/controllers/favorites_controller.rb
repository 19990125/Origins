class FavoritesController < ApplicationController

 def create
    submission = Submission.find(params[:submission_id])
    favorite = current_user.favorites.new(submission_id: submission.id)
    favorite.save
    redirect_to submission_path(current_user.id)
 end

 def destroy
    submission = Submission.find(params[:submission_id])
    favorite = current_user.favorites.find_by(submission_id: submission.id)
    favorite.destroy
    redirect_to submission_path(current_user.id)
 end

 def index
  #  # @user = User.find_by(id: params[:id])
  #  # @user = current_user.id
  #　# favorites = Favorite.where(user_id: @user)
   #  @submission = Submission.where(favorites: favorites)
   @user = current_user.id
   @submissions = Submission.includes(:favorites).where(favorites: {user_id: @user})
 end

 private

 def favorite_params
  params.require(:favorite).permit(:submission_id,:user_id)
 end
end
