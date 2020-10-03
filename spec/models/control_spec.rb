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
require 'rails_helper'

RSpec.describe Control, type: :model do
  include_examples 'a fabricated model'

  describe 'associations' do
    it { should belong_to :organization }
    it { should have_many :control_tags }
    it { should have_many :tags }
    it { should have_many :assets }
  end

  describe 'validations' do
     it { should validate_presence_of :handle }
     it { should validate_presence_of :name }
     it { should validate_presence_of :organization }
  end
end
