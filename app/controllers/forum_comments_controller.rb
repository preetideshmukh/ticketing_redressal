class ForumCommentsController < ApplicationController
  layout 'forum'
  before_filter :create_session
  def create
    logger.info("======================= #{session[:current_user].inspect}")
    @post = Post.find(params[:post_id])
    @comment = @post.forum_comments.create(params[:forum_comment].permit(:comment))
    @comment.user_id = current_user.id if current_user
    @comment.save
    if @comment.save
      redirect_to post_path(@post)
    else
      render 'new'
    end 
  end
  
  def edit
    @post= Post.find(params[:post_id])
    @comment =@post.forum_comments.find(params[:id])
  end
  
  def update
    @post= Post.find(params[:post_id])
    @comment =@post.forum_comments.find(params[:id])
    
    if @comment.update(params[:forum_comment].permit(:comment))
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end
  
  def destroy
    @post= Post.find(params[:post_id])
    @comment =@post.forum_comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
  
  private
  
  def create_session
    logger.info("pppppppppp=================> #{params.inspect}")
    session[:create] ||= params[:create]
    logger.info("ssssssssss=================> #{session[:create].inspect}")
  end
end