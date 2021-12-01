# frozen_string_literal: true

module Aoc2021
  #----
  class Day01Part1
    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a.map(&:to_i)
    end

    def run
      @input[1..].each_with_index.count { |d, i| d > @input[i] }
    end
  end

  #----
  class Day01Part2 < Day01Part1
    def run
      @input[..-3].each_index.count { |i| @input[i..(i + 2)].sum < @input[(i + 1)..(i + 3)].sum }
    end
  end

  #-----
  module Day01
    def self.default_input_file
      # File.join(Aoc2021::INPUT_FILES, 'day_01_example.txt')
      File.join(Aoc2021::INPUT_FILES, 'day_01.txt')
    end

    def self.part_one(input_file = default_input_file)
      Aoc2021::Day01Part1.new(input_file).run
    end

    def self.part_two(input_file = default_input_file)
      Aoc2021::Day01Part2.new(input_file).run
    end
  end
end
