require 'test_helper'

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "PlayerValidator" do
    g = Game.new(name: 'Test', min: 2, max: 4)
    assert g.valid?
    g.min = 5
    assert !g.valid?
  end
end
