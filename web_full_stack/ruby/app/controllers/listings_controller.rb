class ListingsController < ApplicationController
  def index
    @listings = ::ReverbClient.new.listings(currency:params[:currency], region:params[:region], category_uuid:params[:category_uuid])
  end
end
