class TicketsController < ApplicationController
  layout 'admin'
  
  helper_method :sort_column, :sort_direction
  def index
    @user = current_user    
    @tickets = Ticket.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page]).where("user_id = ?", @user.id)
  end

  def show
    @user = current_user
    @ticket = Ticket.find(params[:id])
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user_id = current_user.id
    @ticket.crn = @ticket.id
    if @ticket.save 
      flash[:success] =t 'tickets.create_success'
      redirect_to tickets_path
      ticket_forward_empty(params[:ticket][:forwarded_to])
    else
      render "new"
    end
  end

  def edit
    @ticket = Ticket.find(params[:id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    if @ticket.update_attributes(ticket_params)
      ticket_forward_empty(params[:ticket][:forwarded_to])
      flash[:success] =t 'tickets.update_success'
      redirect_to tickets_path
    else
      render "edit"
    end
  end
  
  def register_complain
    @ticket = Ticket.new
  end
  
  def create_complain
    @ticket = Ticket.new(complain_params)
    @ticket.crn = @ticket.id
    @ticket.save
    flash[:success] =t 'tickets.complain_created'
    redirect_to complain_success_path
  end
  
  def complain_success
    render :layout => 'application'
  end

  private

  def ticket_params
    params.require(:ticket).permit(:client,:participant_name,:participant_mobile_no,
    :participant_email,:category, :description, :forwarded_to,
    :remark, :priority, :status, :resolution_period, :company_name)
  end
  
  def complain_params
    params.require(:ticket).permit(:participant_name, :participant_mobile_no, :participant_email, :user_id)
  end

  def ticket_forward_empty(field)
    if !field.blank?
        UserMailer.delay.ticket_complaint_email(@ticket)
    end
  end
  
  def sort_column
    Ticket.column_names.include?(params[:sort]) ? params[:sort] : "participant_name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end