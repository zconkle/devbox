CREATE USER 'remote'@'%' IDENTIFIED BY 'remote';
GRANT ALL ON *.* to 'remote'@'%' WITH GRANT OPTION;
CREATE USER 'remote'@'localhost' IDENTIFIED BY 'remote';
GRANT ALL ON *.* to 'remote'@'localhost' WITH GRANT OPTION;