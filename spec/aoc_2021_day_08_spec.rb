# frozen_string_literal: true

RSpec.describe Aoc2021 do
  describe 'day_08' do
    context 'part_one_example' do
      it 'should have the right answer' do
        expect(Aoc2021::Day08.part_one(File.join(Aoc2021::INPUT_FILES, 'day_08_example.txt'))).to be(26)
      end
    end

    context 'part_one' do
      it 'should have the right answer' do
        expect(Aoc2021::Day08.part_one).to be(504)
      end
    end

    context 'part_two_example' do
      it 'should have the right answer' do
        expect(Aoc2021::Day08.part_two(File.join(Aoc2021::INPUT_FILES, 'day_08_example.txt'))).to be(61_229)
      end
    end

    context 'part_two' do
      it 'should have the right answer' do
        expect(Aoc2021::Day08.part_two).to be(1_073_431)
      end
    end
  end
end
