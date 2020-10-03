# == Schema Information
#
# Table name: assets
#
#  id              :uuid             not null, primary key
#  asset_type      :string
#  handle          :string
#  props           :json             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :uuid             not null
#
# Indexes
#
#  index_assets_on_organization_id  (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#
class Asset < ApplicationRecord
  belongs_to :organization
  validates_presence_of :handle, :asset_type, :organization
  has_many :asset_tags
  has_many :tags, through: :asset_tags
end
