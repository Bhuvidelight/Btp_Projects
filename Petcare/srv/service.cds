Using Petcare from '../db/Schema';

service Myservice {
    @odata.draft.enabled
    entity Owners  as projection on Petcare.Owner;
    entity Pets    as projection on Petcare.Pets;
    entity Appointments  as projection on Petcare.Appointments;
}