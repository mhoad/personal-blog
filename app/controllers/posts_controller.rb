class PostsController < ApplicationController
  before_action :auth_admin!, except: [:index, :show]
  before_action :set_category
  before_action :find_post, only: [:edit, :update, :show, :destroy]

  # Index action to render all posts
  def index
    redirect_to @category
  end

  # New action for creating post
  def new
    @post = @category.posts.build
  end

  # Create action saves the post into database
  def create
    @post = @category.posts.build(post_params)
    if @post.save
      flash[:notice] = 'Successfully created post!'
      redirect_to [@category, @post]
    else
      flash.now[:alert] = 'Error creating new post!'
      render :new
    end
  end

  # Edit action retrives the post and renders the edit page
  def edit
    render layout: 'single_post'
  end

  # Update action updates the post with the new information
  def update
    if @post.update(post_params)
      flash[:notice] = 'Successfully updated post!'
      redirect_to [@category, @post]
    else
      flash[:alert] = 'Error updating post!'
      render :edit
    end
  end

  # The show action renders the individual post after retrieving the the id
  def show
    render layout: 'single_post'
  end

  # The destroy action removes the post permanently from the database
  def destroy
    if @post.destroy
      flash[:notice] = 'Successfully deleted post!'
      redirect_to @category
    else
      flash[:alert] = 'Error updating post!'
    end
  end

  private

  def post_params
    # params.require(:post).permit(:title, :body, :category_id)
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = @category.posts.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  def auth_admin!
    set_category
    redirect_to @category, alert: "You aren't allowed to do that." unless admin_signed_in?
  end
end
