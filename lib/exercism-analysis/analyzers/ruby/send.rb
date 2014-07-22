class Exercism
  module Analyzers

    class Send < Analyzer

      processor Processors::SendProcessor

      def call
        feedback = processor.result.map do |exp|
          Feedback.from_src(:send, exp.src_extract, public_send_template(exp))
        end
        Result.new(:send, feedback)
      end

      private

      def public_send_template(exp)
        receiver = [exp.receiver.src, '.'].join if exp.receiver
        [padding(exp), receiver, 'public_send', exp.args.src].compact.join
      end

    end

  end
end