class Roulette < ApplicationRecord
    has_many :rounds
    has_many :players, :through => :rounds
end
