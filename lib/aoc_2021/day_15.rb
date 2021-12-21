# frozen_string_literal: true

require 'set'

module Aoc2021
  #----
  class Day15Part1
    def initialize(input_file)
      @input     = File.read(input_file).each_line(chomp: true).to_a.map { |l| l.strip.chars.map(&:to_i) }.freeze
      @graph     = Graph.new
      @max_index = @input[0].size - 1
    end

    def run
      add_all_edges
      @graph.shortest_path
    end

    def add_all_edges
      0.upto(@max_index) do |x|
        0.upto(@max_index) do |y|
          add_edge_north(x, y)
          add_edge_south(x, y)
          add_edge_east(x, y)
          add_edge_west(x, y)
        end
      end
    end

    def add_edge_north(x_val, y_val)
      return if (y_val - 1).negative?

      @graph.add_edge("#{x_val},#{y_val}", "#{x_val},#{y_val - 1}", risk_at(x_val, y_val - 1))
    end

    def add_edge_south(x_val, y_val)
      return if y_val + 1 > @max_index

      @graph.add_edge("#{x_val},#{y_val}", "#{x_val},#{y_val + 1}", risk_at(x_val, y_val + 1))
    end

    def add_edge_east(x_val, y_val)
      return if x_val + 1 > @max_index

      @graph.add_edge("#{x_val},#{y_val}", "#{x_val + 1},#{y_val}", risk_at(x_val + 1, y_val))
    end

    def add_edge_west(x_val, y_val)
      return if (x_val - 1).negative?

      @graph.add_edge("#{x_val},#{y_val}", "#{x_val - 1},#{y_val}", risk_at(x_val - 1, y_val))
    end

    def risk_at(x_val, y_val)
      (@risk_at ||= {})["#{x_val},#{y_val}"] ||= cavern["#{x_val},#{y_val}"]
    end

    def cavern
      @cavern ||= begin
        hash = {}
        @input.each_with_index do |_row, y|
          @input[y].each_with_index { |risk, x| hash["#{x},#{y}"] = risk.to_i }
        end
        hash
      end
    end

    # Adapted from https://gist.github.com/piki/dc6a3ee8eb90be0f5c61dd972988094f
    class Graph
      INFINITY = 1 << 64

      def initialize
        @graph = {}
        @nodes = Set.new
      end

      def connect_graph(source, target, weight)
        !@graph.key?(source) ? @graph[source] = { target => weight } : @graph[source][target] = weight
        @nodes << source
      end

      def add_edge(source, target, weight)
        connect_graph(source, target, weight)
      end

      # based of wikipedia's pseudocode: http://en.wikipedia.org/wiki/Dijkstra's_algorithm
      def dijkstra(source)
        reset_distance_and_previous(source)
        queue = Set.new
        queue << source
        until queue.empty?
          node = queue.min_by { |n| @distance[n] }
          break if @distance[node].eql?(INFINITY)

          process_queue_node(queue, node)
        end
      end

      def process_queue_node(queue, node)
        queue.delete(node)
        @graph[node].each_key do |vertex|
          alt = @distance[node] + @graph[node][vertex]
          next unless alt < @distance[vertex]

          @distance[vertex] = alt
          @previous[vertex] = node
          queue << vertex
        end
      end

      def reset_distance_and_previous(source)
        @distance = {}
        @previous = {}
        @nodes.each do |node|
          @distance[node] = INFINITY
          @previous[node] = -1
        end
        @distance[source] = 0
      end

      def find_path(dest)
        find_path(@previous[dest]) if @previous[dest] != -1
        @path ||= []
        @path << dest
      end

      def shortest_path
        dijkstra('0,0')
        path = nil
        @nodes.each do |dest|
          @path = []
          find_path(dest)
          path = @distance[dest] != INFINITY ? @distance[dest] : 'no path'
        end
        path
      end
    end
  end

  #----
  class Day15Part2 < Day15Part1
    def initialize(input_file)
      super
      @max_index = (@input[0].size * 5) - 1
    end

    def cavern
      @cavern ||= begin
        hash = {}
        add_multiple_panels(hash)
        hash
      end
    end

    def add_multiple_panels(hash)
      0.upto(4) do |y_loop|
        @input.each_index do |y_val|
          0.upto(4) do |x_loop|
            @input[y_val].each_with_index do |risk, x_val|
              add_node_to_cavern(hash, x_val: x_val, y_val: y_val, risk: risk, x_loop: x_loop, y_loop: y_loop)
            end
          end
        end
      end
    end

    def add_node_to_cavern(cavern, **args)
      adj_risk = args[:risk].to_i + args[:x_loop] + args[:y_loop]
      cavern[new_coords(args)] = adj_risk > 9 ? adj_risk % 9 : adj_risk
    end

    def new_coords(**args)
      @original_size ||= @input[0].size
      x_new = args[:x_val] + (@original_size * args[:x_loop])
      y_new = args[:y_val] + (@original_size * args[:y_loop])
      "#{x_new},#{y_new}"
    end
  end

  #-----
  module Day15
    def self.default_input_file
      # File.join(Aoc2021::INPUT_FILES, 'day_15_example.txt')
      File.join(Aoc2021::INPUT_FILES, 'day_15.txt')
    end

    def self.part_one(input_file = default_input_file)
      Aoc2021::Day15Part1.new(input_file).run
    end

    def self.part_two(input_file = default_input_file)
      Aoc2021::Day15Part2.new(input_file).run
    end
  end
end
