# frozen_string_literal: true

RSpec.describe Aoc2021 do
  describe 'day_18' do
    context 'part_one_example' do
      it 'should have the right answer' do
        expect(Aoc2021::Day18.part_one(File.join(Aoc2021::INPUT_FILES, 'day_18_example.txt'))).to be(4140)
      end
    end

    context 'part_one' do
      it 'should have the right answer' do
        expect(Aoc2021::Day18.part_one).to be(3675)
      end
    end

    context 'part_two_example' do
      it 'should have the right answer' do
        expect(Aoc2021::Day18.part_two(File.join(Aoc2021::INPUT_FILES, 'day_18_example.txt'))).to be(3993)
      end
    end

    context 'part_two' do
      it 'should have the right answer' do
        expect(Aoc2021::Day18.part_two).to be(4650)
      end
    end
  end
end
