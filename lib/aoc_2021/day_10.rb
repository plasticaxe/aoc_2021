# frozen_string_literal: true

module Aoc2021
  #----
  class Day10Part1
    def initialize(input_file)
      @input    = File.read(input_file).each_line(chomp: true).to_a.freeze
      @opposite = { '(' => ')',
                    '[' => ']',
                    '{' => '}',
                    '<' => '>' }
      @values   = { ')' => 3,
                    ']' => 57,
                    '}' => 1197,
                    '>' => 25_137 }
    end

    def run
      illegal_chars.map { |c| @values[c] }.sum
    end

    def illegal_chars
      illegals = []
      @input.each do |s|
        illegals << first_illegal_char(s)
      end
      illegals.compact
    end

    def first_illegal_char(string)
      record = []
      string.chars.each do |c|
        if @opposite.keys.include?(c)
          record.push(c)
        else
          return c unless c.eql?(@opposite[record.pop])
          return nil if record.empty?
        end
      end
      nil
    end
  end

  #----
  class Day10Part2 < Day10Part1
    def initialize(input_file)
      super
      @points = { ')' => 1, ']' => 2, '}' => 3, '>' => 4 }
    end

    def run
      results = score_for_all_lines.compact.sort
      results[results.size / 2]
    end

    def score_for_all_lines
      @input.map do |string|
        next unless first_illegal_char(string).nil?

        record = []
        string.chars.each { |c| @opposite.keys.include?(c) ? record.push(c) : record.pop }
        score_for_rest_of_line(record)
      end
    end

    def score_for_rest_of_line(record)
      score = 0
      until record.empty?
        new_char = @opposite[record.pop]
        score    = (score * 5) + @points[new_char]
      end
      score
    end
  end

  #-----
  module Day10
    def self.default_input_file
      # File.join(Aoc2021::INPUT_FILES, 'day_10_example.txt')
      File.join(Aoc2021::INPUT_FILES, 'day_10.txt')
    end

    def self.part_one(input_file = default_input_file)
      Aoc2021::Day10Part1.new(input_file).run
    end

    def self.part_two(input_file = default_input_file)
      Aoc2021::Day10Part2.new(input_file).run
    end
  end
end
