class Event < ActiveRecord::Base
  belongs_to :location
  belongs_to :party_date
  has_many :dj_sets
end
