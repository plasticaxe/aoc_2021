# frozen_string_literal: true

module Aoc2021
  #----
  class Day11Part1
    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a.map(&:chars).freeze
    end

    def run
      flash_counter = 0
      1.upto(100).each do
        increment_octopuses
        process_flashes
        flash_counter += count_flashed_octopuses
        reset_flashed_octopuses
      end
      flash_counter
    end

    def increment_octopuses
      grid.dup.each_pair { |coords, energy| grid[coords] = energy + 1 }
    end

    def process_flashes
      return if grid.values.count { |v| v.eql?(10) }.zero?

      grid.dup.select { |_coords, value| value.eql?(10) }.each_key do |coords|
        update_neighbours(coords)
        grid[coords] = 999
      end
      process_flashes
    end

    def update_neighbours(coords)
      neighbours(coords).each do |n|
        next if grid[n].eql?(999)

        grid[n] = [grid[n] + 1, 10].min
      end
    end

    def neighbours(xy_val)
      (@neighbours ||= {})[xy_val.to_s] ||= begin
        x_val, y_val = xy_val.split(',').map(&:to_i)
        surrounding_coords(x_val, y_val).map { |xy| "#{xy[0]},#{xy[1]}" }
      end
    end

    def surrounding_coords(x_val, y_val)
      x_range = [0, (x_val - 1)].max.upto([9, (x_val + 1)].min).to_a
      y_range = [0, (y_val - 1)].max.upto([9, (y_val + 1)].min).to_a
      x_range.product(y_range) - [[x_val, y_val]]
    end

    def count_flashed_octopuses
      grid.values.count { |v| v > 9 }
    end

    def reset_flashed_octopuses
      grid.dup.each_pair { |coords, energy| grid[coords] = 0 if energy > 9 }
    end

    def grid
      @grid ||= begin
        hash = {}
        @input.each_with_index { |r, y| r.each_with_index { |v, x| hash["#{x},#{y}"] = v.to_i } }
        hash
      end
    end
  end

  #----
  class Day11Part2 < Day11Part1
    def run
      1.upto(1_000).each do |cycle|
        increment_octopuses
        process_flashes
        reset_flashed_octopuses
        return cycle if grid.values.uniq.count.eql?(1)
      end
    end
  end

  #-----
  module Day11
    def self.default_input_file
      # File.join(Aoc2021::INPUT_FILES, 'day_11_example.txt')
      File.join(Aoc2021::INPUT_FILES, 'day_11.txt')
    end

    def self.part_one(input_file = default_input_file)
      Aoc2021::Day11Part1.new(input_file).run
    end

    def self.part_two(input_file = default_input_file)
      Aoc2021::Day11Part2.new(input_file).run
    end
  end
end
