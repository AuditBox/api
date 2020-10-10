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
    it { should have_many :control_scopes }
    it { should have_many :scopes }
  end

  describe 'validations' do
     it { should validate_presence_of :handle }
     it { should validate_presence_of :name }
     it { should validate_presence_of :organization }
  end

  describe '#assets' do
    let(:org) { Fabricate(:organization) }
    let(:tags1) { {containsPHI: "true", environment: "production"} }
    let(:tags2) { {containsEUPersonal: "true", environment: "production"} }
    let(:hipaa_scope) do
      Fabricate(
        :scope,
        organization: org,
        name: 'In-Scope for HIPAA',
        tags: [["containsPHI", "true"], ["environment", "production"]])
    end
    let(:gdpr_scope) do
      Fabricate(
        :scope,
        organization: org,
        name: 'In-Scope for GDPR',
        tags: [["containsEUPersonal", "true"], ["environment", "production"]])
    end
    let(:subject) {
      Fabricate(:control, organization: org, scopes: [hipaa_scope, gdpr_scope])
    }
     
    let!(:hipaa_1) { Fabricate(:asset, handle: 'hipaa_1', organization: org, tags: tags1) }
    let!(:hipaa_2) { Fabricate(:asset, handle: 'hipaa_2', organization: org, tags: tags1) }
    let!(:gdpr) { Fabricate(:asset, handle: 'gdpr', organization: org, tags: tags2) }
    let!(:excluded) { Fabricate(:asset, handle: 'excluded', organization: org, tags: {}) }
    it 'should only include in-scope assets' do
      expect(org.assets.count).to eq 4
      expect(subject.assets.map(&:handle)).to eq ['hipaa_1', 'hipaa_2', 'gdpr']
    end
  end
end
