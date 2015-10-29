class ContestsController < ApplicationController
  
  def index
    @contests = Contest.all
  end
  
  def show
    begin
     @contest = Contest.find(params[:id])
    end
  end
  
  def new
    @contest = Contest.new
  end
  
  def create
    begin
    @contest = Contest.new(contest_params)
    @contest.visitor = Visitor.find(2)
  
    if @contest.save
      flash[:success] = "Your pink panther image is uploaded successfully!"
      redirect_to contests_path
    else
      render :new
    end
    end
  end
  
    
  private
  
    def contest_params
      params.require(:contest).permit(:img_name, :img_description)
    end
    
end