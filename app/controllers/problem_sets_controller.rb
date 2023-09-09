# frozen_string_literal: true

class ProblemSetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_problem_set, only: %i[show edit update destroy]

  def index
    @problem_sets = current_user.problem_sets
  end

  def show
    @problem_set = ProblemSet.find(params[:id])
    @problems = @problem_set.problems
  end

  def new
    @problem_set = current_user.problem_sets.new
  end

  def edit; end

  def create
    @problem_set = current_user.problem_sets.new(problem_set_params)
    if @problem_set.save
      redirect_to @problem_set
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @problem_set.update(problem_set_params)
      redirect_to problem_sets_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @problem_set.destroy

    redirect_to problem_sets_path
  end

  private

  def problem_set_params
    params.require(:problem_set).permit(:name, :complexity)
  end

  def set_problem_set
    @problem_set = ProblemSet.find(params[:id])
  end
end
