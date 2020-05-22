class CategoriesController < ApplicationController
  before_action :require_user, except: [:show, :index]

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
    @category = Category.find(params[:id])
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end