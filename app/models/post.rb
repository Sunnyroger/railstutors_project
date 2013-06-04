class Post < ActiveRecord::Base
  attr_accessible :url, :title

  has_many :comments
  has_many :votes

  validates_presence_of :title, :url

  def vote_count
  	self.votes.where(:direction => :up).count - self.votes.where(:direction => :down).count
  end
end
	
