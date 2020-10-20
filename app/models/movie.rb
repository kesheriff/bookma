class Movie < ApplicationRecord
    belongs_to :user
    has_many :reviews

    validates :title, , presence: true
    validates :rating, presence: true
    validates :release_date, presence: true

end
