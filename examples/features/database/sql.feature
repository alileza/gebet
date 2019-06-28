Feature: database features example

  Scenario: Set and compare table using PostgreSQL database driver
    Given "tomato-psql" table "customers" should look like
        | customer_id | name    |
    Given set "tomato-psql" table "customers" list of content
        | name    | country |
        | cembri  | us      |
    Then "tomato-psql" table "customers" should look like
        | customer_id | country | name   |
        | 1           | us      | cembri |
    Given set "tomato-psql" table "customers" list of content
        | name    | country |
        | cembre  | id      |
    Then "tomato-psql" table "customers" should look like
        | customer_id | country | name   |
        | 1           | us      | cembri |
        | 2           | id      | cembre |

  Scenario: Table should always empty on each starting scenario
    Given "tomato-psql" table "customers" should look like
      | customer_id | name    |
    Then "tomato-mysql" table "customers" should look like
      | customer_id | name    |

  Scenario: Set and compare table using MySQL database driver, and test empty functionality
    Given "tomato-mysql" table "customers" should look like
      | customer_id | name    |
    Given set "tomato-mysql" table "customers" list of content
      | name    | country |
      | cembri  | us      |
    Then "tomato-mysql" table "customers" should look like
      | customer_id | country | name   |
      | 1           | us      | cembri |
    Given set "tomato-mysql" table "customers" list of content
      | name    | country |
      | cembre  | id      |
    Then "tomato-mysql" table "customers" should look like
      | customer_id | country | name   |
      | 1           | us      | cembri |
      | 2           | id      | cembre |
      
      
  Scenario: Test to assure no trace between each scenario
    Given set "tomato-mysql" table "customers" list of content
      | customer_id | country | name   |
      | 1           | us      | cembri |
    Given "tomato-mysql" table "customers" should look like
      | customer_id | country | name   |
      | 1           | us      | cembri |

  Scenario: Test to assure no trace between each scenario
    Given set "tomato-mysql" table "customers" list of content
      | customer_id | country | name   |
      | 1           | us      | cembri |
      | 2           | id      | cembre |
    Given "tomato-mysql" table "customers" should look like
      | customer_id | country | name   |
      | 1           | us      | cembri |
      | 2           | id      | cembre |
