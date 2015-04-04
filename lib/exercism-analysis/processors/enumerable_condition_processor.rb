class Exercism
  module Processors

    class EnumerableConditionProcessor < Processor

      ENUMERABLE_METHODS = %w(
        all? any? chunk collect collect_concat count cycle detect drop_while each
        each_cons each_entry each_slice each_with_index each_with_object
        find find_all find_index flat_map grep group_by inject map max max_by
        min min_by minmax minmax_by none? one? partition reduce reject reverse_each
        select slice_after slice_before slice_when sort sort_by take_while zip
      ).to_set

      def initialize
        @conditionals = []
      end

      def process_method_add_block(exp)
        if ENUMERABLE_METHODS.include?(exp.value)
          @conditionals += find_exps(exp.block, :condition)
        end
      end

      def result
        @conditionals
      end

    end

  end
end
