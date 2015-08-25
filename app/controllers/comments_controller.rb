class CommentsController < ApplicationController
  layout 'admin'
	def create
    @ticket = Ticket.find(params[:comment][:id])
    @comment = @ticket.comments.create(comment_params)
    if @comment.save
      flash[:success] =t 'comments.create_success'
      redirect_to ticket_path(:id=>params[:comment][:id])
    else
      render 'new'
    end 
   end
   private
    def comment_params
       params.require(:comment).permit(:body)
    end
end
