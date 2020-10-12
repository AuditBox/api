# == Schema Information
#
# Table name: scopes
#
#  id              :uuid             not null, primary key
#  name            :string           not null
#  tags            :text             default([]), is an Array
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :uuid             not null
#
# Indexes
#
#  index_scopes_on_name_and_organization_id  (name,organization_id) UNIQUE
#  index_scopes_on_organization_id           (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#
class Scope < ApplicationRecord
  belongs_to :organization
  validates_presence_of :name, :organization
  has_many :control_scopes
  has_many :controls, through: :control_scopes

  def assets
    return [] if tags.empty?
    query = organization.assets #tags = [['environment', 'production'], ['containsPHI', true]]

    tags.each do |tag|
      key, value = tag
      query =
        query.where('tags ->> :key = :value', key: key.to_s, value: value.to_s)
    end
    query
  end
end
