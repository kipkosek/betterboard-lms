class SourcesController < ApplicationController

  def index
    @sources = Source.all
  end

  def show
  end

  def new
    @source = Source.new
  end

  def create
    @source = Source.new(source_params)

    if @source.save
      flash[:notice] = "Source was added."
      redirect_to sources_path
    else
      flash.now[:alert] = "There was an error adding the source. Please try again."
      render :new
    end
  end

  def edit
    @source = Source.find(params[:id])
  end

  def update
    @source = Source.find(params[:id])
    @source.assign_attributes(source_params)

    if @source.save
      flash[:notice] = "Source was updated."
      redirect_to sources_path
    else
      flash.now[:alert] = "There was an error. Please try again."
      render :edit
    end
  end

  def destroy
    @source = Source.find(params[:id])

    if @source.destroy
      flash[:notice] = "\"#{@source.title}\" was deleted."
      redirect_to sources_path
    else
      flash.now[:alert] = "There was an error."
      render :index
    end
  end

  private

  def source_params
    params.require(:source).permit(:title, :description, :file, :file_cache, :link, :youtube)
  end
end
