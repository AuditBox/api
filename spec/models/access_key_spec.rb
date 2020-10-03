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
require 'rails_helper'

RSpec.describe AccessKey, type: :model do
  include_examples 'a fabricated model'

  describe 'associations' do
    it { should belong_to :organization }
  end
  describe 'validations' do
    it { should validate_presence_of :organization }
    it { should validate_presence_of :secret_key }
    it { should validate_presence_of :write_key }
  end
end
 