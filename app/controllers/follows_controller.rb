class FollowsController < ApplicationController
  before_action :set_user, only: %i[ follow unfollow follows ]

   # POST /user/1/follow/2 or /user/1/follow/2.json
   def follow
    @follow = @user.follows.build(followed_id: follow_params[:followed_id])

    if @follow.save
      render json: { message: "Followed Successfully" }, status: 200
    else
      render json: { error: @follow.errors.messages }, status: :unprocessable_entity
    end
  end

  # DELETE /user/1/unfollow/2 or /user/1/unfollow/2.json
  def unfollow
    if @user.follows.where(followed_id: follow_params[:followed_id]).destroy_all
      render json: { message: "Unfollowed successfully" }, status: 200
    else
      render json: { error: @follow.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # GET /user/1/follows or /user/1/follows.json
  def follows
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user_id])
    end

    # Only allow a list of trusted parameters through.
    def follow_params
      params.permit(:user_id, :followed_id)
    end
end
