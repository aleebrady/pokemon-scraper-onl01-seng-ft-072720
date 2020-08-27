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
   sql = 
   "Select * From pokemon Where id = ? Limit 1"
   
   db.execute(sql, id).map do |row|
     self.new(id: row[0], name: row[1], type: row[2])
   end.first
  end
  
end
