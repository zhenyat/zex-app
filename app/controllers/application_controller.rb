class ApplicationController < ActionController::Base
  include Zex
  include Zt
  # protect_from_forgery with: :exception   # for API?
  before_action :set_locale
end
