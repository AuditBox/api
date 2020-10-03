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
Fabricator(:tag) do
  key 'Owner'
  value 'Bob'
  organization
end
