# == Schema Information
#
# Table name: control_scopes
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  control_id :uuid             not null
#  scope_id   :uuid             not null
#
# Indexes
#
#  index_control_scopes_on_control_id               (control_id)
#  index_control_scopes_on_control_id_and_scope_id  (control_id,scope_id) UNIQUE
#  index_control_scopes_on_scope_id                 (scope_id)
#
# Foreign Keys
#
#  fk_rails_...  (control_id => controls.id)
#  fk_rails_...  (scope_id => scopes.id)
#
require 'rails_helper'

RSpec.describe ControlScope, type: :model do
  include_examples 'a fabricated model'

  describe 'associations' do
    it { should belong_to :control }
    it { should belong_to :scope }
  end

  describe 'validations' do
    it { should validate_presence_of :control }
    it { should validate_presence_of :scope }
  end
end
