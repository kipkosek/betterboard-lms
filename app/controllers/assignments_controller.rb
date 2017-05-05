class AssignmentsController < ApplicationController

  def index
    @assignments = Assignment.all
  end

  def show
    @assignment = Assignment.find(params[:id])
  end

  def new
    @assignment = Assignment.new
  end

  def create
    @assignment = Assignment.new(assignment_params)

    if @assignment.save
      redirect_to @assignment, notice: "Assignment created."
    else
      flash.now[:alert] = "Error creating assignment."
      render :new
    end
  end

  def edit
    @assignment = Assignment.find(params[:id])
  end

  def update
    @assignment = Assignment.find(params[:id])
    @assignment.assign_attributes(assignment_params)

    if @assignment.save
      flash[:notice] = "Assignment was updated."
      redirect_to @assignment
    else
      flash.now[:alert] = "Error updating assignment."
      render :edit
    end
  end

  def destroy
    @assignment = Assignment.find(params[:id])

    if @assignment.destroy
      flash[:notice] = "#{@assignment.name} was deleted."
      redirect_to action: :index
    else
      flash.now[:alert] = "Error deleting topic."
      render :show
    end
  end

  private

  def assignment_params
    params.require(:assignment).permit(:name, :instructions, :duedate)
  end

end
