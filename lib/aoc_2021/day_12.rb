# frozen_string_literal: true

require 'set'

module Aoc2021
  #----
  class Day12Part1
    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a.map { |l| l.split('-') }.freeze
    end

    def run
      parse_paths(next_cave(['start'])).count
    end

    def next_cave(path)
      valid_next_caves(path).map { |c| c.eql?('end') ? path.dup << 'end' : next_cave(path.dup << c) }
    end

    def valid_next_caves(path)
      caves[path[-1]].reject do |c|
        (path.include?(c) && c.match?(/^[a-z]+$/)) || (caves[c].nil? && !c.eql?('end'))
      end
    end

    def parse_paths(paths)
      paths.flatten.join(' ').gsub(/end start/, 'end:start').split(':')
    end

    def caves
      @caves ||= begin
        hash = {}
        @input.each do |i|
          (hash[i[0]] ||= []) << i[1]
          (hash[i[1]] ||= []) << i[0]
        end
        hash
      end
    end
  end

  #----
  class Day12Part2 < Day12Part1
    def initialize(input_file)
      super
      refine_caves
    end

    def refine_caves
      caves.reject! { |k, _v| k.eql?('end') }.each_value { |v| v.delete('start') }
    end

    def run
      all_paths = Set.new
      caves.each_key.grep(/^[a-z]{2}$/).each do |small_cave|
        @double_cave = small_cave
        parse_paths(next_cave(['start'])).each { |p| all_paths << p }
      end
      all_paths.count
    end

    def valid_next_caves(path)
      caves[path[-1]].reject do |cave|
        small_normal_cave?(path, cave) || small_double_cave?(path, cave) || dead_end?(cave)
      end
    end

    def small_normal_cave?(path, cave)
      path.include?(cave) && cave.match?(/^[a-z]+$/) && !cave.eql?(@double_cave)
    end

    def small_double_cave?(path, cave)
      cave.eql?(@double_cave) && path.count(cave).eql?(2)
    end

    def dead_end?(cave)
      caves[cave].nil? && !cave.eql?('end')
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
