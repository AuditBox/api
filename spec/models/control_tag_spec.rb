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
require 'rails_helper'

RSpec.describe ControlTag, type: :model do
  include_examples 'a fabricated model'

  describe 'associations' do
    it { should belong_to :control }
    it { should belong_to :tag }
  end

  describe 'validations' do
    it { should validate_presence_of :control }
    it { should validate_presence_of :tag }
  end
end
