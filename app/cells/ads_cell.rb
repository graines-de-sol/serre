class AdsCell < Cell::Rails

  prepend_view_path File.join(Rails.root, "app", "views")

  def show(args)
    #self.prepend_view_path File.join(Rails.root, "app", "views")

    @categories = Category.all
    @ads = Ad.all_categories_for_location(args[:member])

    render
  end

  def create
    raise args.inspect
  end

end

