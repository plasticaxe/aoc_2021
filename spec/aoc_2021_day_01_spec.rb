# frozen_string_literal: true

RSpec.describe Aoc2021 do
  describe 'day_01' do
    context 'part_one_example' do
      it 'should have the right answer' do
        expect(Aoc2021::Day01.part_one(File.join(Aoc2021::INPUT_FILES, 'day_01_example.txt'))).to be(7)
      end
    end

    context 'part_one' do
      it 'should have the right answer' do
        expect(Aoc2021::Day01.part_one).to be(1583)
      end
    end

    context 'part_two_example' do
      it 'should have the right answer' do
        expect(Aoc2021::Day01.part_two(File.join(Aoc2021::INPUT_FILES, 'day_01_example.txt'))).to be(5)
      end
    end

    context 'part_two' do
      it 'should have the right answer' do
        expect(Aoc2021::Day01.part_two).to be(1627)
      end
    end
  end
end
