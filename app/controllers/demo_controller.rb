class DemoController < ApplicationController
  include Parsing

  def index
    dotcoms_names = DOTCOMS.split
    @dotcoms_attributes = []
    dotcoms_names.each do |name|
      dotcom = Zex::Dotcom.new(name: name, api_mode: 'public')
      @dotcoms_attributes << attributes_values(dotcom)
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
end
