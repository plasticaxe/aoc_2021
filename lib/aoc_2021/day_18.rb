# frozen_string_literal: true

module Aoc2021
  #----
  class Day18Part1
    def initialize(input_file)
      @input  = File.read(input_file).each_line(chomp: true).to_a
    end

    def run
      @number = @input.shift
      until @input.empty?
        @number.replace("[#{@number},#{@input.shift}]")
        loop { break unless explode_or_split? }
      end
      magnitude
    end

    def explode_or_split?
      return true if explode?
      return true if split?

      false
    end

    def number_as_array
      @number.dup.scan(/\d+|\D+/).flat_map { |c| c.match?(/\d+/) ? c : c.chars }
    end

    def explode?
      depth, last_left_num_index, number_array = explode_vars
      number_array.each_index do |index|
        depth -= 1 if number_array[index].eql?(']')
        last_left_num_index = index if number_array[index].match?(/\d+/)
        if number_array[index].eql?('[')
          depth += 1
          return true if time_to_explode?(depth, number_array, index, last_left_num_index)
        end
      end
      false
    end

    def explode_vars
      [0, nil, number_as_array]
    end

    def time_to_explode?(depth, number_array, index, last_left_num_index)
      if depth.eql?(5) && number_array[index + 1..index + 3].join.match?(/\d+,\d+/)
        explode_actions(number_array, index, last_left_num_index)
        @number.replace(number_array.join)
        return true
      end
      false
    end

    def number_members(number_array, index)
      [number_array[index + 1].to_i, number_array[index + 3].to_i]
    end

    def explode_actions(number_array, index, last_left_num_index)
      l_num, r_num = number_members(number_array, index)
      # LHS
      update_lhs(number_array, last_left_num_index, l_num)
      # RHS
      update_rhs(number_array, index, r_num)
      # Replace with 0
      replace_with_zero(number_array, index)
    end

    def update_lhs(number_array, last_left_num_index, l_num)
      number_array[last_left_num_index] = number_array[last_left_num_index].to_i + l_num unless last_left_num_index.nil?
    end

    def update_rhs(number_array, index, r_num)
      number_array.each_index do |next_index|
        next unless next_index > (index + 4) && number_array[next_index].match(/\d+/)

        number_array[next_index] = number_array[next_index].to_i + r_num
        break
      end
    end

    def replace_with_zero(number_array, index)
      number_array[index] = '0'
      4.times do
        number_array.delete_at((index + 1))
      end
    end

    def split?
      num = number_as_array
      num.each_index do |i|
        next unless num[i].match?(/\d\d/)

        num[i] = "[#{(num[i].to_i / 2.0).floor},#{(num[i].to_i / 2.0).ceil}]"

        @number.replace(num.join)
        return true
      end
      false
    end

    def magnitude
      num = @number.dup
      while num.match?(/\[\d+,\d+\]/)
        num.gsub!(/\[(\d+),(\d+)\]/) { (Regexp.last_match[1].to_i * 3) + (Regexp.last_match[2].to_i * 2) }
      end
      num.to_i
    end
  end

  #----
  class Day18Part2 < Day18Part1
    def run
      @number = String.new
      @input.each_with_index.flat_map do |first_num, first_index|
        @input.each_with_index.map do |second_num, second_index|
          next if first_index.eql?(second_index)

          @number.replace("[#{first_num},#{second_num}]")
          loop { break unless explode_or_split? }
          magnitude
        end
      end.compact.max
    end
  end

  #-----
  module Day18
    def self.default_input_file
      # File.join(Aoc2021::INPUT_FILES, 'day_18_example.txt')
      File.join(Aoc2021::INPUT_FILES, 'day_18.txt')
    end

    def self.part_one(input_file = default_input_file)
      Aoc2021::Day18Part1.new(input_file).run
    end

    def self.part_two(input_file = default_input_file)
      Aoc2021::Day18Part2.new(input_file).run
    end
  end
end
