# frozen_string_literal: true

class ProblemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_problem_set
  before_action :set_problem, only: %i[edit update destroy]

  def new
    @problem = @problem_set.problems.new
  end

  def edit; end

  def create
    @problem = @problem_set.problems.new(problem_params.merge(set_choices))
    if @problem.save
      redirect_to problem_set_path(@problem_set)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @problem.update(problem_params.merge(set_choices))
      redirect_to problem_set_path(@problem_set)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @problem.destroy

    redirect_to problem_set_path(@problem_set)
  end

  private

  def problem_params
    params.require(:problem).permit(:description, :points, :answer)
  end

  def set_problem_set
    @problem_set = ProblemSet.find(params[:problem_set_id])
  end

  def set_problem
    @problem = Problem.find(params[:id])
  end

  def set_choices
    { choices: params[:problem][:choices].split(';') }
  end
end
