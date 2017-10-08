-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2017 at 10:01 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `autismdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `career_type`
--

CREATE TABLE `career_type` (
  `career_id` int(11) NOT NULL,
  `career_title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `career_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `child`
--

CREATE TABLE `child` (
  `c_id` int(11) NOT NULL,
  `u_id` int(11) DEFAULT NULL,
  `fullName` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `date_of_birth` datetime DEFAULT NULL,
  `father_name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `mother_name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) DEFAULT NULL,
  `extra_info_id` int(11) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `child_child`
--

CREATE TABLE `child_child` (
  `c_id1` int(11) DEFAULT NULL,
  `similarity` float DEFAULT NULL,
  `c_id2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `child_solution`
--

CREATE TABLE `child_solution` (
  `c_id` int(11) DEFAULT NULL,
  `s_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `examination`
--

CREATE TABLE `examination` (
  `ex_id` int(11) NOT NULL,
  `c_id` int(11) DEFAULT NULL,
  `test_rule_id` int(11) DEFAULT NULL,
  `exam_result` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `extra_info`
--

CREATE TABLE `extra_info` (
  `c_id` int(11) DEFAULT NULL,
  `fater_career_id` int(11) DEFAULT NULL,
  `divorce_status` tinyint(1) DEFAULT NULL,
  `mother_career_id` int(11) DEFAULT NULL,
  `monthly_income` int(11) DEFAULT NULL,
  `height` float DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `group` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `income_type`
--

CREATE TABLE `income_type` (
  `income_id` int(11) NOT NULL,
  `range` text CHARACTER SET utf8 COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `solution`
--

CREATE TABLE `solution` (
  `s_id` int(11) NOT NULL,
  `u_id` int(11) DEFAULT NULL,
  `s_title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `s_content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `s_picture` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `date_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `test_id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `ex_id` int(11) DEFAULT NULL,
  `result_test` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `test_rule`
--

CREATE TABLE `test_rule` (
  `test_rule_id` int(11) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `test_rule_detail`
--

CREATE TABLE `test_rule_detail` (
  `detail_id` int(11) NOT NULL,
  `test_rule_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `test_type`
--

CREATE TABLE `test_type` (
  `type_id` int(11) NOT NULL,
  `type_name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `question_src` text CHARACTER SET utf8 COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `tk_id` int(11) NOT NULL,
  `u_id` int(11) DEFAULT NULL,
  `token` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `u_id` int(11) NOT NULL,
  `userName` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `fullName` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `phone` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `email` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `age` datetime DEFAULT NULL,
  `date_created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `career_type`
--
ALTER TABLE `career_type`
  ADD PRIMARY KEY (`career_id`);

--
-- Indexes for table `child`
--
ALTER TABLE `child`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `child_fk0` (`u_id`);

--
-- Indexes for table `child_child`
--
ALTER TABLE `child_child`
  ADD KEY `child_child_fk0` (`c_id1`),
  ADD KEY `child_child_fk1` (`c_id2`);

--
-- Indexes for table `child_solution`
--
ALTER TABLE `child_solution`
  ADD KEY `child_solution_fk0` (`c_id`),
  ADD KEY `child_solution_fk1` (`s_id`);

--
-- Indexes for table `examination`
--
ALTER TABLE `examination`
  ADD PRIMARY KEY (`ex_id`),
  ADD KEY `examination_fk0` (`c_id`),
  ADD KEY `examination_fk1` (`test_rule_id`);

--
-- Indexes for table `extra_info`
--
ALTER TABLE `extra_info`
  ADD KEY `extra_info_fk0` (`c_id`),
  ADD KEY `extra_info_fk1` (`fater_career_id`),
  ADD KEY `extra_info_fk2` (`mother_career_id`),
  ADD KEY `extra_info_fk3` (`monthly_income`);

--
-- Indexes for table `income_type`
--
ALTER TABLE `income_type`
  ADD PRIMARY KEY (`income_id`);

--
-- Indexes for table `solution`
--
ALTER TABLE `solution`
  ADD PRIMARY KEY (`s_id`),
  ADD KEY `solution_fk0` (`u_id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`test_id`),
  ADD KEY `test_fk0` (`type_id`);

--
-- Indexes for table `test_rule`
--
ALTER TABLE `test_rule`
  ADD PRIMARY KEY (`test_rule_id`);

--
-- Indexes for table `test_rule_detail`
--
ALTER TABLE `test_rule_detail`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `test_rule_detail_fk0` (`test_rule_id`),
  ADD KEY `test_rule_detail_fk1` (`type_id`);

--
-- Indexes for table `test_type`
--
ALTER TABLE `test_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`tk_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`u_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `career_type`
--
ALTER TABLE `career_type`
  MODIFY `career_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `child`
--
ALTER TABLE `child`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `examination`
--
ALTER TABLE `examination`
  MODIFY `ex_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `income_type`
--
ALTER TABLE `income_type`
  MODIFY `income_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `solution`
--
ALTER TABLE `solution`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `test_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `test_rule`
--
ALTER TABLE `test_rule`
  MODIFY `test_rule_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `test_rule_detail`
--
ALTER TABLE `test_rule_detail`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `test_type`
--
ALTER TABLE `test_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `token`
--
ALTER TABLE `token`
  MODIFY `tk_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `child`
--
ALTER TABLE `child`
  ADD CONSTRAINT `child_fk0` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`);

--
-- Constraints for table `child_child`
--
ALTER TABLE `child_child`
  ADD CONSTRAINT `child_child_fk0` FOREIGN KEY (`c_id1`) REFERENCES `child` (`c_id`),
  ADD CONSTRAINT `child_child_fk1` FOREIGN KEY (`c_id2`) REFERENCES `child` (`c_id`);

--
-- Constraints for table `child_solution`
--
ALTER TABLE `child_solution`
  ADD CONSTRAINT `child_solution_fk0` FOREIGN KEY (`c_id`) REFERENCES `child` (`c_id`),
  ADD CONSTRAINT `child_solution_fk1` FOREIGN KEY (`s_id`) REFERENCES `solution` (`s_id`);

--
-- Constraints for table `examination`
--
ALTER TABLE `examination`
  ADD CONSTRAINT `examination_fk0` FOREIGN KEY (`c_id`) REFERENCES `child` (`c_id`),
  ADD CONSTRAINT `examination_fk1` FOREIGN KEY (`test_rule_id`) REFERENCES `test_rule` (`test_rule_id`);

--
-- Constraints for table `extra_info`
--
ALTER TABLE `extra_info`
  ADD CONSTRAINT `extra_info_fk0` FOREIGN KEY (`c_id`) REFERENCES `child` (`c_id`),
  ADD CONSTRAINT `extra_info_fk1` FOREIGN KEY (`fater_career_id`) REFERENCES `career_type` (`career_id`),
  ADD CONSTRAINT `extra_info_fk2` FOREIGN KEY (`mother_career_id`) REFERENCES `career_type` (`career_id`),
  ADD CONSTRAINT `extra_info_fk3` FOREIGN KEY (`monthly_income`) REFERENCES `income_type` (`income_id`);

--
-- Constraints for table `solution`
--
ALTER TABLE `solution`
  ADD CONSTRAINT `solution_fk0` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`);

--
-- Constraints for table `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `test_fk0` FOREIGN KEY (`type_id`) REFERENCES `test_type` (`type_id`);

--
-- Constraints for table `test_rule_detail`
--
ALTER TABLE `test_rule_detail`
  ADD CONSTRAINT `test_rule_detail_fk0` FOREIGN KEY (`test_rule_id`) REFERENCES `test_rule` (`test_rule_id`),
  ADD CONSTRAINT `test_rule_detail_fk1` FOREIGN KEY (`type_id`) REFERENCES `test_type` (`type_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
