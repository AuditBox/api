# == Schema Information
#
# Table name: users
#
#  id              :uuid             not null, primary key
#  email           :string
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  google_id       :string           not null
#  organization_id :uuid
#
# Indexes
#
#  index_users_on_google_id        (google_id)
#  index_users_on_organization_id  (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#
class User < ApplicationRecord
  TYPES = %w(user owner)
  belongs_to :organization, optional: true
  validates_presence_of :google_id, :name, :email
end
