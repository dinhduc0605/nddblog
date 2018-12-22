class Admin::CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    if Category.create(category_params)
      redirect_to admin_categories_path, notice: t('.notice')
    else
      render :new
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: t('.notice')
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      redirect_to admin_categories_path, notice: t('.notice')
    else
      redirect_to admin_categories_path, alert: t('.alert')
    end
  end

  protected

  def set_category
    @category = Category.friendly.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :image)
  end
end
