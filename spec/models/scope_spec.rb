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
require 'rails_helper'

RSpec.describe Scope, type: :model do
  include_examples 'a fabricated model'

  describe 'associations' do
    it { should belong_to :organization }
    it { should have_many :control_scopes }
    it { should have_many :controls }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :organization }
  end

  describe '#assets' do
    let(:org) { Fabricate(:organization) }
    let(:tags) { {containsPHI: "true", environment: "production"} }
    let(:subject) do
      Fabricate(
        :scope,
        organization: org,
        tags: [["containsPHI", "true"], ["environment", "production"]])
    end
     
    let!(:included_1) { Fabricate(:asset, handle: 'included1', organization: org, tags: tags) }
    let!(:included_2) { Fabricate(:asset, handle: 'included2', organization: org, tags: tags) }
    let!(:excluded) { Fabricate(:asset, handle: 'excluded', organization: org, tags: {}) }

    it 'should only include assets with matchig tags' do
      expect(org.assets.count).to eq 3
      expect(subject.assets.map(&:handle)).to eq ['included1', 'included2']
    end
  end
end
