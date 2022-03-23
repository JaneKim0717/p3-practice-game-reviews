class Game < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews
    belongs_to :category

    # def average_rating
    #     self.reviews.average(:rating).to_f
    # end

    def average_rating
        if self.reviews.sum {|review| review.rating} > 0
            self.reviews.sum {|review| review.rating}.to_f / self.reviews.size
        else "No ratings yet"
        end
    end

    
    def self.find_by_platform(platform)
        self.where("platform = ?", platform)
    end
end