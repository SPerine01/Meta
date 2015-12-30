class Post < ActiveRecord::Base

	validates :title, presence: true
	validates :body, presence: true

	validates :title, length: { minimum: 2 }
	validates :body, length: { minimum: 20 }
end
