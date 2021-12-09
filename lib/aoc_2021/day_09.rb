# frozen_string_literal: true

module Aoc2021
  #----
  class Day09Part1
    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a.map(&:chars).freeze
      @max_x = (@input[0].size - 1)
      @max_y = (@input.size - 1)
    end

    def run
      low_points.map { |l| l[:height] + 1 }.sum
    end

    def low_points
      low_points = []
      0.upto(@max_x).each do |x|
        0.upto(@max_y).each do |y|
          low_points << { x: x, y: y, height: grid["#{x},#{y}"] } if low_point?(x, y)
        end
      end
      low_points
    end

    def low_point?(x_val, y_val)
      height = grid["#{x_val},#{y_val}"]
      surrounding_point_heights(x_val, y_val).each { |p| return false if p <= height }
      true
    end

    def surrounding_point_heights(x_val, y_val)
      heights = []
      neighbours(x_val, y_val).each do |n|
        x1, y1 = n
        heights << grid["#{x1},#{y1}"] unless grid["#{x1},#{y1}"].nil?
      end
      heights
    end

    def neighbours(x_val, y_val)
      coords = []
      (x_val - 1).upto(x_val + 1).each do |x|
        (y_val - 1).upto(y_val + 1).each do |y|
          coords << [x, y] unless x.eql?(x_val) && y.eql?(y_val)
        end
      end
      coords
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
  class Day09Part2 < Day09Part1
    def run
      all_basin_sizes.sort.last(3).inject(:*)
    end

    def all_basin_sizes
      low_points.map { |p| basin_members(p[:x], p[:y]).size }
    end

    def basin_members(x_val, y_val)
      members = ["#{x_val},#{y_val}"]
      lateral_neighbours(x_val, y_val).each do |n|
        x1, y1 = n
        next if nil_or_nine?(x1, y1)

        members << basin_members(x1, y1) if grid["#{x1},#{y1}"] > grid["#{x_val},#{y_val}"]
      end
      members.flatten.uniq
    end

    def lateral_neighbours(x_val, y_val)
      [[x_val, (y_val - 1)],
       [x_val, (y_val + 1)],
       [(x_val - 1), y_val],
       [(x_val + 1), y_val]]
    end

    def nil_or_nine?(x_val, y_val)
      grid["#{x_val},#{y_val}"].nil? || grid["#{x_val},#{y_val}"].eql?(9)
    end
  end

  #-----
  module Day09
    def self.default_input_file
      # File.join(Aoc2021::INPUT_FILES, 'day_09_example.txt')
      File.join(Aoc2021::INPUT_FILES, 'day_09.txt')
    end

    def self.part_one(input_file = default_input_file)
      Aoc2021::Day09Part1.new(input_file).run
    end

    def self.part_two(input_file = default_input_file)
      Aoc2021::Day09Part2.new(input_file).run
    end
  end
end
