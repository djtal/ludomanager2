require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should fill first_name and last_name when full name is set" do
    p = Person.new(:fullname => "John Kevin")
    assert_equal "John", p.first_name
    assert_equal "Kevin", p.last_name
  end

end
