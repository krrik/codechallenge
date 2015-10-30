class VisitorsController < ApplicationController
  
  def new
    @visitor = Visitor.new
  end
  
  def create
    @visitor = Visitor.new(visitor_params)
    if @visitor.save
      flash[:success] = "Your account has been created succesfully"
      redirect_to contests_path
    else
      render 'new'
    end
  end
  def update
    
  end
  
  private
    
    def visitor_params
      params.require(:visitor).permit(:visitorname, :email, :password, :mail, :phone, :zip)
    end
    
  
end
