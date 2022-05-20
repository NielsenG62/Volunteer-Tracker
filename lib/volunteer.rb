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
    if volunteer_to_compare != nil
      (self.name == volunteer_to_compare.name) && (self.project_id == volunteer_to_compare.project_id)
    else
      false
    end
  end

  def self.all
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each do |volunteer|
      name = volunteer.fetch("name")
      project_id = volunteer.fetch("projcect_id")
      id = volunteer.fetch("id")
      volunteers.push(Volunteer.new({:name => name, :project_id => project_id, :id => id}))
    end
    volunteers
  end

end