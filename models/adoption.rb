require_relative('../db/sql_runner')



class Adoption

  attr_reader( :pet_id, :owner_id, :id )

  def initialize( options )
    @id = nil || options['id'].to_i
    @pet_id = options['pet_id']
    @owner_id = options['owner_id']
  end

  def save()
    sql = "INSERT INTO adoption (
      pet_id, owner_id
    ) VALUES (
      '#{ @pet_id }',#{ @owner_id }
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM adoption"
    results = SqlRunner.run( sql )
    return results.map { |hash| Adoption.new( hash ) }
  end

  def pet
    sql = "SELECT * FROM pets 
          INNER JOIN adoption 
          ON adoption.pet_id = pets.id
          WHERE pets.id = #{@pet_id}"
    results = SqlRunner.run( sql )
    return Pet.new( results.first )
  end

  def owner
    sql = "SELECT * FROM owners 
          INNER JOIN adoption
          ON adoption.owner_id = owners.id
          WHERE owners.id = #{@owner_id}"
    results = SqlRunner.run( sql )
    return Owner.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM adoption"
    SqlRunner.run( sql )
  end

  def self.destroy(id)
    sql = "DELETE FROM adoption where id = #{id}"
    SqlRunner.run( sql )
  end

end