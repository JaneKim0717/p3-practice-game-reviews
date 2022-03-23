class Category < ActiveRecord::Base
    has_many :games

    def platforms
        self.games.pluck(:platform).uniq
    end

    def self.highest_rated
        binding.pry
        review = Review.order(:rating).last
        game = Game.find(review.game_id)
        game.category
    end
end