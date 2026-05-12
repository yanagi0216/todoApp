class GoalsController < ApplicationController
  before_action :authenticate_user!
   before_action :set_goal, only: %i[ show edit update destroy ]

  # GET /goals
  def index
    @goals = current_user.goals.all
  end

    # GET /goals/new
  def new
    @goal = current_user.goals.new
  end

  # GET /goals/1/edit
  def edit
  end

  # POST /goals
  def create
    @goal = current_user.goals.new(goal_params)

    if @goal.save
      redirect_to goals_path
      @status = true
    else
      # render :new, status: :unprocessable_content
      @status = false
    end
  end

  # PATCH/PUT /goals/1
  def update
    if @goal.update(goal_params)
      # (もともとの記述)redirect_to @goal, notice: "Goal was successfully updated.", status: :see_other
      @status = true
    else
      # （もともとの記述）render :edit, status: :unprocessable_content
      @status = false
    end
  end

  # DELETE /goals/1
  def destroy
    @goal.destroy!
    redirect_to goals_path, notice: "Goal was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = current_user.goals.find_by(params.expect(:id))
      redirect_to(goals_url, alert: "ERROR!") if @goal.blank?
    end

    # Only allow a list of trusted parameters through.
    def goal_params
      params.expect(goal: [ :title, :user_id ])
    end
end
