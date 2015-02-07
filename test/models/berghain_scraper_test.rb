require 'test_helper'

class BerghainScraperTest < ActiveSupport::TestCase

  def setup
    stub_from_html_fixture 'http://berghain.de/event/1243'
    stub_from_html_fixture 'http://berghain.de/event/680'
  end

  test 'should initialize correctly' do
    scraper = BerghainScraper.new(1243)
    assert_instance_of Nokogiri::HTML::Document, scraper.document
  end

  test 'should return name of rooms' do
    scraper = BerghainScraper.new(1243)
    assert_equal scraper.room_names, ['Berghain', 'Panorama Bar']
    scraper = BerghainScraper.new(680)
    assert_equal scraper.room_names, ['Berghain', 'Panorama Bar', 'Sonntags']
  end

  test 'should return event start date' do
    scraper = BerghainScraper.new(1243)
    assert_equal scraper.start_date, '2015-02-07'.to_date
    scraper = BerghainScraper.new(680)
    assert_equal scraper.start_date, '2013-05-04'.to_date
  end
end
