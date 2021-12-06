# frozen_string_literal: true

module Aoc2021
  #----
  class Day05Part1
    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a
      @lines = @input.map { |l| l.split(' -> ') }
      @sea_floor = {}
    end

    def run
      horz_vert_lines.each { |l| draw_line(l) }
      @sea_floor.values.count { |v| v > 1 }
    end

    def draw_line(line)
      all_xy_vals_on_line(line).each do |xy|
        @sea_floor[xy.to_s] ||= 0
        @sea_floor[xy.to_s] += 1
      end
    end

    def all_xy_vals_on_line(line)
      x, y, x_end, y_end = start_and_end_of_line(line)
      points = [[x, y]]
      loop do
        (x < x_end ? x += 1 : x -= 1) unless x.eql?(x_end)
        (y < y_end ? y += 1 : y -= 1) unless y.eql?(y_end)
        points << [x, y]
        return points if x.eql?(x_end) && y.eql?(y_end)
      end
    end

    def start_and_end_of_line(line)
      x = x_value(line[0])
      y = y_value(line[0])
      x_end = x_value(line[1])
      y_end = y_value(line[1])
      [x, y, x_end, y_end]
    end

    def move_towards(val1, val2)
      return val1 if val1.eql?(val2)

      val1 += 1 if val1 < val2
      val1 -= 1 if val1 > val2
      val1
    end

    def horz_vert_lines
      @horz_vert_lines ||= @lines.select { |l| x_value(l[0]).eql?(x_value(l[1])) || y_value(l[0]).eql?(y_value(l[1])) }
    end

    def x_value(coord)
      coord.split(',')[0].to_i
    end

    def y_value(coord)
      coord.split(',')[1].to_i
    end
  end

  #----
  class Day05Part2 < Day05Part1
    def run
      (horz_vert_lines | diag_lines).each { |l| draw_line(l) }
      @sea_floor.values.count { |v| v > 1 }
    end

    def diag_lines
      @diag_lines ||= @lines.select do |line|
        delta_x, delta_y = delta_values(line)
        (Math.atan2(delta_x, delta_y) * 180 / Math::PI).to_i.eql?(45)
      end
    end

    def delta_values(line)
      [(x_value(line[0]) - x_value(line[1])).abs, (y_value(line[0]) - y_value(line[1])).abs]
    end
  end

  #-----
  module Day05
    def self.default_input_file
      # File.join(Aoc2021::INPUT_FILES, 'day_05_example.txt')
      File.join(Aoc2021::INPUT_FILES, 'day_05.txt')
    end

    def self.part_one(input_file = default_input_file)
      Aoc2021::Day05Part1.new(input_file).run
    end

    def self.part_two(input_file = default_input_file)
      Aoc2021::Day05Part2.new(input_file).run
    end
  end
end
