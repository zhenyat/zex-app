class PagesController < ApplicationController
  include Parsing

  def demo
    dotcoms_names = DOTCOMS.split
    @dotcoms_attributes = []
    dotcoms_names.each do |name|
      dotcom = Zex::Dotcom.new(name: name, api_mode: 'public')
      @dotcoms_attributes << attributes_values(dotcom)
    end
  end

  def home
  end
end