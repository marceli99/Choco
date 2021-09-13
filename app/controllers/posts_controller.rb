class PostsController < ApplicationController
  MARKDOWN = Redcarpet::Markdown.new(Redcarpet::Render::SmartyHTML)

  before_action :authenticate_user!, except: [:show]
  def index
    @posts = Post.order('created_at DESC')
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    @post.content = MARKDOWN.render(@post.content)
    @post.save
    redirect_to root_path
  end
  def edit
    @post = Post.find(params[:id])
  end
  def update
    @post = Post.find(params[:id])
    @post.content = MARKDOWN.render(params[:post][:content])
    @post.title = params[:post][:title]
    @post.save
    redirect_to root_path
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  def show
    @post = Post.find(params[:id])
  end
  private
  def post_params
    params.require(:post).permit(:id, :title, :content, :image)
  end
end
