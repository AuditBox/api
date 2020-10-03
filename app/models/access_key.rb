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
class AccessKey < ApplicationRecord
  validates_presence_of :write_key, :secret_key, :organization
  belongs_to :organization
  before_save :generate_keys

  def generate_keys
    self.write_key ||= AccessKey::generate_wk(test)
    self.secret_key ||= AccessKey::generate_sk(test)
  end

  def self.generate_wk(test = true)
    "wk_#{test ? 'test_': ''}#{SecureRandom.urlsafe_base64(32)}"
  end

  def self.generate_sk(test = true)
    "sk_#{test ? 'test_' : ''}#{SecureRandom.urlsafe_base64(32)}"
  end
end
