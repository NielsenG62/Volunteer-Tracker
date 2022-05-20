class Project
  attr_reader :id
  attr_accessor :name

  def initialize(attributes)
    @title = attributes.fetch(:title)
    @id = attributes.fetch(:id)
  end

  def title
    @title
  end

  def id
    @id
  end

end
