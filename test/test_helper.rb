ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require 'webmock/minitest'
require 'uri'
require "minitest/pride"

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  fixtures :all

  def stub_from_html_fixture(url)
    uri = URI.parse(url)
    underscored_path = uri.path.gsub('/', '_')
    fixture_path = Rails.root.join 'test', 'fixtures', 'html', uri.host, underscored_path
    body = File.open fixture_path
    stub_request(:get, url).to_return(body)
  end
end