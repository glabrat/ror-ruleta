class Round < ApplicationRecord
    belongs_to :roulette
    has_many :players
end
