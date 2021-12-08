# frozen_string_literal: true

module Aoc2021
  #----
  class Day08Part1
    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a.freeze
    end

    def run
      @input.map { |i| i.split('|')[1].strip.split.count { |o| [2, 4, 3, 7].include?(o.size) } }.sum
    end
  end

  #----
  class Day08Part2 < Day08Part1
    #----
    class SignalPatterns
      def initialize(input_line)
        @input_line  = input_line
        @pattern_map = {}
        @pattern_key = {}
      end

      def value_of_outputs
        easy_patterns
        outputs.map { |o| value_of(o) }.join.to_i
      end

      private

      def outputs
        @outputs ||= @input_line.split('|')[1].strip.split.map { |p| p.chars.sort.join }.freeze
      end

      def value_of(output)
        @pattern_map[output] ||= figure_out(output)
      end

      def easy_patterns
        pattern_of('1', 2)
        pattern_of('4', 4)
        pattern_of('7', 3)
        pattern_of('8', 7)
      end

      def pattern_of(number, size)
        pattern               = patterns_by_size(size)[0]
        @pattern_map[pattern] = number
        @pattern_key[number]  = pattern.chars
      end

      def patterns_by_size(size)
        patterns.select { |p| p.size.eql?(size) }
      end

      def patterns
        @patterns ||= @input_line.split('|')[0].strip.split.map { |p| p.chars.sort.join }.freeze
      end

      def figure_out(output)
        case output.size
        when 5
          output_size_five(output)
        when 6
          output_size_six(output)
        end
      end

      def output_size_six(output)
        if (output.chars & @pattern_key['1']).size.eql?(1)
          '6'
        elsif (output.chars & @pattern_key['4']).size.eql?(4)
          '9'
        else
          '0'
        end
      end

      def output_size_five(output)
        if (output.chars & @pattern_key['7']).size.eql?(3)
          '3'
        elsif (output.chars & @pattern_key['4']).size.eql?(3)
          '5'
        else
          '2'
        end
      end
    end

    def run
      @input.map { |i| SignalPatterns.new(i).value_of_outputs }.sum
    end
  end

  #-----
  module Day08
    def self.default_input_file
      # File.join(Aoc2021::INPUT_FILES, 'day_08_example.txt')
      File.join(Aoc2021::INPUT_FILES, 'day_08.txt')
    end

    def self.part_one(input_file = default_input_file)
      Aoc2021::Day08Part1.new(input_file).run
    end

    def self.part_two(input_file = default_input_file)
      Aoc2021::Day08Part2.new(input_file).run
    end
  end
end
