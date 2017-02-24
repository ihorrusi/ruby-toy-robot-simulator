require 'spec_helper'

describe 'Table' do
  describe 'table 3 x 3' do
    let(:table) { Table.new(3) }

    describe 'check position on table' do
      #generate all coordinates on table
      coordinates_array = []
      range = (0..2)
      range.each do |i|
        range.each do |j|
          #puts "#{i}, #{j}"
          coordinates_array.push([i, j])
        end
      end


      coordinates_array.each do |coordinates|
        describe "x: #{coordinates[0]}, y: #{coordinates[1]}" do
          let(:position) { Position.new(coordinates[0], coordinates[1]) }

          it 'should be placeable' do
            expect(table.is_placeable?(position)).to be(true)
          end
        end
      end
    end

    describe 'check position out of table' do
      #generate all coordinates out of table
      coordinates_array = [];
      range = (0..2)
      range_out = [-1, -3]
      #out by x
      range_out.each do |i|
        range.each do |j|
          #puts "#{i}, #{j}"
          coordinates_array.push([i, j])
        end
      end
      #out by y
      range.each do |i|
        range_out.each do |j|
          #puts "#{i}, #{j}"
          coordinates_array.push([i, j])
        end
      end


      coordinates_array.each do |coordinates|
        describe "x: #{coordinates[0]}, y: #{coordinates[1]}" do
          let(:position) { Position.new(coordinates[0], coordinates[1]) }

          it 'should not be placeable' do
            expect(table.is_placeable?(position)).to be(false)
          end
        end
      end
    end
  end
end