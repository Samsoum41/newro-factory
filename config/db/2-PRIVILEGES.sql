  #-----------------------------------
  #USER RIGHTS MANAGEMENT
  #-----------------------------------
  CREATE USER 'adminnewro'@'localhost' IDENTIFIED BY 'qwerty1234';

  GRANT ALL PRIVILEGES ON `newro-factory-db`.* TO 'adminnewro'@'localhost' WITH GRANT OPTION;


  FLUSH PRIVILEGES;
