module Scrapeable
  
  extend ActiveSupport::Concern
  require 'open-uri'

  included do
    attr_accessor :document
  end

end