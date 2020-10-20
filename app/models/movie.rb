class Movie < ApplicationRecord
    belongs_to :user
    has_many :reviews

    validates :title, length: { minimum: 2 }
    validates :rating, presence: true
    validates :release_date, presence: true

end
