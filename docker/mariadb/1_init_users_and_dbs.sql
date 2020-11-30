CREATE DATABASE IF NOT EXISTS `friendup` DEFAULT CHARACTER SET utf8mb4;
CREATE DATABASE IF NOT EXISTS `presence` charset=utf8mb4;
CREATE DATABASE IF NOT EXISTS `friendchat` charset=utf8mb4;

CREATE USER IF NOT EXISTS 'friendup'@'%' IDENTIFIED BY 'friendup1';
GRANT ALL privileges ON `friendup`.* TO 'friendup'@'%';

CREATE USER IF NOT EXISTS 'presence'@'%' IDENTIFIED BY 'presence';
GRANT ALL ON `presence`.* TO 'presence'@'%';

CREATE USER IF NOT EXISTS 'friendchat'@'%' IDENTIFIED BY 'friendchat';
GRANT ALL ON `friendchat`.* TO 'friendchat'@'%';

FLUSH PRIVILEGES;
