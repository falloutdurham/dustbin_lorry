require 'spec_helper'

describe Rack::DustbinLorry do
  let(:app) { double('App') }
  let(:middleware) { described_class.new(app) }

  context 'on no cache change' do
    context 'when used without Rails' do
      let(:env) { double('Rack::Env') }
      let(:logger) { double('Rack::Logger') }

      it 'does not log' do
        expect(app).to receive(:call).with(env)
        expect(env).not_to receive(:[]).with('rack.logger')
        middleware.call(env)
      end
    end
  end
  
  context 'on cache change' do
    context 'when used with Rails' do
      let(:env) { double('Rack::Env') }
      let(:breaking_app) { BREAK = 1 }
      let(:logger) { double('Rails::Logger') }

      before(:each) {
        stub_const("Rails", 'Rails') 
        
        allow(app).to receive(:call).with(env) { 
          a = String.new
          a.extend(Math)
        }
        expect(Rails).to receive(:logger).and_return logger
      }

      it 'uses the Rails logger' do
        expect(logger).to receive(:info)
        middleware.call(env)
      end
    

      it 'logs a change in the global_method_state' do
        allow(app).to receive(:call).with(env) {  Object.class_exec { def new_method; end }   }
        expect(logger).to receive(:info)
        middleware.call(env)
      end

      it 'logs a change in the global_constant_state' do 
        allow(app).to receive(:call).with(env) {  self.class.const_set :"TEST", "test"  }
        expect(logger).to receive(:info)
        middleware.call(env)
      end

      it 'logs a change in the class_serial' do
        allow(app).to receive(:call).with(env) { Object.class_eval "class Lorry; end" }
        expect(logger).to receive(:info)
        middleware.call(env)
      end
    end
  end
end
