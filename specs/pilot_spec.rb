require('minitest/autorun')
require('minitest/rg')
require_relative('../models/pilot.rb')
require_relative('../models/ship.rb')

class TestPilot < MiniTest::Test

  def setup
    @ship = Ship.new({
      'id' => '1',
      'name' => 'T-65 X-Wing',
      'stats' => '3, 2, 2, 3',
      'upgrades' => 'astromech, torpedo, modification',
      'manoeuvres' => '/images/x_wing_manoeuvres.png',
      'cost' => 21,
      'faction' => 'rebel'
    })
  
    @pilot = Pilot.new({
      'id' => '4',
      'name' => 'Luke Skywalker',
      'pilot_skill' => '8',
      'pilot_ability' => 'When defending, you may change one focus result to an evade result.',
      'cost' => '7',
      'ship_id' => @ship.id
    })
  end

  def test_id
    expected = 4
    actual = @pilot.id
    assert_equal(expected, actual)
  end

  def test_name
    expected = 'Luke Skywalker'
    actual = @pilot.name
    assert_equal(expected, actual)
  end

  def test_set_name
    @pilot.name = 'Wedge'
    expected = 'Wedge'
    assert_equal(expected, @pilot.name)
  end

  def test_pilot_skill
    expected = 8
    actual = @pilot.pilot_skill
    assert_equal(expected, actual)
  end

  def test_set_pilot_skill
    @pilot.pilot_skill = 9
    expected = 9
    assert_equal(expected, @pilot.pilot_skill)
  end



end