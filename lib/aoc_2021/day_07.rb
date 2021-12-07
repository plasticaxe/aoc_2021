# frozen_string_literal: true

module Aoc2021
  #----
  class Day07Part1
    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a.freeze
      @crabs = @input[0].split(',').map(&:to_i).freeze
    end

    def run
      @crabs.min.upto(@crabs.max).map { |p| @crabs.map { |c| (c - p).abs }.sum }.min
    end
  end

  #----
  class Day07Part2 < Day07Part1
    def run
      @crabs.min.upto(@crabs.max).map { |p| @crabs.map { |c| fuel((c - p).abs) }.sum }.min
    end

    def fuel(change)
      (@fuel ||= {})[change.to_s] ||= 1.upto(change).to_a.sum
    end
  end

  #-----
  module Day07
    def self.default_input_file
      # File.join(Aoc2021::INPUT_FILES, 'day_07_example.txt')
      File.join(Aoc2021::INPUT_FILES, 'day_07.txt')
    end

    def self.part_one(input_file = default_input_file)
      Aoc2021::Day07Part1.new(input_file).run
    end

    def self.part_two(input_file = default_input_file)
      Aoc2021::Day07Part2.new(input_file).run
    end
  end
end
