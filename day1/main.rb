# frozen_string_literal: true

require "ap"

class Day1
  class << self
    def first
      elfs.first
    end

    def second
      elfs.take(3).sum
    end

    private

    def elfs
      input.split("\n\n").map { |elf| elf.split("\n").sum(&:to_i) }.sort.reverse
    end

    def input
      File.read(File.join(File.dirname(__FILE__), "input.txt"))
    end
  end
end

ap "First"
ap Day1.first

ap "Second"
ap Day1.second
