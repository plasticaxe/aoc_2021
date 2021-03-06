# frozen_string_literal: true

RSpec.describe Aoc2021 do
  describe 'day_10' do
    context 'part_one_example' do
      it 'should have the right answer' do
        expect(Aoc2021::Day10.part_one(File.join(Aoc2021::INPUT_FILES, 'day_10_example.txt'))).to be(26_397)
      end
    end

    context 'part_one' do
      it 'should have the right answer' do
        expect(Aoc2021::Day10.part_one).to be(168_417)
      end
    end

    context 'part_two_example' do
      it 'should have the right answer' do
        expect(Aoc2021::Day10.part_two(File.join(Aoc2021::INPUT_FILES, 'day_10_example.txt'))).to be(288_957)
      end
    end

    context 'part_two' do
      it 'should have the right answer' do
        expect(Aoc2021::Day10.part_two).to be(2_802_519_786)
      end
    end
  end
end
