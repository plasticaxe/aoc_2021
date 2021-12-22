# frozen_string_literal: true

RSpec.describe Aoc2021 do
  describe 'day_16' do
    # TODO: Need to create a separate example input for part 1!
    # context 'part_one_example' do
    #   it 'should have the right answer' do
    #     expect(Aoc2021::Day16.part_one(File.join(Aoc2021::INPUT_FILES, 'day_16_example.txt'))).to be(000)
    #   end
    # end

    context 'part_one' do
      it 'should have the right answer' do
        expect(Aoc2021::Day16.part_one).to be(904)
      end
    end

    context 'part_two_example' do
      it 'should have the right answer' do
        expect(Aoc2021::Day16.part_two(File.join(Aoc2021::INPUT_FILES, 'day_16_example.txt'))).to be(1)
      end
    end

    context 'part_two' do
      it 'should have the right answer' do
        expect(Aoc2021::Day16.part_two).to be(200_476_472_872)
      end
    end
  end
end
