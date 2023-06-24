class ClockInsController < ApplicationController
  before_action :set_clock_in, only: %i[ show ]
  before_action :set_user, only: %i[ create follow_clock_ins index ]

  # GET user/1/clock_ins or user/1/clock_ins.json
  def index
    @clock_ins = @user.clock_ins
  end

  # GET /clock_ins/1 or /clock_ins/1.json
  def show
  end

  # Get /user/1/follow_clock_ins or /user/1/follow_clock_ins.json
  def follow_clock_ins
    @clock_ins = @user.follow_clock_ins.last_week_clock_ins
  end

  # POST /user/1/clock_in or /user/1/clock_in.json
  def create
    @current_clock_in = @user.current_clock_in

    if @current_clock_in.present?
      @current_clock_in.wake_time = DateTime.today
    else
      @current_clock_in = @user.clock_ins.build(sleep_time: DateTime.today)
    end

    if @current_clock_in.save
      render json: { message: "Clocked in successfully" }, status: 200
    else
      render json: { error: @current_clock_in.errors.messages }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clock_in
      @clock_in = ClockIn.find(params[:id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user_id])
    end
end
