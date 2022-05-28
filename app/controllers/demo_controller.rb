class DemoController < ApplicationController
  include Parsing
  before_action :set_api, only: :dddl

  def index
    dotcom_names = DOTCOMS.split
    @dotcom_attributes = []
    dotcom_names.each do |name|
      dotcom = Zex::Dotcom.new(name: name, api_mode: 'public')
      @dotcom_attributes << attributes_values(dotcom)
    end
  end

  def public_api
    @dotcom_name = 'binance'
    dotcom = Zex::Dotcom.new(name: @dotcom_name, api_mode: 'public')

    api = Zex::PublicApiGet.new(dotcom: dotcom, method: 'time')
    @time = Time.at(api.request['serverTime']/1000)

    pair = Pair.find_by code: 'BTC/USDT'
    options = {
      symbol: pair.code.sub('/', '')
    }
    api = Zex::PublicApiGet.new(dotcom: dotcom, method: 'exchangeInfo', options: options)
    @response = api.request
  end

  def candlesticks
    @dotcom_b = Zex::Dotcom.new(name: 'binance', api_mode: 'public')
    @pair = Pair.find_by code: 'BTC/USDT'
    options = {symbol: @pair.code.sub('/', ''), interval: '1h', limit: 50}
    api = PublicApiGet.new(dotcom: @dotcom_b, method: 'klines', options: options)
    @klines = api.request

    @dotcom_c = Zex::Dotcom.new(name: 'cexio', api_mode: 'public')
    @pair = Pair.find_by code: 'BTC/USD'
    extension = "hd/20220524/#{@pair.code}"
    api = PublicApiGet.new dotcom: @dotcom_c, method: 'ohlcv', extension: extension
    ohlcv = api.request
    strings_array = ohlcv["data1h"].gsub('],[', ';').gsub('[','').gsub(']','').split(';')
    @candles = []
    strings_array.each do |s|
      @candles << s.split(',')
    end
  end

  def dddl
    @dotcom_names = DOTCOMS.split
    # @dotcom_name  = params[:dotcom_name] if @dotcom_name.nil?
    @api_modes = ['public', 'private']
    @api_mode = params[:api_mode] if @api_mode.nil?
    # @api_method = params[:api_method] if @api_method.nil?

    if @dotcom_name.present? and @api_mode.present? and not @api_method.present?
      @api_methods = ZEX_CONFIG[@dotcom_name][@api_mode]['methods'].split
    else
      @api_methods = []
    end
    
    if @dotcom_name.present? and @dotcom_name.present? and @api_method.present?
      dotcom = Zex::Dotcom.new(name: @dotcom_name, api_mode: @api_mode)
      api = Zex::PublicApiGet.new(dotcom: dotcom, method: 'time')
      @time = Time.at(api.request['serverTime']/1000)
    end
  end

  private
    def set_api
      @dotcom_name  = params[:dotcom_name] if @dotcom_name.nil?
      @api_mode = params[:api_mode] if @api_mode.nil?
      @api_method = params[:api_method] if @api_method.nil?
    end
end
