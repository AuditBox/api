# == Schema Information
#
# Table name: tags
#
#  id              :uuid             not null, primary key
#  key             :string
#  value           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :uuid             not null
#
# Indexes
#
#  index_tags_on_organization_id  (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#
class Tag < ApplicationRecord
  validates_presence_of :key, :value, :organization
  belongs_to :organization
  has_many :asset_tags
  has_many :control_tags
  has_many :assets, through: :asset_tags
  has_many :controls, through: :control_tags
end
