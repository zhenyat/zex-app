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
end
