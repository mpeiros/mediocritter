class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :favorite

  validates_presence_of :content
end
