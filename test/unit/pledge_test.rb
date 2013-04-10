require 'test_helper'

class PledgeTest < ActiveSupport::TestCase
  test "the pledge requires an amount, a user and a project" do
    pledge = Pledge.new
    assert_false pledge.save

    assert_include pledge.errors[:amount],  "can't be blank"
    assert_include pledge.errors[:user],    "can't be blank" 
    assert_include pledge.errors[:project], "can't be blank"
  end

  test "the pledge amount is a number" do
    pledge = FactoryGirl.build(:pledge, :amount => "abc")
    assert_false pledge.save
    assert_include pledge.errors[:amount], "is not a number"
  end

  test "the pledge is not a decimal" do
    pledge = FactoryGirl.build(:pledge, :amount => 9.99)
    assert_false pledge.save
    assert_include pledge.errors[:amount], "must be an integer"
  end

  test "the pledge amount should be greater than zero" do
    pledge = FactoryGirl.build(:pledge, :amount => -10)
    assert_false pledge.save
    assert_include pledge.errors[:amount], "must be greater than 0"
  end
end
