# == Schema Information
#
# Table name: organizations
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Organization < ApplicationRecord
  validates_presence_of :name
  has_many :controls
  has_many :assets
  has_many :tags
  has_many :scopes
end
