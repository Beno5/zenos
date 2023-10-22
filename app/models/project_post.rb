class ProjectPost < ApplicationRecord
  has_one_attached :main_image
  has_many_attached :secondary_images
end
