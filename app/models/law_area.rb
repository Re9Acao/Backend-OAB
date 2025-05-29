class LawArea < ApplicationRecord
  has_many :questions
  has_many :evaluation_law_areas
  has_many :user_performances
end