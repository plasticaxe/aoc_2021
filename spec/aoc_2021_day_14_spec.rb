# frozen_string_literal: true

RSpec.describe Aoc2021 do
  describe 'day_14' do
    context 'part_one_example' do
      it 'should have the right answer' do
        expect(Aoc2021::Day14.part_one(File.join(Aoc2021::INPUT_FILES, 'day_14_example.txt'))).to be(1588)
      end
    end

    context 'part_one' do
      it 'should have the right answer' do
        expect(Aoc2021::Day14.part_one).to be(5656)
      end
    end

    context 'part_two_example' do
      it 'should have the right answer' do
        expect(Aoc2021::Day14.part_two(File.join(Aoc2021::INPUT_FILES, 'day_14_example.txt'))).to be(2_188_189_693_529)
      end
    end

    # context 'part_two' do
    #   it 'should have the right answer' do
    #     expect(Aoc2021::Day14.part_two).to be(000)
    #   end
    # end
  end
end
