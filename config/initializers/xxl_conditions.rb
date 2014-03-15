# -*- encoding : utf-8 -*-
module XxlConditions
  module Base

    def build_from_hash_with_expanded_attributes(engine, attributes, default_table, allow_table_name = true)
      standard_conditions = {}
      predicates = attributes.map do |column, value|
        if column.is_a?(ExpandedAttribute)
          table = default_table
          attribute = table[column.to_sym]
          case column.attr_operator
            when :gt then attribute.gt(value)
            when :lt then attribute.lt(value)
            when :gte then attribute.gteq(value)
            when :lte then attribute.lteq(value)
            when :eq then attribute.eq(value)
            when :not then (value.is_a?(Array) || value.is_a?(Range) ? attribute.not_in(value) : attribute.not_eq(value))
            when :like then attribute.matches(value.to_s)
          end
        else
          standard_conditions[column] = value
          nil
        end
      end
      predicates.compact!
      predicates += (build_from_hash_without_expanded_attributes(engine, standard_conditions, default_table)) if standard_conditions.present?
      predicates
    end
  end
  

  module ExpandedSymbol
    [ :eq, :lt, :gt, :gte, :lte, :not, :like ].each do |operator|
      define_method(operator) do
        ExpandedAttribute.new(self, operator)
      end
    end
  end

  class ExpandedAttribute
    attr_accessor :attr_name, :attr_operator
    def initialize(attr_name, attr_operator)
      @attr_name = attr_name
      @attr_operator = attr_operator
    end

    def to_s
      @attr_name.to_s
    end

    def to_sym
      @attr_name.to_sym
    end

    def <=>(other)
      [ self.attr_name, self.attr_operator] <=> [ other.attr_name, other.attr_operator ]
    end

    def ==(other)
      (self <=> other) == 0
    end

    def hash
      [ :ExpandedAttribute, @attr_name, @attr_operator ].hash
    end

    def eql?(other)
      self.hash == other.hash
    end

  end

end

Symbol.send(:include, XxlConditions::ExpandedSymbol)

ActiveRecord::PredicateBuilder.send(:extend, XxlConditions::Base)
class << ActiveRecord::PredicateBuilder
  alias_method_chain :build_from_hash, :expanded_attributes
end
