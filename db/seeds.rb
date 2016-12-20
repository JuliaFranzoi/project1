require_relative('../models/pets.rb')
require_relative('../models/owners.rb')
require_relative('../models/adoption.rb')
require('pry')




pet1 = Pet.new({'name' => 'Tambor', 'breed' => 'koala', 'date' => '11/11/16', 'adoptable' => 'yes'})
pet1.save()

pet2 = Pet.new({'name' => 'Samba', 'breed' => 'cat', 'date' => '12/10/16', 'adoptable'=>'no'})
pet2.save()


owner1 = Owner.new({'name' =>'Julia'})
owner1.save()

owner2 = Owner.new({'name' =>'Nikos'})
owner2.save()


adoption1 = Adoption.new({'pet_id' =>pet1.id, 'owner_id' => owner1.id})
adoption1.save()

binding.pry
nil