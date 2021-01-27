--1
CREATE TABLE Spartans 
(
    spartan_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(10) NOT NULL,
    second_name VARCHAR(20) NOT NULL,
    university_attended VARCHAR(30) NOT NULL DEFAULT 'Some Uni',
    course_taken VARCHAR(30) NOT NULL DEFAULT 'Comp Sci',
    mark_achieved INT NOT NULL DEFAULT 60
)

--2
INSERT INTO Spartans (first_name, second_name) VALUES
('Bradley','Williams'),
('Kurtis','Hanson'),
('Aaron','Banjoko'),
('Dominic','Cogan-Tucker'),
('Wahdel','Woodhouse'),
('Malik','Shams'),
('Joel','Fright')

SELECT * FROM Spartans
