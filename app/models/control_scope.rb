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
class ControlScope < ApplicationRecord
  belongs_to :scope
  belongs_to :control
  validates_presence_of :scope, :control
end
