# frozen_string_literal: true

RSpec.describe Aoc2021 do
  describe 'day_11' do
    context 'part_one_example' do
      it 'should have the right answer' do
        expect(Aoc2021::Day11.part_one(File.join(Aoc2021::INPUT_FILES, 'day_11_example.txt'))).to be(1656)
      end
    end

    context 'part_one' do
      it 'should have the right answer' do
        expect(Aoc2021::Day11.part_one).to be(1655)
      end
    end

    context 'part_two_example' do
      it 'should have the right answer' do
        expect(Aoc2021::Day11.part_two(File.join(Aoc2021::INPUT_FILES, 'day_11_example.txt'))).to be(195)
      end
    end

    context 'part_two' do
      it 'should have the right answer' do
        expect(Aoc2021::Day11.part_two).to be(337)
      end
    end
  end
end
