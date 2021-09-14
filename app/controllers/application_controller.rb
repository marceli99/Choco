class ApplicationController < ActionController::Base

  def index
    @posts = Post.order('created_at DESC')
  end

  def authenticate_user!
    unless current_user
      redirect_to :root
    end
  end

end
