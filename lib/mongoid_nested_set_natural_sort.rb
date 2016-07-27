require 'naturalsorter'

require "mongoid_nested_set_natural_sort/version"
require "mongoid_nested_set_natural_sort/class_methods"
require "mongoid_nested_set_natural_sort/instance_methods"

module MongoidNestedSetNaturalSort

  module Base

    def nested_set_natural_sort(by_field: :name)

      class_attribute :sort_by_field, instance_writer: false
      self.sort_by_field = by_field.to_sym

      include ::NestedSetNaturalSort::InstanceMethods
      extend  ::NestedSetNaturalSort::ClassMethods

    end # nested_set_natural_sort

  end # Base

end # MongoidNestedSetNaturalSort

# Enable the nested_set_natural_sort method
Mongoid::Document::ClassMethods.send(:include, MongoidNestedSetNaturalSort::Base)
