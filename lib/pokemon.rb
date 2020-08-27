class Pokemon
  
  attr_accessor :id, :name, :type, :db 
  
  def initialize(id:, name:, type:, db:)
    @id = id 
    @name = name
    @type = type
    @db = db
  end
  
  def save
    sql = " 
    Insert Into pokemon(name, type) Values (?, ?)
    "
    db.execute(sql, name, type)
    @id = db.execute("Select last_insert_rowid() From pokemon")[0][0]
  end
  
end
