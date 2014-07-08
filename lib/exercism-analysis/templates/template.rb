class Exercism
  module Templates

    class Template

      BLACKLIST = %w(each)

      def self.render(*args)
        new(*args).render
      end

      protected

      def padding(exp)
        ' ' * exp.column
      end

      def pad(string, exp)
        if string.empty?
          string
        else
          padding(exp) + string
        end
      end

    end

  end
end