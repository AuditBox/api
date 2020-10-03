# == Schema Information
#
# Table name: artifacts
#
#  id              :uuid             not null, primary key
#  description     :text
#  props           :jsonb
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  asset_id        :uuid
#  control_id      :uuid             not null
#  organization_id :uuid             not null
#
# Indexes
#
#  index_artifacts_on_asset_id         (asset_id)
#  index_artifacts_on_control_id       (control_id)
#  index_artifacts_on_organization_id  (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (asset_id => assets.id)
#  fk_rails_...  (control_id => controls.id)
#  fk_rails_...  (organization_id => organizations.id)
#
class Artifact < ApplicationRecord
  belongs_to :asset
  belongs_to :control
  belongs_to :organization

  validates_presence_of :control, :organization
end
