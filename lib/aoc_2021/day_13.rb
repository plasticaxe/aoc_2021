# frozen_string_literal: true

require 'set'

module Aoc2021
  #----
  class Day13Part1
    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a.freeze
    end

    def run
      process_fold(0)
      dots.uniq.count
    end

    def process_fold(index)
      axis = folds[index][:axis]
      line = folds[index][:line]
      dots.each do |dot|
        dot[axis.to_sym] = (line - ((dot[axis.to_sym] - line))) if dot[axis.to_sym] > line
      end
    end

    def dots
      @dots ||= @input.grep(/\d,\d/).map do |d|
        { x: d.split(',')[0].to_i, y: d.split(',')[1].to_i }
      end.to_set
    end

    def folds
      @folds ||= @input.grep(/^fold/).map do |f|
        { axis: f.split[-1].split('=')[0], line: f.split[-1].split('=')[1].to_i }
      end
    end
  end

  #----
  class Day13Part2 < Day13Part1
    def run
      folds.each_index { |i| process_fold(i) }
      draw_dots
      dots.uniq.count
    end

    def draw_dots
      0.upto(max_y).each do |y|
        puts 0.upto(max_x).map { |x| dots.find { |d| d[:x].eql?(x) && d[:y].eql?(y) }.nil? ? ' ' : '#' }.join
      end
    end

    def max_x
      dots.map { |d| d[:x] }.max
    end

    def max_y
      dots.map { |d| d[:y] }.max
    end
  end

  #-----
  module Day13
    def self.default_input_file
      # File.join(Aoc2021::INPUT_FILES, 'day_13_example.txt')
      File.join(Aoc2021::INPUT_FILES, 'day_13.txt')
    end

    def self.part_one(input_file = default_input_file)
      Aoc2021::Day13Part1.new(input_file).run
    end

    def self.part_two(input_file = default_input_file)
      Aoc2021::Day13Part2.new(input_file).run
    end
  end
end
