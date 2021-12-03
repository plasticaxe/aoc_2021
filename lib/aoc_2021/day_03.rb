# frozen_string_literal: true

module Aoc2021
  #----
  class Day03Part1
    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a
    end

    def run
      rate('gam') * rate('eps')
    end

    def rate(type)
      @input[0].chars.each_index.map { |index| send("#{type}_at_index", index) }.join.to_i(2)
    end

    def gam_at_index(index, numbers = @input)
      count_at_index(index, '1', numbers) >= count_at_index(index, '0', numbers) ? '1' : '0'
    end

    def eps_at_index(index, numbers = @input)
      count_at_index(index, '1', numbers) >= count_at_index(index, '0', numbers) ? '0' : '1'
    end

    def count_at_index(index, bit, numbers)
      bits_at_pos(index, numbers).count { |b| b.eql?(bit) }
    end

    def bits_at_pos(index, numbers)
      numbers.map { |f| f.chars[index] }
    end
  end

  #----
  class Day03Part2 < Day03Part1
    def run
      rating('gam') * rating('eps')
    end

    def rating(type)
      numbers = @input.dup
      numbers[0].chars.each_index do |index|
        val = send("#{type}_at_index", index, numbers)
        numbers.select! { |n| n.chars[index].eql?(val) }
        break if numbers.size.eql?(1)
      end
      numbers[0].to_i(2)
    end
  end

  #-----
  module Day03
    def self.default_input_file
      # File.join(Aoc2021::INPUT_FILES, 'day_03_example.txt')
      File.join(Aoc2021::INPUT_FILES, 'day_03.txt')
    end

    def self.part_one(input_file = default_input_file)
      Aoc2021::Day03Part1.new(input_file).run
    end

    def self.part_two(input_file = default_input_file)
      Aoc2021::Day03Part2.new(input_file).run
    end
  end
end
