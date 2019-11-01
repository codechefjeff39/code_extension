class ListingsController < ApplicationController
  def index
    @listings = filter_listings(params[:category])
    @categories = ReverbClient.new.categories
  end

  def filter_listings(category)
    return ReverbClient.new.listings if category.blank?
    ReverbClient.new.filter_listings(category)
  end

end
