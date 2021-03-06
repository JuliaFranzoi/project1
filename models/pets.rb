require_relative('../db/sql_runner') 

class Pet

  attr_reader(:name, :breed, :date, :adoptable, :id)

  def initialize(options)
    @id = nil || options['id'].to_i
    @name = options['name']
    @breed = options['breed']
    @date = options['date'].to_s
    @adoptable = options['adoptable']

  end
  
  def save()
    sql = "INSERT INTO pets(name, breed, date, adoptable) VALUES ('#{@name}','#{@breed}', '#{@date}', '#{@adoptable}') RETURNING *"
    results = SqlRunner.run(sql)
    @id = results[0]['id'].to_i
  end  
  
  def self.all()
    sql = "SELECT * FROM pets"
    results = SqlRunner.run(sql)
    return results.map { |pet| Pet.new( pet )}
  end

  def self.find(id)
    sql = "SELECT * FROM pets WHERE id = #{id}"
    results = SqlRunner.run( sql )
    return Pet.new( results.first )
  end

  def self.update(options)
    sql = "UPDATE pets SET name='#{options['name']}', breed='#{options['breed']}', date='#{options['date']}', adoptable='#{options['adoptable']}' WHERE id='#{options['id']}'"
    SqlRunner.run(sql)
  end
  
  def self.delete_all()
    sql = "DELETE * FROM pets"
    SqlRunner.run(sql)
  end 


  def self.destroy(id)
    sql = "DELETE FROM pets where id = #{id}"
    SqlRunner.run(sql) 
  end   
  
  def owner()
    sql = "SELECT *FROM owners WHERE id = #{@owners}"
    owner = SqlRunner.run(sql)[0]
    return Owner.new(owner)
  end
 
   
  def self.is_available(id)
   sql = "SELECT * FROM pets WHERE id = #{id}"
   pet = SqlRunner.run(sql).first
   pet_available = (pet["adoptable"] == "yes")
   return screening(pet_available)
  end 


  # def is_available(id)
  #   available = []
  #   n_available = []
  #    sql = "SELECT pets.adoptable FROM pets WHERE id = #{id}"
  #    pet_adoptable = SqlRunner.run(sql)[0]
  #    if pet_adoptable['adoptable'] == "yes"
  #     available.push(Pet.new(pet_adoptable))
  #    else
  #     n_available.push(Pet.new(pet_adoptable))
  #    end

  def is_adoptable?
    return adoptable == 'yes'
  end

  def adopt(pet_id)
    if pet.id.is_available == "yes"
      return 
    end

  end


end