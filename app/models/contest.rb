class Contest < ActiveRecord::Base
  belongs_to :visitor
  has_many :likes
  validates :visitor_id, presence: true 
  validates :img_name, presence: true, length: { minimum: 5, maximum: 100}
  validates :img_summary, presence: true, length: { minimum: 10, maximum: 150}
  validates :img_description, presence: true, length: {minimum: 10, maximum: 500}
  mount_uploader :picture, PictureUploader
  validate :picture_size
  default_scope -> { order(updated_at: :desc) }
  
  def thumbs_up_total
    self.likes.where(like: true).size
  end
  
  def thumbs_down_total
    self.likes.where(like: false).size
  end
  
  
  private
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end 

 