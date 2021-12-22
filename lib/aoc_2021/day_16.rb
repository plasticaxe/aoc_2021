# frozen_string_literal: true

require 'yaml'

module Aoc2021
  #----
  class Day16Part1
    def initialize(input_file)
      @input       = File.read(input_file).each_line(chomp: true).to_a[0].strip.freeze
      @all_packets = []
    end

    def run
      parse_packet(hex_to_bin(@input))
      @all_packets.map { |p| p[:version] }.sum
    end

    def hex_to_bin(hex_num)
      num = hex_num.hex.to_s(2).chars
      num.unshift('0') until (num.size % 4).zero?
      num
    end

    def parse_packet(packet)
      hash           = {}
      hash[:version] = packet.shift(3).join.to_i(2)
      hash[:type_id] = packet.shift(3).join.to_i(2)
      hash[:value] = if hash[:type_id].eql?(4)
                       parse_literal(packet)
                     else
                       parse_operator(packet)
                     end
      @all_packets << hash
      hash
    end

    def parse_literal(packet)
      result = ''
      loop do
        number = packet.shift(5)
        result += number[1..].join
        break unless number[0].eql?('1')
      end
      result.to_i(2)
    end

    def parse_operator(packet)
      length_type_id = packet.shift
      if length_type_id.eql?('0')
        sub_packet_size = packet.shift(15).join.to_i(2)
        parse_sub_packets_by_size(packet, sub_packet_size)
      else
        sub_packet_count = packet.shift(11).join.to_i(2)
        parse_sub_packets_by_count(packet, sub_packet_count)
      end
    end

    def parse_sub_packets_by_size(packet, size)
      result = []
      sub_packets = packet.shift(size)
      result << parse_packet(sub_packets) until sub_packets.empty?
      result
    end

    def parse_sub_packets_by_count(packet, count)
      result = []
      count.times do
        result << parse_packet(packet)
      end
      result
    end
  end

  #----
  class Day16Part2 < Day16Part1
    def run
      parse_packet(hex_to_bin(@input))
      parse_transmission(@all_packets[-1])
    end

    def parse_transmission(trans)
      return trans[:value] if trans[:type_id].eql?(4)

      sub_trans = trans[:value].map { |t| parse_transmission(t) }
      send(operation_map[trans[:type_id]], sub_trans)
    end

    def operation_map
      { 0 => :sum, 1 => :product, 2 => :min, 3 => :max,
        5 => :greater_than, 6 => :less_than, 7 => :equal }
    end

    def sum(array)
      array.inject(:+)
    end

    def product(array)
      array.inject(:*)
    end

    def min(array)
      array.min
    end

    def max(array)
      array.max
    end

    def greater_than(array)
      array[0] > array[1] ? 1 : 0
    end

    def less_than(array)
      array[0] < array[1] ? 1 : 0
    end

    def equal(array)
      array[0].eql?(array[1]) ? 1 : 0
    end
  end

  #-----
  module Day16
    def self.default_input_file
      # File.join(Aoc2021::INPUT_FILES, 'day_16_example.txt')
      File.join(Aoc2021::INPUT_FILES, 'day_16.txt')
    end

    def self.part_one(input_file = default_input_file)
      Aoc2021::Day16Part1.new(input_file).run
    end

    def self.part_two(input_file = default_input_file)
      Aoc2021::Day16Part2.new(input_file).run
    end
  end
end
