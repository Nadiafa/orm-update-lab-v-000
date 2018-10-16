require_relative "../config/environment.rb"

class Student
  attr_accessor :id, :name, :grade
  
  def initialize(id=nil, name, grade)
    @id    = id
    @name  = name
    @grade = grade
  end 

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY,
        name TEXT,
        grade TEXT
        )
    SQL
    DB[:conn].execute(sql)
  end 
   
   
      
  def self.drop_table
    sql = "DROP TABLE IF EXISTS students"
    DB[:conn].execute(sql)
  end 
    
    
  def save
    # saves an instance of the Student class to the database and then sets the given students `id` attribute
    # updates a record if called on an object that is already persiste
    if self.id 
      self.update 
    else 
      sql = <<-SQL
        INSERT INTO students (name, grade)
          VALUES (?, ?)
      SQL
      DB[:conn].execute(sql, self.name, self.grade)
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
  end
    
    
    # .create
      # creates a student object with name and grade attributes
    
    
    # .new_from_db
      # creates an instance with corresponding attribute values
    
    
    # .find_by_name
      # returns an instance of student that matches the name from the DB
    
    
    # update
      # updates the record associated with a given instance 
end
