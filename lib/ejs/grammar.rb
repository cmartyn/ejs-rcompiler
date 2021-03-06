# Autogenerated from a Treetop grammar. Edits may be lost.


module Ejs
  module Grammar
    include Treetop::Runtime

    def root
      @root ||= :program
    end

    def _nt_program
      start_index = index
      if node_cache[:program].has_key?(index)
        cached = node_cache[:program][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      s0, i0 = [], index
      loop do
        i1 = index
        r2 = _nt_expression
        if r2
          r1 = r2
        else
          r3 = _nt_comment
          if r3
            r1 = r3
          else
            r4 = _nt_scriplet
            if r4
              r1 = r4
            else
              r5 = _nt_static_content
              if r5
                r1 = r5
              else
                @index = i1
                r1 = nil
              end
            end
          end
        end
        if r1
          s0 << r1
        else
          break
        end
      end
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)

      node_cache[:program][start_index] = r0

      r0
    end

    module Expression0
      def script_content
        elements[1]
      end

    end

    module Expression1
      def node_type
        "expression"
      end
      
      def text_value
        script_content.text_value
      end
    end

    def _nt_expression
      start_index = index
      if node_cache[:expression].has_key?(index)
        cached = node_cache[:expression][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      if has_terminal?('<%=', false, index)
        r1 = instantiate_node(SyntaxNode,input, index...(index + 3))
        @index += 3
      else
        terminal_parse_failure('<%=')
        r1 = nil
      end
      s0 << r1
      if r1
        r2 = _nt_script_content
        s0 << r2
        if r2
          if has_terminal?('%>', false, index)
            r3 = instantiate_node(SyntaxNode,input, index...(index + 2))
            @index += 2
          else
            terminal_parse_failure('%>')
            r3 = nil
          end
          s0 << r3
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(Expression0)
        r0.extend(Expression1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:expression][start_index] = r0

      r0
    end

    module Comment0
      def script_content
        elements[1]
      end

    end

    module Comment1
      def node_type
        "comment"
      end
      
      def text_value
        script_content.text_value
      end
    end

    def _nt_comment
      start_index = index
      if node_cache[:comment].has_key?(index)
        cached = node_cache[:comment][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      if has_terminal?('<%#', false, index)
        r1 = instantiate_node(SyntaxNode,input, index...(index + 3))
        @index += 3
      else
        terminal_parse_failure('<%#')
        r1 = nil
      end
      s0 << r1
      if r1
        r2 = _nt_script_content
        s0 << r2
        if r2
          if has_terminal?('%>', false, index)
            r3 = instantiate_node(SyntaxNode,input, index...(index + 2))
            @index += 2
          else
            terminal_parse_failure('%>')
            r3 = nil
          end
          s0 << r3
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(Comment0)
        r0.extend(Comment1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:comment][start_index] = r0

      r0
    end

    module Scriplet0
      def script_content
        elements[1]
      end

    end

    module Scriplet1
      def node_type
        "scriplet"
      end
      
      def text_value
        script_content.text_value
      end
    end

    def _nt_scriplet
      start_index = index
      if node_cache[:scriplet].has_key?(index)
        cached = node_cache[:scriplet][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      i0, s0 = index, []
      if has_terminal?('<%', false, index)
        r1 = instantiate_node(SyntaxNode,input, index...(index + 2))
        @index += 2
      else
        terminal_parse_failure('<%')
        r1 = nil
      end
      s0 << r1
      if r1
        r2 = _nt_script_content
        s0 << r2
        if r2
          if has_terminal?('%>', false, index)
            r3 = instantiate_node(SyntaxNode,input, index...(index + 2))
            @index += 2
          else
            terminal_parse_failure('%>')
            r3 = nil
          end
          s0 << r3
        end
      end
      if s0.last
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(Scriplet0)
        r0.extend(Scriplet1)
      else
        @index = i0
        r0 = nil
      end

      node_cache[:scriplet][start_index] = r0

      r0
    end

    module StaticContent0
      def node_type
        "static_content"
      end

      def text_value
        elements.map do |element|
          element.text_value
        end.join('')
      end
    end

    def _nt_static_content
      start_index = index
      if node_cache[:static_content].has_key?(index)
        cached = node_cache[:static_content][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      s0, i0 = [], index
      loop do
        i1 = index
        r2 = _nt_right_delimeter_escaped
        if r2
          r1 = r2
        else
          r3 = _nt_left_delimeter_escaped
          if r3
            r1 = r3
          else
            r4 = _nt_unescaped_static_content
            if r4
              r1 = r4
            else
              @index = i1
              r1 = nil
            end
          end
        end
        if r1
          s0 << r1
        else
          break
        end
      end
      if s0.empty?
        @index = i0
        r0 = nil
      else
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
        r0.extend(StaticContent0)
      end

      node_cache[:static_content][start_index] = r0

      r0
    end

    module ScriptContent0
      def text_value
        elements.map do |element|
          element.text_value
        end.join('')
      end
    end

    def _nt_script_content
      start_index = index
      if node_cache[:script_content].has_key?(index)
        cached = node_cache[:script_content][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      s0, i0 = [], index
      loop do
        i1 = index
        r2 = _nt_right_delimeter_escaped
        if r2
          r1 = r2
        else
          r3 = _nt_left_delimeter_escaped
          if r3
            r1 = r3
          else
            r4 = _nt_unescape_script_content
            if r4
              r1 = r4
            else
              @index = i1
              r1 = nil
            end
          end
        end
        if r1
          s0 << r1
        else
          break
        end
      end
      r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      r0.extend(ScriptContent0)

      node_cache[:script_content][start_index] = r0

      r0
    end

    module RightDelimeterEscaped0
      def text_value
        '%>'
      end
    end

    def _nt_right_delimeter_escaped
      start_index = index
      if node_cache[:right_delimeter_escaped].has_key?(index)
        cached = node_cache[:right_delimeter_escaped][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      if has_terminal?('%%>', false, index)
        r0 = instantiate_node(SyntaxNode,input, index...(index + 3))
        r0.extend(RightDelimeterEscaped0)
        @index += 3
      else
        terminal_parse_failure('%%>')
        r0 = nil
      end

      node_cache[:right_delimeter_escaped][start_index] = r0

      r0
    end

    module LeftDelimeterEscaped0
      def text_value
        '<%'
      end
    end

    def _nt_left_delimeter_escaped
      start_index = index
      if node_cache[:left_delimeter_escaped].has_key?(index)
        cached = node_cache[:left_delimeter_escaped][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      if has_terminal?('<%%', false, index)
        r0 = instantiate_node(SyntaxNode,input, index...(index + 3))
        r0.extend(LeftDelimeterEscaped0)
        @index += 3
      else
        terminal_parse_failure('<%%')
        r0 = nil
      end

      node_cache[:left_delimeter_escaped][start_index] = r0

      r0
    end

    module UnescapedStaticContent0
    end

    def _nt_unescaped_static_content
      start_index = index
      if node_cache[:unescaped_static_content].has_key?(index)
        cached = node_cache[:unescaped_static_content][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      s0, i0 = [], index
      loop do
        i1, s1 = index, []
        i2 = index
        if has_terminal?('<%%', false, index)
          r3 = instantiate_node(SyntaxNode,input, index...(index + 3))
          @index += 3
        else
          terminal_parse_failure('<%%')
          r3 = nil
        end
        if r3
          r2 = nil
        else
          @index = i2
          r2 = instantiate_node(SyntaxNode,input, index...index)
        end
        s1 << r2
        if r2
          i4 = index
          if has_terminal?('%%>', false, index)
            r5 = instantiate_node(SyntaxNode,input, index...(index + 3))
            @index += 3
          else
            terminal_parse_failure('%%>')
            r5 = nil
          end
          if r5
            r4 = nil
          else
            @index = i4
            r4 = instantiate_node(SyntaxNode,input, index...index)
          end
          s1 << r4
          if r4
            i6 = index
            if has_terminal?('<%', false, index)
              r7 = instantiate_node(SyntaxNode,input, index...(index + 2))
              @index += 2
            else
              terminal_parse_failure('<%')
              r7 = nil
            end
            if r7
              r6 = nil
            else
              @index = i6
              r6 = instantiate_node(SyntaxNode,input, index...index)
            end
            s1 << r6
            if r6
              i8 = index
              if has_terminal?('%>', false, index)
                r9 = instantiate_node(SyntaxNode,input, index...(index + 2))
                @index += 2
              else
                terminal_parse_failure('%>')
                r9 = nil
              end
              if r9
                r8 = nil
              else
                @index = i8
                r8 = instantiate_node(SyntaxNode,input, index...index)
              end
              s1 << r8
              if r8
                if index < input_length
                  r10 = instantiate_node(SyntaxNode,input, index...(index + 1))
                  @index += 1
                else
                  terminal_parse_failure("any character")
                  r10 = nil
                end
                s1 << r10
              end
            end
          end
        end
        if s1.last
          r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
          r1.extend(UnescapedStaticContent0)
        else
          @index = i1
          r1 = nil
        end
        if r1
          s0 << r1
        else
          break
        end
      end
      if s0.empty?
        @index = i0
        r0 = nil
      else
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      end

      node_cache[:unescaped_static_content][start_index] = r0

      r0
    end

    module UnescapeScriptContent0
    end

    def _nt_unescape_script_content
      start_index = index
      if node_cache[:unescape_script_content].has_key?(index)
        cached = node_cache[:unescape_script_content][index]
        if cached
          cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
          @index = cached.interval.end
        end
        return cached
      end

      s0, i0 = [], index
      loop do
        i1, s1 = index, []
        i2 = index
        if has_terminal?('%>', false, index)
          r3 = instantiate_node(SyntaxNode,input, index...(index + 2))
          @index += 2
        else
          terminal_parse_failure('%>')
          r3 = nil
        end
        if r3
          r2 = nil
        else
          @index = i2
          r2 = instantiate_node(SyntaxNode,input, index...index)
        end
        s1 << r2
        if r2
          i4 = index
          if has_terminal?('%%>', false, index)
            r5 = instantiate_node(SyntaxNode,input, index...(index + 3))
            @index += 3
          else
            terminal_parse_failure('%%>')
            r5 = nil
          end
          if r5
            r4 = nil
          else
            @index = i4
            r4 = instantiate_node(SyntaxNode,input, index...index)
          end
          s1 << r4
          if r4
            i6 = index
            if has_terminal?('<%%', false, index)
              r7 = instantiate_node(SyntaxNode,input, index...(index + 3))
              @index += 3
            else
              terminal_parse_failure('<%%')
              r7 = nil
            end
            if r7
              r6 = nil
            else
              @index = i6
              r6 = instantiate_node(SyntaxNode,input, index...index)
            end
            s1 << r6
            if r6
              if index < input_length
                r8 = instantiate_node(SyntaxNode,input, index...(index + 1))
                @index += 1
              else
                terminal_parse_failure("any character")
                r8 = nil
              end
              s1 << r8
            end
          end
        end
        if s1.last
          r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
          r1.extend(UnescapeScriptContent0)
        else
          @index = i1
          r1 = nil
        end
        if r1
          s0 << r1
        else
          break
        end
      end
      if s0.empty?
        @index = i0
        r0 = nil
      else
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
      end

      node_cache[:unescape_script_content][start_index] = r0

      r0
    end

  end

  class GrammarParser < Treetop::Runtime::CompiledParser
    include Grammar
  end

end
