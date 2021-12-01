# frozen_string_literal: true

module Aoc2021
  #----
  class Day17Part1
    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a
    end

    def run
      # ---
    end
  end

  #----
  class Day17Part2
    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a
    end

    def run
      # ---
    end
  end

  #-----
  module Day17
    def self.default_input_file
      # File.join(Aoc2021::INPUT_FILES, 'day_17_example.txt')
      File.join(Aoc2021::INPUT_FILES, 'day_17.txt')
    end

    def self.part_one(input_file = default_input_file)
      Aoc2021::Day17Part1.new(input_file).run
    end

    def self.part_two(input_file = default_input_file)
      Aoc2021::Day17Part2.new(input_file).run
    end
  end
end
