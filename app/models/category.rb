class Category < ActiveRecord::Base
    has_many :games

    def platforms
        self.games.pluck(:platform).uniq
    end

    def self.highest_rated
        review = Review.order(:rating).last
        game = Game.find(review.game_id)
        game.category
    end

    # def self.highest_rated
    #     Review.all.max_by{|r|r.rating}.game.category
    # end

    # def self.highest_rated
    #     highest_rating = Review.all.max_by { |r| r.rating }
    #     game_w_highest_rating = highest_rating.game
    #     category_w_highest_rating = game_w_highest_rating.category
    #     Array(category_w_highest_rating)
    # end

    # def self.highest_rated
    #     ratingArray = self.all.map do |category|
    #         category.reviews.map do |review|
    #             review.rating 
    #         end
    #     end
    #     sumRating = ratingArray.map do |rating|
    #         rating.sum   
    #     end
    #     Category.find(sumRating.each_with_index.max[1] + 1)
    # end
end