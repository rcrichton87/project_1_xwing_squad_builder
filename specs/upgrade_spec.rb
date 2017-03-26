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

end