module DateStructure
  def date
    self.created_at.strftime(" %H:%M %d.%m.%Y")
  end
end