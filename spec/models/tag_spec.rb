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
require 'rails_helper'

RSpec.describe Tag, type: :model do
  include_examples 'a fabricated model'

  describe 'associations' do
    it { should belong_to :organization }
    it { should have_many :asset_tags }
    it { should have_many :control_tags }
    it { should have_many :assets }
    it { should have_many :controls }
  end

  describe 'validations' do
    it { should validate_presence_of :key }
    it { should validate_presence_of :value }
  end
end
