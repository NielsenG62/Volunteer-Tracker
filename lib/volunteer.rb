class Volunteer
  attr_reader :id
  attr_accessor :name

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id)
    @id = attributes.fetch(:id)
  end

  def name
    @name
  end

  def project_id
    @project_id
  end

  def ==(volunteer_to_compare)
    (self.name == volunteer_to_compare.name) && (self.project_id == volunteer_to_compare.project_id)
  end

  def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each do |volunteer|
      name = volunteer.fetch("name")
      project_id = volunteer.fetch("project_id").to_i
      id = volunteer.fetch("id")
      volunteers.push(Volunteer.new({:name => name, :project_id => project_id, :id => id}))
    end
    volunteers
  end

  def save
    result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{@name}', #{@project_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

end