class Contest < ActiveRecord::Base
  belongs_to :visitor
  validates :visitor_id, presence: true 
  validates :img_name, presence: true, length: { minimum: 5, maximum: 100}
  validates :img_summary, presence: true, length: { minimum: 10, maximum: 150}
  validates :img_description, presence: true, length: {minimum: 10, maximum: 500}
  mount_uploader :picture, PictureUploader
  validate :picture_size
  
  private
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end 

 