require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  
  def setup
  	@contact = Contact.new( name: "Example contact", email: "contact@example.com", 
  													message: "This is a message")
  end

  test "should be valid" do
  	assert @contact.valid?
  end

  test "name should be present" do
  	@contact.name = "  "
  	assert_not @contact.valid?
  end

  test "email should be present" do
  	@contact.email = "  "
  	assert_not @contact.valid?
  end

  test "name should not be too long" do
  	@contact.name = "a" * 51
  	assert_not @contact.valid?
  end

  test "email should not be too long" do
  	@contact.email = "a" * 244 + "@example.com"
  	assert_not @contact.valid?
  end
end
