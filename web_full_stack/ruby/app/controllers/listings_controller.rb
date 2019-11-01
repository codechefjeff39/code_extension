class ListingsController < ApplicationController
  def index
    @selected_category = params[:category]
    @categories = ReverbClient.new.categories
    @listings, @current_page, @total_pages = filter_listings(params[:category], params[:page])
  end

  def filter_listings(category, page)
    return ReverbClient.new.listings(page) if category.blank?
    return ReverbClient.new.filter_listings(category, page)
  end

end
