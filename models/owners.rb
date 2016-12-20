require_relative('../db/sql_runner')

class Owner
  
  attr_reader :name, :id
  
  def initialize(options)
    @id = nil || options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO owners (name) VALUES
('#{@name}') RETURNING *"
   owners_data = SqlRunner.run(sql)
   @id = owners_data[0]['id'].to_i
  end
  
  def self.all()
    sql = "SELECT * FROM owners"
    owners = SqlRunner.run(sql)
    return owners.map{ |owner| Owner.new(owner)}
  end  
  
  def self.find(id)
    sql = "SELECT * FROM owners WHERE id = #{id}"
    results = SqlRunner.run( sql )
    return Owner.new( results.first )
  end

  def self.update(options)
    sql = "UPDATE owners SET name ='#{options['name']}' WHERE id='#{options['id']}'"
    SqlRunner.run(sql)
  end
  
  def self.delete_all()
    sql = "DELETE * FROM owners"
    SqlRunner.run(sql)
  end 


  def self.destroy(id)
    sql = "DELETE FROM owners where id=#{id}"
    SqlRunner.run(sql) 
  end   
  
  def pets()
    sql ="SELECT pets.* FROM pets 
    INNER join adoptions
    ON adoptions.pet_id = pets.id
    WHERE adoptions.owner_id = #{@id}" 
    pets = SqlRunner.run(sql)
    return pets.map{|pet| Pet.new(pet)}
  end
end  
