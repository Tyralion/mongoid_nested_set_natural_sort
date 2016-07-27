module NestedSetNaturalSort

  module ClassMethods

    def rebuild!

      if acts_as_nested_set_options[:scope]

        scope = lambda { |node|
          node.nested_set_scope.options.merge(node.nested_set_scope.selector)
        }

      else
        scope = lambda { |node| }
      end

      try_rebuild(self.where(parent_id: nil), {}, scope)
      self

    end # self.rebuild!

    private

    def try_rebuild(items, indices, scope)

      ::Naturalsorter::Sorter.sort_by_method(items, sort_by_field, true).each do |node|

        indices[scope.call(node)] ||= 0

        left = (indices[scope.call(node)] += 1)

        try_rebuild(self.where(parent_id: node.id), indices, scope)

        right = (indices[scope.call(node)] += 1)

        q = node.class.collection.find(:_id => node.id)
        q.update_one({"$set" => { lft: left, rgt: right }}) if q

      end # each
      self

    end # try_rebuild

  end # ClassMethods

end # NestedSetNaturalSort
