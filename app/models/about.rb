# == Schema Information
#
# Table name: abouts
#
#  id         :bigint           not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class About < ApplicationRecord
  has_one_attached :map_image
end
