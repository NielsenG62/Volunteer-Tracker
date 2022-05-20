class Project
  attr_reader :id
  attr_accessor :title

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

  def save
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = result.first.fetch("id").to_i
  end

  def ==(project_to_compare)
    self.title == project_to_compare.title
  end

  def self.all
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each do |project|
      title = project.fetch("title")
      id = project.fetch("id").to_i
      projects.push(Project.new({:title => title, :id => id}))
    end
    projects
  end

  def self.find(id)
    project = DB.exec("SELECT * FROM projects WHERE id = #{id};").first
    title = project.fetch("title")
    id = project.fetch("id")
    Project.new ({:title => title, :id => id})
  end

  def update(attributes)
    @title = attributes.fetch(:title)
    DB.exec("UPDATE projects SET title = '#{@title}' WHERE id = #{@id}")
  end

  def delete
    DB.exec("DELETE FROM projects WHERE id = #{id}")
  end

  def volunteers
    volunteers = []
    returned_volunteers = DB.exec("SELECT * FROM volunteers WHERE project_id = #{self.id};")
    returned_volunteers.each() do |volunteer|
      name = volunteer.fetch("name")
      id = volunteer.fetch("id").to_i
      volunteers.push(Volunteer.new({:name => name, :project_id => self.id, :id => id}))
    end
    volunteers
  end

end
