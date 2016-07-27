module NestedSetNaturalSort

  module InstanceMethods

    protected

    def move_to_new_parent

      if @move_to_new_parent_id.nil?
        move_to_root
      elsif @move_to_new_parent_id

        arr = ::Naturalsorter::Sorter.sort_by_method(
          self.parent.children,
          sort_by_field,
          true
        )

        ind = arr.index { |el| el[sort_by_field] == self[sort_by_field] }

        if ind.nil? || arr.length <= 1
          move_to_child_of(@move_to_new_parent_id)
        elsif ind != 0 && (target = arr[ind-1])
          move_to_right_of(target)  if target.id != self.id
        elsif (target = arr[ind+1])
          move_to_left_of(target)   if target.id != self.id
        end

      end # if
      self

    end # move_to_new_parent

    private

    def sort_by_field
      self.class.sort_by_field || :name
    end # sort_by_field

  end # InstanceMethods

end # NestedSetNaturalSort
