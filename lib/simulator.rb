require_relative 'robot'
require_relative 'commander'
require_relative 'table'

class Simulator
  attr_reader :robot

  def initialize
    @table = Table.new
    @robot = Robot.new(table: @table)
    @commander = Commander.new(robot: @robot)
  end

  def command_console
    loop do
      raw_input_string = gets.chomp
      input_array = raw_input_string&.split(' ')
      command_type = input_array[0]&.to_sym
      data = input_array[1]
      begin
        @commander.command(command_type: command_type, data: data)
      rescue StandardError => e
        puts e.message
      end
    end
  end
end
