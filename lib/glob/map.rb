# frozen_string_literal: true

module Glob
  class Map
    def self.call(target)
      new(target).call
    end

    def initialize(target)
      @keys = []
      @target = target
    end

    def call
      @target
        .map {|(key, value)| compute(value, key) }
        .flatten
        .sort
    end

    private def compute(value, path)
      if value.is_a?(Hash)
        value.map do |key, other_value|
          compute(other_value, "#{path}.#{key}")
        end
      else
        path.to_s
      end
    end
  end
end
