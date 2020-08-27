class Pokemon
  
  attr_accessor :id, :name, :type, :db 
  
  def initialize(id: nil, name:, type:, db: nil)
    @id = id 
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    sql =
    "Insert Into pokemon(name, type) Values (?, ?)"
    
    db.execute(sql, name, type)
    @id = db.execute("Select last_insert_rowid() From pokemon")[0][0]
  end
  
  def self.find(id, db)
   sql = <<-SQL
    SELECT * FROM pokemon
    WHERE id = ?
    LIMIT 1
    SQL
    
    db.execute(sql, id).collect do |row|
      Pokemon.new(id: row[0], name: row[1], type: row[2])
    end.first
  end
  
end
