class AdminController < ApplicationController

  before_filter :is_logged, :load_conf

  # GET /admin
  # Show app configurations items
  def index
    @survey = Survey.order('created_at').last
  end

  # POST /admin/conf
  # Update global conf params
  def conf
    conf = Conf.find(1).update_attributes(params[:conf])

    redirect_to '/admin'
  end

  # POST /admin/categories/create
  # Create a category
  def categories_create
    Category.create

    redirect_to '/admin'
  end

  # POST /admin/categories/update
  # Update all categories' names
  def categories_update
    Category.update(params[:category].keys, params[:category].values)

    redirect_to '/admin'
  end

  # POST /admin/categories/delete/:id
  # Delete a category
  def categories_delete
    Category.find(params[:id]).destroy

    redirect_to '/admin'
  end

  # POST /admin/locations/create
  # Create a locations
  def locations_create
    Location.create

    redirect_to '/admin'
  end

  # POST /admin/locations/update
  # Update all locations' attributes
  def locations_update
    Location.update(params[:location].keys, params[:location].values)

    redirect_to '/admin'
  end

  # POST /admin/locations/delete/:id
  # Delete a location
  def locations_delete
    Location.find(params[:id]).destroy

    redirect_to '/admin'
  end

  # Create a new survey
  def surveys_create
    Survey.create_location

    redirect_to '/admin'
  end

end

