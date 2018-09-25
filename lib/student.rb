class Student
  attr_accessor :name, :grade
  attr_reader :id

  def initialize (name, grade, id = nil)
    @name = name
    @grade = grade
    @id = id
  end

  def self.create_table
    sql_create_table = "CREATE TABLE students (
      id INTEGER PRIMARY KEY,
      name TEXT,
      grade TEXT
    );"

    DB[:conn].execute(sql_create_table)
  end

  def self.drop_table
    sql_drop_table = "DROP TABLE students;"
    DB[:conn].execute(sql_drop_table)
  end

  def save
    sql_save = "INSERT INTO students (name, grade) VALUES (?, ?);"
    DB[:conn].execute(sql_save, self.name, self.grade)
    sql_get_id = "SELECT last_insert_rowid();"
    @id = DB[:conn].execute(sql_get_id)
    self
  end
end
