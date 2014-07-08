class Exercism
  module Processors

    class Processor

      def find_exps(nodes, *types, &filter)
        filter ||= -> * { true }
        nodes.each.flat_map do |node|
          if node.respond_to?(:type) && types.include?(node.type) && filter.call(node)
            [node] + find_exps(node.each, *types, &filter)
          elsif node.respond_to?(:each)
            find_exps(node.each, *types, &filter)
          else
            []
          end
        end
      end

      def find_exp(exp, *types, &filter)
        filter ||= -> * { true }
        exp.each.find do |node|
          if node.respond_to?(:type) && types.include?(node.type) && filter.call(node)
            node
          elsif node.respond_to?(:each)
            result = find_exp(node.each, *types, &filter)
            return result if result
          end
        end
      end

    end

  end
end