class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_admin, except: [:show, :index]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category has been created"
      redirect_to @category
    else
      render 'new'
    end
  end
  
  def show
    @articles = @category.articles.paginate(page: params[:page], per_page: 5)
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "Category was edited successfully"
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    if @category.destroy
      flash[:notice] = "Category was deleted successfully"
    end
    redirect_to categories_path
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end
  def category_params
    params.require(:category).permit(:name)
  end
  def require_admin
    if !current_user.admin?
      flash[:alert] = "Only users with admin access can perform this action"
      redirect_to categories_path
    end
  end
end