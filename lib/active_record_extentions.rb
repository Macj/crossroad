require 'active_record/base'

module ColumnFinder
  def has_column?(column)
    self.column_names.include?(column)
  end
end

# Extend ActiveRecord's functionality
ActiveRecord::Base.send :extend, ColumnFinder