class Artist < ActiveRecord::Base
  belongs_to :event
  belongs_to :label
end
