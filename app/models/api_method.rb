################################################################################
# Model:  ApiMethod
#
# Purpose: API methods for a definite Dotcom
#
# ApiMethod attributes:
#   api_id    - FK
#   name      - command name: string,  not NULL, unique
#   title     - string,  not NULL
#   link      - link to description: string
#   status    - enum { active (0) | archived (1) }
#   content   - Active Text attachement

#  29.05.2022 ZT
################################################################################
class ApiMethod < ApplicationRecord
  has_rich_text :content
  belongs_to :api, required: true

  enum status: %w(active archived)

  validates :api,   presence: true
  validates :name,  presence: true, uniqueness: true
  validates :title, presence: true
end
