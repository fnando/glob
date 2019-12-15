# frozen_string_literal: true

module Glob
  class Matcher
    attr_reader :path, :regex

    def initialize(path)
      @path = path
      @reject = path.start_with?("!")

      pattern = Regexp.escape(path.gsub(/^!/, "")).gsub(/\\\*/, "[^.]+")
      @regex = Regexp.new("^#{pattern}")
    end

    def match?(other)
      other.match?(regex)
    end

    def include?
      !reject?
    end

    def reject?
      @reject
    end
  end
end
