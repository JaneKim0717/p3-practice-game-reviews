class User < ActiveRecord::Base
    has_many :reviews
    has_many :games, through: :reviews

    def write_review(game, content, rating)
        Review.create(content: content, rating: rating, user_id: self.id, game_id: game.id)
    end

    def self.most_reviews
        self.all.max_by do |user|
            user.reviews.length
        end
    end
end