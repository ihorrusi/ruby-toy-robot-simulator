require 'spec_helper'

describe 'Robot' do
  let(:table) { Table.new(5) }
  let(:robot) { Robot.new(table) }

  describe 'without success place' do
    describe 'if invalid place' do
      ['place   t,t,north', 'place 1,1,norths', 'palce 1,t,north', 'palce t,1,north'].each do |term|
        describe "with term: #{term}" do
          before {
            robot.heard(term)
          }

          it 'should not print report' do
            expect(STDOUT).to_not receive(:puts)
            robot.heard('report')
          end
        end
      end
    end
  end

  describe 'with success place' do
    before {
      robot.heard('place 1,1,north')
    }

    it 'should not print report' do
      expect(STDOUT).to receive(:puts).with('1, 1, NORTH')
      robot.heard('report')
    end
  end

  describe 'default cases' do
    it 'default case 1' do
      expect(STDOUT).to receive(:puts).with('0, 1, NORTH')

      robot.heard('place 0,0,north')
      robot.heard('move')
      robot.heard('report')
    end

    it 'default case 2' do
      expect(STDOUT).to receive(:puts).with('0, 0, WEST')

      robot.heard('place 0,0,north')
      robot.heard('left')
      robot.heard('report')
    end

    it 'default case 3' do
      expect(STDOUT).to receive(:puts).with('3, 3, NORTH')

      robot.heard('place 1,2,EAST')
      robot.heard('MOVE')
      robot.heard('MOVE')
      robot.heard('LEFT')
      robot.heard('MOVE')
      robot.heard('report')
    end
  end
end