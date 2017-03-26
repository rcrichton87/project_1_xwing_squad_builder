require('minitest/autorun')
require('minitest/rg')
require_relative('../models/ship.rb')

class TestShip < MiniTest::Test

  def setup
    @ship = Ship.new({
      'name' => 'T-65 X-Wing',
      'stats' => '3, 2, 2, 3',
      'upgrades' => 'astromech, torpedo, modification',
      'manoeuvres' => '/images/x_wing_manoeuvres.png',
      'cost' => 21,
      'faction' => 'rebel'
    })
  end

  def test_name
    expected = 'T-65 X-Wing'
    actual = @ship.name
    assert_equal(expected, actual)
  end

end