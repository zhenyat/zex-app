module Parsing
  extend ActiveSupport::Concern

  def attributes_values object
    hash = {}
    object.instance_variables.each do |attribute|
      key = attribute.to_s.sub('@', '')
      value = object.instance_eval(key)
      hash[key.to_sym] = value
    end
    hash
  end
end