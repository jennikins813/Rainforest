class User < ActiveRecord::Base
	has_secure_password
	after_create :build_profile

	has_many :reviews
	has_many :products, :through => :reviews
	has_one :profile
	accepts_nested_attributes_for :profile

	validates_presence_of :name

	def build_profile
		Profile.create(user: self)
	end
end
