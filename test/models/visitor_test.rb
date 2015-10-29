require 'test_helper'

class VisitorTest < ActiveSupport::TestCase
  
  def setup
    @visitor = Visitor.new(visitorname: "john", email: "john@example.com")
  end
  
  test "visitor should be valid" do 
    assert @visitor.valid?
  end
  
  test "visitor name should be present" do
    @visitor.visitorname = " "
    assert_not @visitor.valid?
  end
  
  test "visitor name should not be too long" do
    @visitor.visitorname = "a" * 41
    assert_not @visitor.valid?
  end
  
  
  test "visitor name should not be too short" do
    @visitor.visitorname = "aa"
    assert_not @visitor.valid?
  end
  
  test "email should be present" do
    @visitor.email = " "
    assert_not @visitor.valid?
  end
  
  test "email length should be within bounds" do
    @visitor.email = "a" * 101 + "@example.com"
    assert_not @visitor.valid?
  end
  
  test "email address should be unique" do
    dup_visitor = @visitor.dup
    dup_visitor.email = @visitor.email.upcase
    @visitor.save
    assert_not dup_visitor.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com]
    valid_addresses.each do |va|
      @visitor.email = va
      assert @visitor.valid?, '#{va.inspect} should be valid'
    end
  end
  
  # test "email validation should reject invalid addresses" do
  #   invalid_addresses = %w[user@example user_at_eee.org user.name@example eee@i.g.com]
  #   invalid_addresses.each do |ia|
  #     @visitor.email = ia
  #     assert_not @visitor.valid?, '#{ia.inspect} should be invalid'
  #     end
  # end
end
