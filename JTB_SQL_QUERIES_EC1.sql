CREATE TABLE flight
  (
     flight_id           INT PRIMARY KEY IDENTITY (1001, 1),
     departing_country   VARCHAR(50) NOT NULL,
     departing_city      VARCHAR(50) NOT NULL,
     destination_country VARCHAR(50) NOT NULL,
     destination_city    VARCHAR(50) NOT NULL,
     departure           DATETIME NOT NULL,
     arrival             DATETIME NOT NULL,
     duration            VARCHAR(15) NOT NULL,
     seats_available     INT
  );

INSERT INTO flight
VALUES     ('USA',
            'New York',
            'Jamaica',
            'Ochi',
            '2021-12-09 10:45',
            '2021-12-10 10:30',
            '5h 30m',
            '100');
            

SELECT *
FROM   flight

CREATE TABLE customer
  (
     customer_id INT PRIMARY KEY IDENTITY (2001, 1),
     firstname   VARCHAR(50) NOT NULL,
     lastname    VARCHAR(50) NOT NULL,
     phone       VARCHAR(50) NOT NULL,
     email       VARCHAR(50) NOT NULL,
  );

SELECT *
FROM   customer

CREATE TABLE ticket
  (
     ticket_no      INT PRIMARY KEY IDENTITY (4001, 1),
     customer_id    INT NOT NULL,
     flight_id      INT NOT NULL,
     number_of_seat INT,
     ticket_class   VARCHAR(50),
     price          MONEY,
     CONSTRAINT customer_ticket_fk FOREIGN KEY(customer_id) REFERENCES customer(
     customer_id),
     CONSTRAINT flight_ticket_fk FOREIGN KEY(flight_id) REFERENCES flight(
     flight_id),
  );


CREATE TABLE booking
  (
     booking_ref  INT PRIMARY KEY IDENTITY (3001, 1),
     flight_id    INT NOT NULL,
     customer_id  INT NOT NULL,
     ticket_no    INT NOT NULL,
     booking_date DATE NOT NULL,
     total_cost   MONEY NOT NULL,
     CONSTRAINT booking_flight_fk FOREIGN KEY(flight_id) REFERENCES flight(
     flight_id ),
     CONSTRAINT booking_customer_fk FOREIGN KEY(customer_id) REFERENCES customer
     (customer_id ),
     CONSTRAINT booking_ticket_fk FOREIGN KEY(ticket_no) REFERENCES ticket(
     ticket_no)
  );

------------------------------------------------------------------------------------
go

CREATE PROCEDURE Booking_receipt(@Flight_ID    INT,
                                 @Customer_ID  INT,
                                 @Ticket_num   INT,
                                 @Booking_date DATETIME

)
AS
    DECLARE @FlightAvailableSeats INT;
    DECLARE @NumSeats INT;
    DECLARE @price MONEY;
    DECLARE @Total_Cost MONEY;

  BEGIN
      SET @FlightAvailableSeats = (SELECT seats_available
                                   FROM   dbo.flight
                                   WHERE  flight_id = @Flight_ID)
      SET @NumSeats = (SELECT number_of_seat
                       FROM   dbo.ticket
                       WHERE  ticket_no = @Ticket_num)
      SET @price = (SELECT price
                    FROM   dbo.ticket
                    WHERE  ticket_no = @Ticket_num)
      SET @Total_Cost = @NumSeats * @price;

      IF @FlightAvailableSeats >= @NumSeats
        BEGIN
            UPDATE dbo.flight
            SET    seats_available = @FlightAvailableSeats - @NumSeats
            WHERE  flight_id = @Flight_ID

            INSERT INTO dbo.booking
                        (flight_id,
                         customer_id,
                         ticket_no,
                         booking_date,
                         total_cost)
            VALUES      (@Flight_ID,
                         @Customer_ID,
                         @Ticket_num,
                         @Booking_date,
                         @Total_Cost)
        END
      ELSE
        BEGIN
            PRINT 'NOT ENOUGH SEATS AVAILABLE';
        END
  END


go

EXEC Booking_receipt
  1001,
  2002,
  9072,
  '2021-11-30';

DROP TABLE ticket

SELECT *
FROM   ticket;

SELECT *
FROM   customer;

SELECT *
FROM   flight;

SELECT *
FROM   booking;


go

CREATE PROCEDURE Searchflight(@Departing_Country   VARCHAR(50),
                              @Departing_City      VARCHAR(50),
                              @Destination_Country VARCHAR(50),
                              @Destination_City    VARCHAR(50),
                              @Departure           DATETIME)
AS
  BEGIN
      SELECT *
      FROM   flight
      WHERE  @Departing_Country = departing_country
             AND @Departing_City = departing_city
             AND @Destination_Country = destination_country
             AND @Destination_City = destination_city
             AND @Departure = departure
  END

SELECT *
FROM   flight


go

CREATE FUNCTION Ticket_price(@Ticket_Class VARCHAR(50))
returns MONEY
AS
  BEGIN
      DECLARE @cost INT;

      SET @cost = 0;

      IF( @Ticket_Class = 'Business')
        SET @cost = 10000
      ELSE IF ( @Ticket_Class = 'First Ticket_Class')
        SET @cost = 20000
      ELSE IF ( @Ticket_Class = 'Economy')
        SET @cost = 15000

      RETURN @cost
  END

go


DROP PROC flightbooking

go

CREATE PROCEDURE Flightbooking(@FirstName      VARCHAR(50),
                               @LastName       VARCHAR(50),
                               @Phone          VARCHAR(50),
                               @Email          VARCHAR(50),
                               @Number_of_Seat INT,
                               @Ticket_Class   VARCHAR(50),
                               @Flight_ID      INT)
AS
    DECLARE @Customer_ID INT;
    DECLARE @price INT;

  BEGIN
      INSERT INTO customer
      VALUES     (@FirstName,
                  @LastName,
                  @Phone,
                  @Email)

      SET @Customer_ID = Scope_identity();
      SET @Price = dbo.Ticket_price(@Ticket_Class);

      INSERT INTO ticket
      VALUES      (@Customer_ID,
                   @Flight_ID,
                   @Number_of_Seat,
                   @Ticket_Class,
                   @Price)

      CREATE TABLE #tempcustid
        (
           customer_id INT
        );

      INSERT INTO #tempcustid
      VALUES     (@Customer_ID)

      SELECT customer_id
      FROM   #tempcustid
  END
  GO

    EXEC Flightbooking
      'Ron',
      'Stoppable',
      '555-555-5555',
      'savestheday@gmail.com',
      1,
      'Business',
      1001


go

CREATE PROCEDURE View_receipt (@Booking_Ref INT)
AS
  BEGIN
      SELECT c.firstname,
             c.lastname,
             b.booking_ref,
             b. flight_id,
             b.customer_id,
             b.booking_date,
             b.total_cost,
             f.departing_country,
             f.departing_city,
             f.destination_country,
             f.destination_city,
             f.duration,
             f.arrival,
             f.departure,
             t.ticket_class,
             t.number_of_seat,
             t.ticket_no
      FROM   customer c
             INNER JOIN booking b
                     ON c.customer_id = b.customer_id
             INNER JOIN flight f
                     ON f.flight_id = b.flight_id
             INNER JOIN ticket t
                     ON t.ticket_no = b.ticket_no
      WHERE  b.booking_ref = @Booking_Ref
  END

EXEC View_receipt
  8002

DROP PROC view_receipt

go

CREATE PROCEDURE Updatebooking (@Customer_ID    INT,
                                @FirstName      VARCHAR(50),
                                @LastName       VARCHAR(50),
                                @Phone          VARCHAR(50),
                                @Email          VARCHAR(50),
                                @Number_of_Seat INT,
                                @Ticket_Class   VARCHAR(50))
AS
    DECLARE @Price MONEY;

  BEGIN
      UPDATE dbo.customer
      SET    firstname = @FirstName,
             lastname = @LastName,
             phone = @Phone,
             email = @Email
      WHERE  customer_id = @Customer_ID;

      UPDATE dbo.ticket
      SET    number_of_seat = @Number_of_Seat,
             ticket_class = @Ticket_Class
      WHERE  customer_id = @Customer_ID;

      SET @Price = dbo.Ticket_price(@Ticket_Class);

      UPDATE dbo.ticket
      SET    price = @Price
      WHERE  customer_id = @Customer_ID;
  END

    EXEC Updatebooking
      2005,
      'Jefff',
      'Hello',
      '11111',
      'bigbird21@gmail.com',
      2,
      'Economy'

    SELECT *
    FROM   ticket

    SELECT *
    FROM   customer

    SELECT *
    FROM   flight

    SELECT *
    FROM   booking

    
    CREATE TABLE cruise
      (
         cruise_id           INT PRIMARY KEY IDENTITY (1001, 1),
         departing_country   VARCHAR(50) NOT NULL,
         departing_city      VARCHAR(50) NOT NULL,
         destination_country VARCHAR(50) NOT NULL,
         destination_city    VARCHAR(50) NOT NULL,
         check_in_date       DATETIME NOT NULL,
         check_out_date      DATETIME NOT NULL,
         rooms_available     INT
      );

    INSERT INTO cruise
    VALUES      ('USA',
                 'Albany',
                 'Florida',
                 'Orlando',
                 '2021-10-09 10:55',
                 '2021-10-10 10:30',
                 '50'),
                ('Florida',
                 'Orlando',
                 'Jamaica',
                 'Kingston',
                 '2021-07-23 01:00',
                 '2021-07-24 10:30',
                 '50');

    SELECT *
    FROM   cruise

go

CREATE PROCEDURE Cruisesearch(@Departing_Country   VARCHAR(50),
                              @Departing_City      VARCHAR(50),
                              @Destination_Country VARCHAR(50),
                              @Destination_City    VARCHAR(50),
                              @Check_In_Date       DATETIME,
                              @Check_Out_Date      DATETIME)
AS
  BEGIN
      SELECT *
      FROM   cruise
      WHERE  @Departing_Country = departing_country
             AND @Departing_City = departing_city
             AND @Destination_Country = destination_country
             AND @Destination_City = destination_city
             AND @Check_In_Date = check_in_date
             AND @Check_Out_Date = check_out_date
  END

CREATE TABLE boardingpass
  (
     ticket_no    INT PRIMARY KEY IDENTITY (4001, 1),
     customer_id  INT NOT NULL,
     cruise_id    INT NOT NULL,
     num_of_rooms INT,
     room_types   VARCHAR(50),
     price        MONEY,
     CONSTRAINT boardingpass_fk FOREIGN KEY(customer_id) REFERENCES customer(
     customer_id ),
     CONSTRAINT tboardingpass_fk FOREIGN KEY(cruise_id) REFERENCES cruise(
     cruise_id ),
  );

go

DROP TABLE boardingpass

CREATE PROCEDURE Cruisebooking(@FirstName    VARCHAR(50),
                               @LastName     VARCHAR(50),
                               @Phone        VARCHAR(50),
                               @Email        VARCHAR(50),
                               @Num_of_Rooms INT,
                               @Room         VARCHAR(50),
                               @Cruise_ID    INT)
AS
    DECLARE @Customer_ID INT;
    DECLARE @price INT;

  BEGIN
      INSERT INTO customer
      VALUES     (@FirstName,
                  @LastName,
                  @Phone,
                  @Email)

      SET @Customer_ID = Scope_identity();
      SET @Price = dbo.Boarding_price(@Room);

      INSERT INTO boardingpass
      VALUES      (@Customer_ID,
                   @Cruise_ID,
                   @Num_of_Rooms,
                   @Room,
                   @Price)
  END

go

CREATE FUNCTION Boarding_price(@Room VARCHAR(50))
returns MONEY
AS
  BEGIN
      DECLARE @cost INT;

      SET @cost = 0;

      IF( @Room = 'Standard' )
        SET @cost = 5000
      ELSE IF ( @Room = 'Deluxe' )
        SET @cost = 10000
      ELSE IF ( @Room = 'Villa' )
        SET @cost = 15000
      ELSE IF ( @Room = 'Cabana' )
        SET @cost = 20000

      RETURN @cost
  END

go     

