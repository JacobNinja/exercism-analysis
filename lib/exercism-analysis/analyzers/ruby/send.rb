class Exercism
  module Analyzers

    class Send < Analyzer

      def self.call(adapter)
        send_processor = Processors::SendProcessor.new
        CodeMiner.process(adapter.code, [send_processor])
        feedback = send_processor.result.map do |exp|
          Feedback.new(exp.src_extract, public_send_template(exp))
        end
        Result.new(:send, feedback)
      end

      private

      def self.public_send_template(exp)
        receiver = [exp.receiver.src, '.'].join if exp.receiver
        [padding(exp), receiver, 'public_send', exp.args.src].compact.join
      end

    end

  end
end