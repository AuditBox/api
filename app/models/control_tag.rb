# == Schema Information
#
# Table name: control_tags
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  control_id :uuid             not null
#  tag_id     :uuid             not null
#
# Indexes
#
#  index_control_tags_on_control_id  (control_id)
#  index_control_tags_on_tag_id      (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (control_id => controls.id)
#  fk_rails_...  (tag_id => tags.id)
#
class ControlTag < ApplicationRecord
  belongs_to :tag
  belongs_to :control
  validates_presence_of :tag, :control
end
