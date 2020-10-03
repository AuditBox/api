# == Schema Information
#
# Table name: controls
#
#  id              :uuid             not null, primary key
#  description     :text
#  handle          :string
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :uuid             not null
#
# Indexes
#
#  index_controls_on_organization_id  (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#
class Control < ApplicationRecord
  belongs_to :organization
  validates_presence_of :handle, :name, :organization
  has_many :control_tags
  has_many :tags, through: :control_tags
  has_many :assets, through: :tags
end
