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
require 'rails_helper'

RSpec.describe Asset, type: :model do
  include_examples 'a fabricated model'

  describe 'associations' do
    it { should belong_to :organization }
  end

  describe 'validations' do
    it { should validate_presence_of :handle }
    it { should validate_presence_of :organization }
    it { should validate_presence_of :asset_type }
  end
end
