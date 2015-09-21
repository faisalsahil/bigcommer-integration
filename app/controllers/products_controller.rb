class ProductsController < ApplicationController
# require 'bigcommerce'
require 'bigcommerce-oauth-api'
  require 'securerandom'
  require 'net/http'
  require "json"

  def fetch
    puts "auth['credentials']\n"
    account = Account.find(params[:account_id])
    # Bigcommerce.configure do |config|
    #   config.store_hash = 'e4su8p'
    #   config.client_id = 'doe3uwdosqtzkvm9dqo79ln7gjpa3t2'
    #   config.access_token = account.token
    # end

    api = BigcommerceOAuthAPI.configuration do |config|
      config.endpoint = 'https://store-e4su8p.mybigcommerce.com/api/v2/'
      config.user_name = 'groove-packer'
      config.api_key = '860ace88bdcad5e221e8d94478a80eac7ed7224a'
    end

    @products = api.products
    puts "00"*90
    puts @products
    
    # url = URI.parse('http://store-e4su8p.mybigcommerce.com/api/v2/products')
    # req = Net::HTTP::Get.new(url.to_s)
    
    # res = Net::HTTP.start(url.host, url.port) {|http|
    #   http.request(req)
    # }
    
    # response = res.body.encode("ASCII-8BIT").force_encoding("utf-8")
    
    # data = JSON.parse(response).as_json

    # List products
    # @products = Bigcommerce::Product.all
    # @products = api.products
    return render json: @products
  end
end
