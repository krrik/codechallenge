require 'test_helper'

class ContestTest < ActiveSupport::TestCase
  def setup
    @visitor = Visitor.create(visitorname: "bob", email: "bob@example.com")
    @contest = @visitor.contests.build(img_name: "pinkpanther1", img_summary: "best image till date", img_description: "its winking and active")
    
  end
  
  test "contest should be valid" do
    assert @contest.valid?
  end
  
  test "visitor_id should be present" do
    @contest.visitor_id = nil
    assert_not @contest.valid?
  end
  
  
  test "name should be present" do
    @contest.img_name = " "
    assert_not @contest.valid?
  end
  
  test "name length should not be too long" do
    @contest.img_name = "a" * 101
    assert_not @contest.valid?
  end
  
  test "name length should not be too short" do
    @contest.img_name = "aaa"
    assert_not @contest.valid?
  end
  
  test "summary should be present" do
    @contest.img_summary = " "
    assert_not @contest.valid?
  
  end
  
  test "summary length should not be too long" do
    @contest.img_summary = "a" * 151
    assert_not @contest.valid?
  
  end
  
  
  test "summary length should not be too short" do
    @contest.img_summary = "a" * 9
    assert_not @contest.valid?
  
  end
  
  test "description should be present" do
    @contest.img_description = " "
    assert_not @contest.valid?
    
  end
  
  
  test "description should not be too long" do
      @contest.img_description = "a" * 501
    assert_not @contest.valid?
    
  end
  
  
  test "description should not be too short" do
    @contest.img_description = "a" * 9
    assert_not @contest.valid?
  
  end
  
  
end
