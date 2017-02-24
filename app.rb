require_relative './lib/table'
require_relative './lib/robot'

table = Table.new(5)
robot = Robot.new(table)

loop do
  input = gets.chomp
  robot.heard(input)
end


