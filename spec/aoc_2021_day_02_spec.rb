# frozen_string_literal: true

RSpec.describe Aoc2021 do
  describe 'day_02' do
    context 'part_one_example' do
      it 'should have the right answer' do
        expect(Aoc2021::Day02.part_one(File.join(Aoc2021::INPUT_FILES, 'day_02_example.txt'))).to be(150)
      end
    end

    context 'part_one' do
      it 'should have the right answer' do
        expect(Aoc2021::Day02.part_one).to be(1_427_868)
      end
    end

    context 'part_two_example' do
      it 'should have the right answer' do
        expect(Aoc2021::Day02.part_two(File.join(Aoc2021::INPUT_FILES, 'day_02_example.txt'))).to be(900)
      end
    end

    context 'part_two' do
      it 'should have the right answer' do
        expect(Aoc2021::Day02.part_two).to be(1_568_138_742)
      end
    end
  end
end
