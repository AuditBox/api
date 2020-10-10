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
Fabricator(:scope) do
  organization
  name 'Stores PHI'
  tags { [['Environment','Production'],['Contains PHI', '1']] }  
end
