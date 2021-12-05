# frozen_string_literal: true

module Aoc2021
  #----
  class Day04Part1
    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a.freeze
      @drawn = @input[0].split(',').map(&:to_i)
    end

    def run
      @drawn.each do |n|
        grids.each do |g|
          g.each { |l| return winner(g, n) if check_line_for_number(l, n).sum.zero? }
        end
      end
    end

    def check_line_for_number(line, number)
      line.map! { |v| v.eql?(number) ? 0 : v }
    end

    def winner(grid, drawn_number)
      grid.flatten.sum * drawn_number
    end

    def grids
      @grids ||= begin
        all_grids = []
        @input[2..].each_slice(6) do |s|
          this_grid = s[0..4].map { |l| l.split.map(&:to_i) }
          all_grids << this_grid
          all_grids << this_grid.transpose
        end
        all_grids
      end
    end
  end

  #----
  class Day04Part2 < Day04Part1
    def run
      winners = []
      @drawn.each do |n|
        grids.each do |g|
          next if won_already?(g)

          g.each { |l| winners << winner(g, n) if check_line_for_number(l, n).sum.zero? }
        end
      end
      winners.last
    end

    def won_already?(grid)
      (@won_already ||= {})[grid] ||= begin
        (grid + grid.transpose).each { |l| return true if l.sum.zero? }
        false
      end
    end
  end

  #-----
  module Day04
    def self.default_input_file
      # File.join(Aoc2021::INPUT_FILES, 'day_04_example.txt')
      File.join(Aoc2021::INPUT_FILES, 'day_04.txt')
    end

    def self.part_one(input_file = default_input_file)
      Aoc2021::Day04Part1.new(input_file).run
    end

    def self.part_two(input_file = default_input_file)
      Aoc2021::Day04Part2.new(input_file).run
    end
  end
end
