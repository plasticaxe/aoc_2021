# frozen_string_literal: true

module Aoc2021
  #----
  class Day06Part1
    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a.freeze
    end

    def run(times)
      times.times { update_fish }
      all_fish.values.sum
    end

    def update_fish
      current_fish = all_fish.dup
      new_fish     = current_fish[0].to_i
      8.downto(1).each { |n| all_fish[n - 1] = current_fish[n].to_i }
      all_fish[6] += new_fish
      all_fish[8] = new_fish
    end

    def all_fish
      @all_fish ||= begin
        fish = {}
        @input[0].split(',').map(&:to_i).each do |f|
          fish[f] ||= 0
          fish[f] += 1
        end
        fish
      end
    end
  end

  #----
  class Day06Part2 < Day06Part1; end

  #-----
  module Day06
    def self.default_input_file
      # File.join(Aoc2021::INPUT_FILES, 'day_06_example.txt')
      File.join(Aoc2021::INPUT_FILES, 'day_06.txt')
    end

    def self.part_one(input_file = default_input_file)
      Aoc2021::Day06Part1.new(input_file).run(80)
    end

    def self.part_two(input_file = default_input_file)
      Aoc2021::Day06Part2.new(input_file).run(256)
    end
  end
end
