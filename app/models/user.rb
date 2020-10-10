class User < ApplicationRecord
  belongs_to :organization
  validates_presence_of :google_id, :name, :email
end