CREATE USER 'remote'@'%' IDENTIFIED BY 'remote';
GRANT ALL ON *.* to 'remote'@'%' WITH GRANT OPTION;