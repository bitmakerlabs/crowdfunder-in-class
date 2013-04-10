ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  # fixtures :all

  # Add more helper methods to be used by all tests here...

  DatabaseCleaner.strategy = :truncation

  class ActionDispatch::IntegrationTest
    include Capybara::DSL
    Capybara.app = CrowdfunderInClass::Application

    Capybara.javascript_driver = :webkit # :selenium
    self.use_transactional_fixtures = false

    teardown do
      DatabaseCleaner.clean       # Truncate the database after each test
      Capybara.reset_sessions!    # Forget the (simulated) browser state
      Capybara.use_default_driver # Revert Capybara.current_driver to Capybara.default_driver=
    end

    def get_signed_in_user
      # LOGIN AS A USER SO WE CAN DO THE TEST (SETUP)
      password = 'magicalpassword'
      user = FactoryGirl.create(:user, :password => password)
      visit '/session/new'
      fill_in :email, with: user.email
      fill_in :password, with: password
      click_button 'Login'
      user
    end

  end

end
