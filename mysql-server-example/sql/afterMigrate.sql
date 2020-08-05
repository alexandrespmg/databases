IF object_id('seed', 'U') is not null
    PRINT 'Already Seed, skipping'
ELSE
    BEGIN
        CREATE TABLE seed (
            id int IDENTITY(1,1) PRIMARY KEY
        );

        INSERT INTO Persons (FirstName,LastName) VALUES ('Lars','Monsen');
        INSERT INTO Persons (FirstName,LastName) VALUES ('Amelia-Grace','Hawes');
        INSERT INTO Persons (FirstName,LastName) VALUES ('Kaison','Ratliff');
        INSERT INTO Persons (FirstName,LastName) VALUES ('Maariya','Sanderson');
        INSERT INTO Persons (FirstName,LastName) VALUES ('Vernon','Monaghan');

        PRINT 'Seed done!'
    END