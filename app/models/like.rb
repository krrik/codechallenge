class Like < ActiveRecord::Base
  belongs_to :visitor
  belongs_to :contest
  
  validates_uniqueness_of :visitor, scope: :contest
end
