require 'spec_helper'

describe 'Direction' do
  describe 'is valid side' do
    %w(west north east south).each do |side|

      describe "when #{side}" do
        let(:direction) { Direction.new(side) }
        it 'should be valid' do
          expect(direction.is_valid?).to be(true)
        end
      end
    end
  end

  describe 'is valid side' do
    %w(west1 north2 east3 south4).each do |side|

      describe "when side: #{side}" do
        let(:direction) { Direction.new(side) }
        it 'should be invalid' do
          expect(direction.is_valid?).to be(false)
        end
      end
    end
  end
end