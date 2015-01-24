module Rack
  class DustbinLorry
    def initialize(app)
      @app = app
    end

    def call(env)
      cache_before = RubyVM.stat
      response = @app.call(env)
      cache_after = RubyVM.stat
      result = delta_cache(cache_before, cache_after)
      logger(env).info "Method cache change: #{result}" if result.select{ |k,v| v != 0 }.any?
      response
    end

    private

    def delta_cache(before, after)
      states.each_with_object({}) do |counter, delta|
        delta[counter] = after[counter] - before[counter]
      end
    end

    def states
      [:global_method_state, :global_constant_state, :class_serial]
    end

    def logger(env)
      @logger ||= if defined?(Rails)
        Rails.logger
      else
        env['rack.logger']
      end
    end
  end
end
