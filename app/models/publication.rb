class Publication < ApplicationRecord
    mount_uploader :image, ImageUploader
end
