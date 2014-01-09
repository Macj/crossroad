class Data #< ActiveRecord::Base

  def self.get_content filters
    @@content_class = nil
    content = nil
    if filters['section_type']
      @@content_class = get_class filters
    end
    if @@content_class
      content = @@content_class.where('id IS NOT NULL')
      if !filters['category_id'].blank? 
        content = content.where(:category_id => filters['category_id'])
      end
      if !filters['type_id'].blank? 
        content = content.where(:type_id => filters['type_id'])
      end

      if !filters['start_at'].blank? 
        date = Date.parse(filters['start_at'])
        if @@content_class.has_column?('start_at')
          content = content.where(:start_at => date)
        else
          content = content.where("created_at >= ?", date)
        end
      end

      if !filters['end_at'].blank?
        date = Date.parse(filters['end_at'])
        if @@content_class.has_column?('end_at')
          content = content.where(:end_at => date)
        else
          content = content.where("created_at <= ?", date + 23.hours + 59.minutes)
        end
      end
    end
    content
  end

  def self.place_ids section, content, content_class
    place_ids = unless section[0] == 'place'
      content.map(&:place_id).compact if content_class.has_column?(:place_id)
    else
      content.map(&:id).compact
    end
  end

  def self.get_class filters
    eval(filters['section_type'].humanize)
  end
end