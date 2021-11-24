class SubmissionsController < ApplicationController
  def index
    @submissions = Submission.all
  end

  def show
    @submission = Submission.find(params[:id])
  end

  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.new(submission_params)
    @submission.save
    redirect_to user_path(@submission.user_id)
  end

  def destroy
    @submission = Submission.find(params[:id])
    if @submission.destroy
      flash[:notice] = 'Delete Complete'
      redirect_to user_path(@submission.user.id)
    end
  end

  def search
    @submissions = Submission.new
    @submissions = if params[:submission_comment].present?
                     Submission.search(params[:submission_comment])
                   else
                     Submission.none
                   end
  end

  private

  def submission_params
    params.require(:submission).permit(:submission_comment,
                                       submission_images_images: []).merge(user_id: current_user.id)
  end
end
