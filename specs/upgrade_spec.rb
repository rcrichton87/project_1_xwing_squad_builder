require('minitest/autorun')
require('minitest/rg')
require_relative('../models/upgrade.rb')


class TestUpgrade < MiniTest::Test

  def setup
    @upgrade = Upgrade.new({
      'id' => '13',
      'name' => 'R2-D2',
      'type' => 'astromech',
      'cost' => '4',
      'effect' => 'After executing a green maneuver, you may regain one shield, up to you maximum value.'
    })
  end

  def test_id
    expected = 13
    actual = @upgrade.id
    assert_equal(expected, actual)
  end

  def test_name
    expected = 'R2-D2'
    actual = @upgrade.name
    assert_equal(expected, actual)
  end

  def test_set_name
    expected = 'M9-G8'
    @upgrade.name = 'M9-G8'
    assert_equal(expected, @upgrade.name)
  end

  def test_type
    expected = 'astromech'
    actual = @upgrade.type
    assert_equal(expected, actual)
  end

  def test_set_type
    expected = 'torpedo'
    @upgrade.type = 'torpedo'
    assert_equal(expected, @upgrade.type)
  end

end