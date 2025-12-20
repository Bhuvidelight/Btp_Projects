namespace Petcare;

entity Owner {
  key ownerID :Int16;
  name        : String;
  phone       : String;
  address     : String;
  pets        : Composition of many Pets on pets.owner = $self;
}

entity Pets {
  key petID  : Int16;
  name       : String;
  type       : String;
  age        : Integer;
  owner      : Association to Owner;
  appts      : Composition of many Appointments on appts.pet = $self;
}

entity Appointments {
  key apptID : Int16;
  date       : String;
  reason     : String;
  pet        : Association to Pets;
}