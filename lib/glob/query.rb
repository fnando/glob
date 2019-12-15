# frozen_string_literal: true

module Glob
  class Query
    def initialize(target)
      @target = target
    end

    def query(search)
      map = Map.call(@target)
      pattern = Regexp.escape(search).gsub(/\\\*/, "[^.]+")
      regex = Regexp.new("^#{pattern}")

      matches = map.select {|path| path.match?(regex) }

      Result.new(paths: matches, target: @target)
    end
  end
end
