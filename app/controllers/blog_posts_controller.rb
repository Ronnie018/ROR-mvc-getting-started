class BlogPostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_blog_post, except: [:index, :new, :create]
  before_action :is_blog_post_owner, only: [:edit, :update]

  def index
    @blog_posts = BlogPost.order(updated_at: :desc).page params[:page]
  end

  def show
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = current_user.blog_posts.build(blog_post_params)
    if @blog_post.save
      redirect_to @blog_post
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end
  
  def update
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog_post.destroy
    redirect_to root_path
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :content)
  end

  def set_blog_post
    @blog_post = BlogPost.find(params[:id])
  rescue ActiveRecord::RecordNotFound 
    redirect_to root_path
  end

  def is_blog_post_owner
    if current_user != @blog_post.user
      redirect_to @blog_post
    end
  end
end
