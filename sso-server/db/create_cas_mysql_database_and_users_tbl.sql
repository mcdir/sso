-- Dumping database structure for test
CREATE DATABASE IF NOT EXISTS `cas-mysql-database` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cas-mysql-database`;

-- Dumping structure for table test.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `password` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `email`, `password`) VALUES
	(1, 'test@test.com', 'test');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;