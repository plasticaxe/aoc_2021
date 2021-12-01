# frozen_string_literal: true

module Aoc2021
  #----
  class Day12Part1
    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a
    end

    def run
      # ---
    end
  end

  #----
  class Day12Part2
    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a
    end

    def run
      # ---
    end
  end

  #-----
  module Day12
    def self.default_input_file
      # File.join(Aoc2021::INPUT_FILES, 'day_12_example.txt')
      File.join(Aoc2021::INPUT_FILES, 'day_12.txt')
    end

    def self.part_one(input_file = default_input_file)
      Aoc2021::Day12Part1.new(input_file).run
    end

    def self.part_two(input_file = default_input_file)
      Aoc2021::Day12Part2.new(input_file).run
    end
  end
end
