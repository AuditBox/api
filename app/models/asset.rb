# == Schema Information
#
# Table name: assets
#
#  id              :uuid             not null, primary key
#  asset_type      :string
#  handle          :string
#  props           :jsonb            not null
#  tags            :jsonb            not null
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

  before_validation :serialize_hashes

  def serialize_hashes
    self.props = JSON.parse props if props.kind_of? String
    self.tags = JSON.parse tags if tags.kind_of? String
  end
end