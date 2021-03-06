# frozen_string_literal: true

RSpec.describe Aoc2021 do
  describe 'day_17' do
    context 'part_one_example' do
      it 'should have the right answer' do
        expect(Aoc2021::Day17.part_one(File.join(Aoc2021::INPUT_FILES, 'day_17_example.txt'))).to be(45)
      end
    end

    context 'part_one' do
      it 'should have the right answer' do
        expect(Aoc2021::Day17.part_one).to be(2278)
      end
    end

    context 'part_two_example' do
      it 'should have the right answer' do
        expect(Aoc2021::Day17.part_two(File.join(Aoc2021::INPUT_FILES, 'day_17_example.txt'))).to be(112)
      end
    end

    context 'part_two' do
      it 'should have the right answer' do
        expect(Aoc2021::Day17.part_two).to be(996)
      end
    end
  end
end
