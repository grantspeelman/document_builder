class ElementType
  def self.all
    [HTMLElement].map(&:to_s).map(&:underscore)
  end
end