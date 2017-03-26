require('minitest/autorun')
require('minitest/rg')
require_relative('../models/ship.rb')

class TestShip < MiniTest::Test

  def setup
    @ship = Ship.new({
      'id' => '5',
      'name' => 'T-65 X-Wing',
      'stats' => '3, 2, 2, 3',
      'upgrades' => 'astromech, torpedo, modification',
      'manoeuvres' => '/images/x_wing_manoeuvres.png',
      'cost' => '21',
      'faction' => 'rebel'
    })
  end

  def test_id
    assert_equal(5, @ship.id)
  end

  def test_name
    expected = 'T-65 X-Wing'
    actual = @ship.name
    assert_equal(expected, actual)
  end

  def test_set_name
    expected = 'TIE Fighter'
    @ship.name = 'TIE Fighter'
    assert_equal(expected, @ship.name)
  end

  def test_stats
    expected = [3,2,2,3]
    actual = @ship.stats
    assert_equal(expected, actual)
  end

  def test_set_stats
    expected = [3,3,3,3]
    @ship.stats = [3,3,3,3]
    assert_equal(expected, @ship.stats)
  end

  def test_upgrades
    expected = ['astromech', 'torpedo', 'modification']
    actual = @ship.upgrades
    assert_equal(expected, actual)
  end

  def test_set_upgrades
    @ship.upgrades = ['turret']
    expected = ['turret']
    assert_equal(expected, @ship.upgrades)
  end

  def test_manoeuvres
    expected = '/images/x_wing_manoeuvres.png'
    actual = @ship.manoeuvres
    assert_equal(expected, actual)
  end

  def test_set_manoeuvres
    expected = 'another link'
    @ship.manoeuvres = 'another link'
    assert_equal(expected, @ship.manoeuvres)
  end

  def test_cost
    expected = 21
    actual = @ship.cost
    assert_equal(expected, actual)
  end

  def test_set_cost
    expected = 24
    @ship.cost = 24
    assert_equal(expected, @ship.cost)
  end

  def test_faction
    expected = 'rebel'
    actual = @ship.faction
    assert_equal(expected, actual)
  end

end