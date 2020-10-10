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
Fabricator(:asset) do
  organization
  props { { region: 'us-east-2', resource_id: 'i-999999' } }
  asset_type 'EC2 Instance'
  handle 'arn:aws:ec2:us-east-2:111:instance/i-99999'
end
