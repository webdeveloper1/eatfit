class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :trackable, :validatable

	has_many :meals
	has_many :comments
	has_many :following_relationships, class_name: "Relationship", foreign_key: :follower_id
	has_many :leading_relationships, class_name: "Relationship", foreign_key: :leader_id
	has_many :votes

	mount_uploader :avatar, AvatarUploader

	VALID_NAME_REGEX = /\A[a-zA-Z0-9_]{3,30}\Z/
	
	validates :username,  presence: true, format: { with: VALID_NAME_REGEX }, uniqueness: true

	def leader_ids
		following_relationships.map(&:leader_id)
	end

	def recent_meals
		# meals.last(1)
		meals.order("created_at DESC").take(3)
	end

	def self.all_except(user)
		where.not(id: user.id)
	end

	def self.search_by_username(search_term)
		return [] if search_term.blank?
		where("username LIKE ?", "%#{search_term}%").order("created_at DESC")
	end

	def follows?(another_user)
		following_relationships.map(&:leader).include?(another_user)
	end

	def can_follow?(another_user)
		!(self.follows?(another_user) || self == another_user)
	end

	def voted_for(meal)
		votes.map(&:voteable_id).include?(meal.id)
	end

	def can_vote_for?(meal)
		!(self.voted_for(meal) || self == meal.user)
	end
end
