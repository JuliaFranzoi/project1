DROP TABLE adoption;
DROP TABLE pets;
DROP TABLE owners;


CREATE TABLE pets
(
  id SERIAL4 primary key,
  name VARCHAR(255) not null,
  breed VARCHAR(255),
  date VARCHAR(255),
  adoptable VARCHAR(255)
);

CREATE TABLE owners
(
  id SERIAL4 primary key,
  name VARCHAR(255)
);

CREATE TABLE adoption
(
  id SERIAL4 primary key,
  pet_id iNT4 references pets(id),
  owner_id iNT4 references owners(id)
);
 