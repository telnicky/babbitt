module Hierarchical
  def self.included(klass)
    klass.class_eval do
      klass.extend ::Hierarchical::ClassMethods
    end
  end

  HIERARCHY = [ :month, :day, :hour, :minute ].freeze

  module ClassMethods
    def records_to_hierarchy(attr, records)
      grouped_records = _build_grouping(records, :month)

      grouped_records.each do |month, days|
        grouped_records[month] = _build_grouping(days, :day)

        grouped_records[month].each do |day, hours|
          grouped_records[month][day] = _build_grouping(hours, :hour)

          grouped_records[month][day].each do |hour, minutes|
            grouped_records[month][day][hour] = _build_grouping(minutes, :min)
          end
        end
      end

      data = _format_grouping(attr, Hierarchical::HIERARCHY.dup, grouped_records)
      { :name => self.ancestors.first.to_s.pluralize, :children => data }
    end

    def _build_grouping(records, by_sym)
      records.group_by { |s| s.start_time.send(by_sym) }
    end

    def _format_grouping(attr, categories, grouped_records)
      current_category = categories.first
      grouped_records.collect do |k, v|
        if v.is_a? ::Hash
          { :name => __send__("_format_#{ current_category }", k) ,
            :children => _format_grouping(attr, categories[1..-1], v) }
        else
          { :name => k, :size => v.sum(&attr.to_sym) }
        end
      end
    end

    def _format_month(m)
      DateTime.new(2000, m).strftime("%B")
    end

    def _format_day(d)
      d
    end

    def _format_hour(h)
      DateTime.new(2000, 1, 1, h).strftime("%I:00 %p")
    end

    def _format_min(m)
      m
    end
  end
end

