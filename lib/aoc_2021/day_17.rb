# frozen_string_literal: true

module Aoc2021
  #----
  class Day17Part1
    #----
    class Probe
      attr_reader :y_max

      def initialize(**args)
        @x_vel = args[:x_vel]
        @y_vel = args[:y_vel]
        @x_tgt = args[:x_tgt]
        @y_tgt = args[:y_tgt]
        @x_pos = 0
        @y_pos = 0
        @y_max = 0
      end

      def hits_target?
        loop do
          return true if in_target_zone?
          return false if overshot_target_zone?

          run_step
        end
      end

      def run_step
        @x_pos += @x_vel
        @y_pos += @y_vel
        @y_max = @y_pos if @y_pos > @y_max
        @x_vel -= 1 unless @x_vel.zero?
        @y_vel -= 1
      end

      def in_target_zone?
        @x_tgt.include?(@x_pos) && @y_tgt.include?(@y_pos)
      end

      def overshot_target_zone?
        @x_pos > (@x_tgt_max ||= @x_tgt.max) || @y_pos < (@y_tgt_min ||= @y_tgt.min)
      end
    end

    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a[0]
      parse_x_tgt_y_tgt
    end

    def run
      1.upto(@x_tgt.max).flat_map do |x_vel|
        @y_tgt.min.abs.downto(@y_tgt.min).map do |y_vel|
          probe = Probe.new(x_vel: x_vel, y_vel: y_vel, x_tgt: @x_tgt, y_tgt: @y_tgt)
          probe.hits_target? ? probe.y_max : nil
        end
      end.compact.max
    end

    def parse_x_tgt_y_tgt
      values = @input.gsub(/-?\d+/).to_a.map(&:to_i)
      @x_tgt = values[0].upto(values[1]).to_a
      @y_tgt = values[2].upto(values[3]).to_a
    end
  end

  #----
  class Day17Part2 < Day17Part1
    def run
      count = 0
      1.upto(@x_tgt.max).flat_map do |x_vel|
        @y_tgt.min.abs.downto(@y_tgt.min).map do |y_vel|
          probe = Probe.new(x_vel: x_vel, y_vel: y_vel, x_tgt: @x_tgt, y_tgt: @y_tgt)
          count += 1 if probe.hits_target?
        end
      end
      count
    end
  end

  #-----
  module Day17
    def self.default_input_file
      # File.join(Aoc2021::INPUT_FILES, 'day_17_example.txt')
      File.join(Aoc2021::INPUT_FILES, 'day_17.txt')
    end

    def self.part_one(input_file = default_input_file)
      Aoc2021::Day17Part1.new(input_file).run
    end

    def self.part_two(input_file = default_input_file)
      Aoc2021::Day17Part2.new(input_file).run
    end
  end
end
