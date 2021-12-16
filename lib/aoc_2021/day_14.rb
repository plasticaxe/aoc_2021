# frozen_string_literal: true

module Aoc2021
  #----
  class Day14Part1
    def initialize(input_file)
      @input           = File.read(input_file).each_line(chomp: true).to_a.freeze
      @initial_polymer = @input[0].chars.freeze
      @rule_counter    = {}
    end

    def run(times)
      times.times { run_insertion }
      most_minus_least
    end

    def most_minus_least
      polymer_values = counted_elements
      polymer_values.values.max - polymer_values.values.min
    end

    def run_insertion
      hash = {}
      polymer.each_pair do |k, v|
        update_polymer(hash, k, v)
        update_rule_counter(k, v)
      end
      polymer.replace(hash)
    end

    def update_polymer(hash, key, value)
      [key.chars[0] + rules[key], rules[key] + key.chars[1]].each do |k|
        hash[k] ||= 0
        hash[k] += value
      end
    end

    def update_rule_counter(key, value)
      @rule_counter[rules[key]] ||= 0
      @rule_counter[rules[key]] += value
    end

    def counted_elements
      hash = {}
      @initial_polymer.uniq.each { |c| hash[c] = @initial_polymer.count(c) }
      @rule_counter.each_pair do |k, v|
        hash[k] ||= 0
        hash[k] += v
      end
      hash
    end

    def polymer
      @polymer ||= begin
        hash = {}
        @initial_polymer.each_index do |i|
          break if @initial_polymer[i + 1].nil?

          hash[@initial_polymer[i] + @initial_polymer[i + 1]] ||= 0
          hash[@initial_polymer[i] + @initial_polymer[i + 1]] += 1
        end
        hash
      end
    end

    def rules
      @rules ||= begin
        hash = {}
        @input.select { |l| l.match?('->') }.each { |r| hash[r.split[0]] = r.split[-1] }
        hash
      end
    end
  end

  #----
  class Day14Part2 < Day14Part1; end

  #-----
  module Day14
    def self.default_input_file
      # File.join(Aoc2021::INPUT_FILES, 'day_14_example.txt')
      File.join(Aoc2021::INPUT_FILES, 'day_14.txt')
    end

    def self.part_one(input_file = default_input_file)
      Aoc2021::Day14Part1.new(input_file).run(10)
    end

    def self.part_two(input_file = default_input_file)
      Aoc2021::Day14Part2.new(input_file).run(40)
    end
  end
end
