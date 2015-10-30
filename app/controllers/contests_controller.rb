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
    @contest = Contest.new(contest_params)
    @contest.visitor = Visitor.find(1)
    
    if @contest.save
      flash[:success] = "Your image is uploaded succesfully"
      redirect_to contests_path
    else
      render :new
    end
  end
 
  def edit
    @contest = Contest.find(params[:id])
  end
  
  def update
    @contest = Contest.find(params[:id])
    if @contest.update(contest_params)
      #do something
      flash[:success] = "Your edited image was updated succesfully"
      redirect_to contests_path(@contest)
    else
      render :edit
    end
  end
  
    
  private
  
     def contest_params
       params.require(:contest).permit(:img_name, :img_summary, :img_description)
     end
    
end