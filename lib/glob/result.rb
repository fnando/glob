# frozen_string_literal: true

module Glob
  class Result
    def initialize(target:, paths:)
      @target = target
      @paths = paths
    end

    def paths
      @paths.dup
    end

    def to_hash
      target = symbolize_keys(@target)

      @paths.each_with_object({}) do |path, buffer|
        segments = path.split(".").map(&:to_sym)
        value = target.dig(*segments)
        set_path_value(segments, buffer, value)
      end
    end

    def symbolize_keys(target)
      case target
      when Hash
        target.each_with_object({}) do |(key, value), buffer|
          buffer[key.to_sym] = symbolize_keys(value)
        end
      when Array
        target.map {|item| symbolize_keys(item) }
      else
        target
      end
    end

    def set_path_value(segments, target, value)
      while (segment = segments.shift)
        if segments.empty?
          target[segment] = value
        else
          target[segment] ||= {}
          target = target[segment]
        end
      end
    end
  end
end
