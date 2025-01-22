module Treetop
  module Compiler
    class Grammar < Runtime::SyntaxNode
      def compile
        builder = RubyBuilder.new

        builder.module_declaration "#{grammar_name.text_value}" do
          builder.in(indent_level) # account for initial indentation of grammar declaration
          builder << "include Treetop::Runtime"
          builder.newline
          declaration_sequence.compile(builder)
          builder.newline
          builder.class_declaration "Parser < Treetop::Runtime::CompiledParser" do
            builder << "include #{grammar_name.text_value}"
          end
        end
        builder.newline
        builder << "#{parser_name} = #{grammar_name.text_value}::Parser"
      end

      def indent_level
        input.column_of(interval.begin) - 1
      end

      def parser_name
        grammar_name.text_value + 'Parser'
      end
    end
  end
end
