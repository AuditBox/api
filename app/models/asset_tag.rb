# == Schema Information
#
# Table name: asset_tags
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  asset_id   :uuid             not null
#  tag_id     :uuid             not null
#
# Indexes
#
#  index_asset_tags_on_asset_id  (asset_id)
#  index_asset_tags_on_tag_id    (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (asset_id => assets.id)
#  fk_rails_...  (tag_id => tags.id)
#
class AssetTag < ApplicationRecord
  belongs_to :asset
  belongs_to :tag
  validates_presence_of :asset, :tag
end
