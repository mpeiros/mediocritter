class Search < ActiveRecord::Base
  belongs_to :user
  has_many :tweets

  validates_presence_of :search_query
end
