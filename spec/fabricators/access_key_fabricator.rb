# == Schema Information
#
# Table name: access_keys
#
#  id              :uuid             not null, primary key
#  secret_key      :string
#  test            :boolean          default(TRUE)
#  write_key       :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :uuid             not null
#
# Indexes
#
#  index_access_keys_on_organization_id  (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#
Fabricator(:access_key) do
  organization
  test false
  write_key { |attrs| AccessKey.generate_wk(attrs[:test]) }
  secret_key { |attrs| AccessKey.generate_sk(attrs[:test]) }
end
