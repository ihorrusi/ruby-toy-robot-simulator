require 'spec_helper'

describe 'Position' do
  describe 'with valid x, y' do
    let(:position) { Position.new(1, 1) }

    it 'should be valid' do
      expect(position.is_valid?).to be(true)
    end
  end

  describe 'with valid x, and invalid y' do
    let(:position) { Position.new(1, 'some string') }

    it 'should be invalid' do
      expect(position.is_valid?).to be(false)
    end
  end

  describe 'with invalid x, and valid y' do
    let(:position) { Position.new('some string', 1) }

    it 'should be invalid' do
      expect(position.is_valid?).to be(false)
    end
  end

  describe 'with invalid x, and invalid y' do
    let(:position) { Position.new('some string', 'second some string') }

    it 'should be invalid' do
      expect(position.is_valid?).to be(false)
    end
  end
end