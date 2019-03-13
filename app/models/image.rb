class Image < ApplicationRecord
  belongs_to :entity, polymorphic: true
  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>", small: "150x150>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  # before_validation :set_blank_id
  # def set_blank_id
  #   if user_id.nil?
  #     self.user_id = 0
  #   else
  #     self.product_id = 0
  #   end
  # end
end


# polymorphic
# entity_id
# entity_type

# User.create(dataset)
# user id : 1
#
# Image :
#
# name
# file_size
# user_id : 1
#
# @user = User.find(1)
#
# @user.image
