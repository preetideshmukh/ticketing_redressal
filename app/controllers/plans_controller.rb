class PlansController < ApplicationController
 layout 'admin'
before_filter :check_admin , :except => [:index]
skip_before_filter :configuration_status
before_action :authenticate_user! , :except => [:index]

  def index
    @plans = Plan.all
  end
  
  def new
    @plan = Plan.new
  end
  
  def create
    @plan = Plan.new(plan_params)
    
    if @plan.save!
      flash[:success] = t 'plans.create_success'
    else
      flash[:danger] = t 'plans.create_fail'
    end
    redirect_to plans_path
  end
  
  def edit
    @plan = Plan.find(params[:id])
  end
  
  def update
    @plan = Plan.find(params[:id])
    
    if @plan.update_attributes(plan_params)
      flash[:success] = t 'plans.update_success'
      redirect_to plans_path
    else
      flash[:danger] = t 'plans.create_success'
      redirect_to edit_plan_path
    end
  end
  
  private    
    
    def plan_params
      params.require(:plan).permit(:plan_name, :ticket_limit, :validity, :base_amount, :service_tax)
    end   

    def check_admin
      if current_user.role != "super_admin" && current_user.is_admin != true
        redirect_to plans_path
      end
    end 
end

