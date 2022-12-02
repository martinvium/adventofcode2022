# frozen_string_literal: true

require "ap"

class Day2Part1
  WIN = 6
  EVEN = 3
  LOSS = 0

  IN = {
    "A" => :rock,
    "B" => :paper,
    "C" => :scissor
  }.freeze

  OUT = {
    "X" => :rock,
    "Y" => :paper,
    "Z" => :scissor
  }

  SCORES = {
    {in: :rock, out: :rock} => EVEN,
    {in: :rock, out: :paper} => WIN,
    {in: :rock, out: :scissor} => LOSS,
    {in: :paper, out: :rock} => LOSS,
    {in: :paper, out: :paper} => EVEN,
    {in: :paper, out: :scissor} => WIN,
    {in: :scissor, out: :rock} => WIN,
    {in: :scissor, out: :paper} => LOSS,
    {in: :scissor, out: :scissor} => EVEN
  }

  SHAPES = {
    rock: 1,
    paper: 2,
    scissor: 3
  }.freeze

  class << self
    def call
      items.map { |item| [item, score(item)] }.sum { |(_, score)| score }
    end

    private

    def score(item)
      SCORES.fetch(item) + SHAPES.fetch(item.fetch(:out))
    end

    def items
      lines.map { |line| to_item(line) }
    end

    def to_item(line)
      a, b = line.split(" ")
      {in: IN.fetch(a), out: OUT.fetch(b)}
    end

    def lines
      input.split("\n")
    end

    def input
      File.read(File.join(File.dirname(__FILE__), "input.txt"))
    end
  end
end

ap Day2Part1.call
