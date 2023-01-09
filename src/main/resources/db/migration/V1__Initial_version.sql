CREATE TABLE flyway.car (
first_name STRING,
  last_name STRING,
  has_tried_popsql BOOL,
  number_of_friends INT64 not null -- chance to specify not null constraints
);


INSERT INTO flyway.car (first_name,number_of_friends) VALUES ('Wissem',2);
