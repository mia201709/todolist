class Todohomework < ApplicationRecord
  validates_presence_of :description, :date
end
