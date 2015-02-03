class Act < ActiveRecord::Base
  belongs_to :event
  has_many :artists
  has_and_belongs_to_many :rooms
end
