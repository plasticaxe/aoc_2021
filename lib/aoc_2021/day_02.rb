# frozen_string_literal: true

module Aoc2021
  #----
  class Day02Part1
    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a
    end

    def run
      values['forward'].sum * (values['down'].sum - values['up'].sum)
    end

    def values
      @values ||= begin
        hash = {}
        @input.each { |line| (hash[line.split[0].strip] ||= []) << line.split[1].strip.to_i }
        hash
      end
    end
  end

  #----
  class Day02Part2 < Day02Part1
    def initialize(input_file)
      super
      @aim                 = 0
      @depth               = 0
      @horizontal_position = 0
    end

    def run
      execute_commands
      @horizontal_position * @depth
    end

    def execute_commands
      @input.each do |line|
        command = line.split[0].strip
        amount  = line.split[1].strip.to_i
        if command.eql?('forward')
          move_forward(amount)
        else
          adjust_aim(command.eql?('up') ? -amount : amount)
        end
      end
    end

    def move_forward(amount)
      @horizontal_position += amount
      @depth               += amount * @aim
    end

    def adjust_aim(amount)
      @aim += amount
    end
  end

  #-----
  module Day02
    def self.default_input_file
      # File.join(Aoc2021::INPUT_FILES, 'day_02_example.txt')
      File.join(Aoc2021::INPUT_FILES, 'day_02.txt')
    end

    def self.part_one(input_file = default_input_file)
      Aoc2021::Day02Part1.new(input_file).run
    end

    def self.part_two(input_file = default_input_file)
      Aoc2021::Day02Part2.new(input_file).run
    end
  end
end
