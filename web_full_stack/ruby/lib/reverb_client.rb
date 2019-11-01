require 'httparty'

class ReverbClient
  HEADERS = {
    'Accept' => 'application/json',
    'Accept-Version' => '3.0',
    'Content-Type' => 'application/json'
  }

  attr_reader :base_uri

  def initialize(base_uri: 'https://api.reverb.com/api')
    @base_uri = base_uri
  end

  def listings(page, per_page: 10)
    listings_response = get('/listings/all', {per_page: per_page, page: page})
    return listings_response['listings'], listings_response['current_page'], listings_response['total_pages']
  end

  def filter_listings(category_uuid, page, per_page: 10)
    listings_response = get('/listings/all', {category_uuid: category_uuid, per_page: per_page, page: page})
    return listings_response['listings'], listings_response['current_page'], listings_response['total_pages']
  end

  def categories
    get('/categories/flat')['categories']
  end

  private

  def get(path, params={})
    JSON.parse(HTTParty.get(base_uri + path, headers: HEADERS, query: params).body)
  end
end
