# frozen_string_literal: true

RSpec.describe Aoc2021 do
  describe 'day_06' do
    context 'part_one_example' do
      it 'should have the right answer' do
        expect(Aoc2021::Day06.part_one(File.join(Aoc2021::INPUT_FILES, 'day_06_example.txt'))).to be(5934)
      end
    end

    context 'part_one' do
      it 'should have the right answer' do
        expect(Aoc2021::Day06.part_one).to be(356_190)
      end
    end

    context 'part_two_example' do
      it 'should have the right answer' do
        expect(Aoc2021::Day06.part_two(File.join(Aoc2021::INPUT_FILES, 'day_06_example.txt'))).to be(26_984_457_539)
      end
    end

    context 'part_two' do
      it 'should have the right answer' do
        expect(Aoc2021::Day06.part_two).to be(1_617_359_101_538)
      end
    end
  end
end
