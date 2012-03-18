class AdminController < ApplicationController

  before_filter :is_admin, :load_conf

  # GET /admin
  # Show app configurations items
  def index
    @survey = Survey.where(['location_id = ? AND parent_id = 0', $conf.default_location_id]).order('created_at DESC').first
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
    Survey.create(
      :question    => params[:question],
      :location_id => $conf.default_location_id,
      :voters      => Array.new
    )

    redirect_to '/admin'
  end

  # Update a survey
  def surveys_update
    Survey.update(params[:survey].keys, params[:survey].values)

    redirect_to '/admin'
  end

  # Create a new answer for a given survey
  def answers_create
    Survey.create(
      :parent_id   => params[:id],
      :location_id => $conf.default_location_id,
      :voters      => Array.new
    )

    redirect_to '/admin'
  end

  # Delete given answer
  def answers_delete
    Survey.find(params[:id]).destroy

    redirect_to '/admin'
  end

  # PUT /admin/occupation
  # Set occupation rate for given location                                   AJAX
  # -----------------------------------------------------------------------------
  def occupation
    Location.find(params[:location_id]).update_attributes(:occupation=>params[:rate].to_i)

    render :text=>'success'
  end

end

