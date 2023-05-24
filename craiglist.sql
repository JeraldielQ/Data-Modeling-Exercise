DROP DATABASE IF EXISTS craigslist;
CREATE DATABASE craigslist;
\c craigslist

CREATE TABLE Region (
  region_id INT PRIMARY KEY,
  region_name VARCHAR(255)
);

CREATE TABLE User (
  user_id INT PRIMARY KEY,
  username VARCHAR(255),
  preferred_region_id INT,
  FOREIGN KEY (preferred_region_id) REFERENCES Region(region_id)
);

CREATE TABLE Post (
  post_id INT PRIMARY KEY,
  title VARCHAR(255),
  text TEXT,
  user_id INT,
  location VARCHAR(255),
  region_id INT,
  FOREIGN KEY (user_id) REFERENCES User(user_id),
  FOREIGN KEY (region_id) REFERENCES Region(region_id)
);

CREATE TABLE Category (
  category_id INT PRIMARY KEY,
  category_name VARCHAR(255)
);

CREATE TABLE Post_Category_Relationship (
  relationship_id INT PRIMARY KEY,
  post_id INT,
  category_id INT,
  FOREIGN KEY (post_id) REFERENCES Post(post_id),
  FOREIGN KEY (category_id) REFERENCES Category(category_id)
);
