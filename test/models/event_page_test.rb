require 'test_helper'

class EventPageTest < ActiveSupport::TestCase

  def setup
    stub_from_html_fixture 'http://berghain.de/event/680'   # Summer
    stub_from_html_fixture 'http://berghain.de/event/1243'  # Times are there
    stub_from_html_fixture 'http://berghain.de/event/1249'  # Times are not there
  end

  test 'should initialize correctly' do
    scraper = EventPage.new(1243)
    assert_instance_of Nokogiri::HTML::Document, scraper.document
  end

  test 'should return name of rooms' do
    scraper = EventPage.new(1243)
    assert_equal scraper.send(:room_names), ['Berghain', 'Panorama Bar']
    scraper = EventPage.new(680)
    assert_equal scraper.send(:room_names), ['Berghain', 'Panorama Bar', 'Sonntags']
  end

  test 'should return event start date' do
    scraper = EventPage.new(1243)
    assert_equal scraper.send(:start_date), '2015-02-07'.to_date
    scraper = EventPage.new(680)
    assert_equal scraper.send(:start_date), '2013-05-04'.to_date
  end

  test 'should detect whether set times are there' do
    scraper = EventPage.new(1243)
    assert scraper.times_are_set?
    scraper = EventPage.new(680)
    assert scraper.times_are_set?
    scraper = EventPage.new(1249)
    refute scraper.times_are_set?
  end

end
