class Comment < ActiveRecord::Base
  attr_accessible :content

  validates_presence_of :content

end