# frozen_string_literal: true
################################################################################
# zex.rb:
#   Loads ZEX config parameters from YAML file at Initialization Phase
#
#   27.5.2022  ZT
################################################################################

# Gets default App configuration parameters
filename = "#{Rails.root}/config/zex/dotcoms.yml"
if File.exists? filename
  ZEX_CONFIG = YAML.load_file(filename)#[Rails.env]
  DOTCOMS = ZEX_CONFIG['list']
end