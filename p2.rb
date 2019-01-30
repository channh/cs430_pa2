#
# CS 430 Spring 2019 P2 (Ruby 2)
#
# Name: Nathan Chan
# Verision: 1/16/2019
#

require_relative 'defs.rb'

class Expr
    # Calculate the result of the mathematical expression.
    # Returns an integer.
    def eval()
        0
    end

    # Count the number of total number of arithmetic operations.
    # Returns an integer.
    def count_ops()
        0
    end

    # The height of the tree.
    # Returns an integer.
    def height()
        0
    end

    # Takes a expression and flattened it into a postfix string
    # representation.
    # Returns a string.
    def postfix()
        ""
    end

    # Extract a sorted list of all unique integers in an expression. 
    # Each integer should appear in the resulting list only once.
    # Returns an array.
    def uniq_ints()
        []
    end

    def nodes
        1 + @children.map{|c| c.nodes}.sum
    end
end

class EInt
    def eval
        @val
    end

    def count_ops
        0
    end

    def height
        1
    end

    def postfix
        @val
    end

    def uniq_ints
        @val
    end
end

class EBinOp
    def eval
        1
    end

    def count_ops
        1 + left.count_ops + right.count_ops
    end

    def height
        if left.height >= right.height
            1 + left.height
        elsif right.height >= left.height
            1 + right.height 
        end
    end 

    def postfix
        left.postfix.to_s + " " + right.postfix.to_s + " " + @op
    end

    def uniq_ints
        [left.uniq_ints, right.uniq_ints].flatten.uniq
    end 
end

#
# Operator-specific expression nodes
#
class EAdd < EBinOp
    def eval
        left.eval + right.eval
    end
end

class ESub < EBinOp
    def eval
        left.eval - right.eval
    end
end

class EMul < EBinOp
    def eval
        left.eval * right.eval
    end
end

