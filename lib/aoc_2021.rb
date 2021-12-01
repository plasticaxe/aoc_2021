# frozen_string_literal: true

Dir.glob(File.join(File.dirname(__FILE__), 'aoc_2021', '*.rb')).each do |f|
  require "aoc_2021/#{File.basename(f, '.rb')}"
end

module Aoc2021
  INPUT_FILES = File.join(__dir__, '..', 'resources', 'input')

  class Error < StandardError; end
end
