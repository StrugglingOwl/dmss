class PostsController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create]

  def new
    @record = Record.find(params[:record_id])
    @post = Post.new
  end

  def create
    @record = Record.find(params[:record_id])
    @post = Post.new(post_params)
    @post.record = @record
    @post.user = current_user

    if @post.save
      redirect_to record_path(@record)
    else
      render :new
    end
  end

  def destroy

  end


  private

  def post_params
    params.require(:post).permit(:content)
  end

end
