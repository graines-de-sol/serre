class Admin::BlogCategoriesController < ApplicationController

  before_filter :is_admin, :load_conf

  # POST /admin/blog_categories/create
  # Create a blog category                             REDIRECT
  # -----------------------------------------------------------
  def create
    BlogCategory.create

    redirect_to admin_blog_categories_path
  end

  # POST /admin/blog_categories/update
  # Update all categories' attributes                   REDIRECT
  # -----------------------------------------------------------
  def update
    BlogCategory.update(params[:category].keys, params[:category].values)

    redirect_to admin_blog_categories_path
  end

  # DELETE /admin/blog_categories/:id
  # Delete a category                                  REDIRECT
  # -----------------------------------------------------------
  def destroy
    BlogCategory.find(params[:id]).destroy

    redirect_to admin_blog_categories_path
  end

end

