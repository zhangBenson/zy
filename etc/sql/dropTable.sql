DROP TABLE `gogowise`.`allocation`;
DROP TABLE `gogowise`.`comments`;
DROP TABLE `gogowise`.`competitioncomments`;
DROP TABLE `gogowise`.`inviterelationship`;
DROP TABLE `gogowise`.`singupinfo`;
DROP TABLE `gogowise`.`singuprole`;
DROP TABLE `gogowise`.`tb_group`;
DROP TABLE `gogowise`.`userrelationship`;
DROP TABLE `gogowise`.`usersession`;
DROP TABLE `gogowise`.`competitionsession`;
DROP TABLE `gogowise`.`competitionphase`;
DROP TABLE `gogowise`.`competition`;
DROP TABLE `gogowise`.`subject`;
DROP TABLE `gogowise`.`membership`;




GRANT ALL PRIVILEGES ON *.* TO root@localhost IDENTIFIED BY "pppp";


GRANT ALL PRIVILEGES ON *.* TO 'myuser'@'ttttt'   IDENTIFIED BY 'ppppppp.'  WITH GRANT OPTION;
flush privileges;