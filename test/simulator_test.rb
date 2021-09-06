require 'pry'
require 'minitest/autorun'

class SimulatorTest < Minitest::Test
  def setup
    @simulator = Simulator.new
  end
end
