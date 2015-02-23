module Scrapeable
  
  extend ActiveSupport::Concern
  require 'open-uri'
  require 'nokogiri'

  included do
    attr_accessor :document
  end

end