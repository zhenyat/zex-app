################################################################################
# Model:  Api
#
# Purpose:
#
# Purpose:  Dotcoms' APIs
#
# Api attributes:
#   dotcom_id   - FK
#   mode        - API mode: enum { public_api (0) | private_api (1) }
#   path        - path added to endpoint
#   key         - string
#   secret      - string
#   user        - string
#   status      - enum { active (0) | archived (1) }
#
#  29.05.2022 ZT
################################################################################
class Api < ApplicationRecord
  belongs_to :dotcom, required: true
  has_many   :api_methods

  enum mode: %w(public_api private_api)
  enum status: %w(active archived)

  def show_secret
    get_secret
  end

  private
    def get_secret
      Rails.application.credentials.config[self.dotcom.name.to_sym][self.mode.to_sym][:secret]
    end
end
