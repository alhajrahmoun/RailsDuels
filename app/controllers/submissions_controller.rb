# frozen_string_literal: true

class SubmissionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_duel, only: [:new, :create]

  def new
    @submission = Submission.new
    @submission.user = current_user
    @submission.duel = @duel
    @submission.problem = Problem.find(params[:problem_id])
  end

  def create
    @submission = Submission.new(submission_params)
    @submission.user = current_user
    @submission.duel = @duel

    if @submission.save
      respond_to do |format|
        format.html { redirect_to duel_path(@duel) }
        format.turbo_stream
      end
    else
      render 'problems/show'
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:choice, :problem_id)
  end

  def find_duel
    @duel = Duel.find(params[:duel_id])
  end
end
