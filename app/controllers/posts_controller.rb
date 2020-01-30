class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update, :new]

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
  end
  
  def edit
    # @post = Post.find(params[:id])
    # if @post.valid?
    #   @post.save
    #   redirect_to post_path(@post)
    # else
    #   render :edit
    # end
  end
  
  def update
    @post.update(post_params)
    if @post.valid?
      redirect_to post_path(@post)
    else
      render :edit
    end

    # redirect_to post_path(@post)
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end
