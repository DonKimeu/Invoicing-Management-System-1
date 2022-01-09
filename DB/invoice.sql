CREATE TABLE IF NOT EXISTS `ci_sessions` (
	`id` varchar(128) NOT NULL,
	`ip_address` varchar(45) NOT NULL,
	`timestamp` int(10) unsigned DEFAULT 0 NOT NULL,
	`data` blob NOT NULL,
	KEY `ci_sessions_timestamp` (`timestamp`)
);

-- ALTER TABLE ci_sessions ADD PRIMARY KEY (id);

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `role` enum('admin','staff','','') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `name`, `email`, `password`, `user_name`, `role`) VALUES
(1, 'Mr. Admin', 'admin@digital.com', '574af96709192be4309a8b0e8f3adf29a6dfd53c', 'access', 'admin')

--
-- Indexes for table `admin`
--

ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);
  
  --
-- AUTO_INCREMENT for table `admin`
--

ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `settings_id` int(11) NOT NULL,
  `type` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`settings_id`, `type`, `description`) VALUES
(1, 'system_name', 'StratumWorld Inventory Management System(SIMS)'),
(2, 'system_title', 'StratumWorld Inventory Management System(SIMS)'),
(3, 'address', 'No. 3, Olusegun Odeniyi Street, Olorunisola, Ayobo, Lagos State.'),
(4, 'phone', '+2348027606430'),
(7, 'system_email', 'stratumworldresourcesnig1@gmail.com'),
(11, 'language', 'english'),
(17, 'company', 'STRATUMWORLD RESOURCES LTD.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`settings_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `settings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

CREATE TABLE `category` (
   `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
   `category_name` VARCHAR(50) NOT NULL,
   `description` VARCHAR(100) NOT NULL,
   PRIMARY KEY  (`id`),
   INDEX (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `vendor` (
   `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
   `name` VARCHAR(50) NOT NULL,
   `phone` VARCHAR(50) NOT NULL,
   `debt` INT NOT NULL,
   `credit_limit` INT NOT NULL,
   PRIMARY KEY  (`id`),
   INDEX (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `supplier` (
   `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
   `name` VARCHAR(50) NOT NULL,
   `phone` VARCHAR(50) NOT NULL,
   `product` VARCHAR(100) NOT NULL,
   `total` INT NOT NULL,
   `VAT`         DECIMAL(8,2) UNSIGNED  NOT NULL,
   `amount_paid` INT NOT NULL,
   `payment_date` DATE NOT NULL,
   PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `products` (
   `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
   `category_id` INT UNSIGNED NOT NULL,
   `product_code`         VARCHAR(15) NOT NULL,
   `product_name`         VARCHAR(70) NOT NULL,
   `description`  TEXT NOT NULL, 
   `quantity_in_stock`     SMALLINT NOT NULL DEFAULT 0,
   `quantity_sold`     SMALLINT NOT NULL DEFAULT 0,
   `unit_price`            DECIMAL(8,2) UNSIGNED  NOT NULL,
   `selling_price`         DECIMAL(8,2) UNSIGNED  NOT NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
	ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ice_cream_sales` (
   `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
   `sales_code` VARCHAR(50) NOT NULL,
   `vendor_id` INT UNSIGNED NOT NULL,
   `payment_date` DATE NOT NULL,
   `total_cost_price` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.0,
   `total_selling_price` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.0,
   `profit` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.0,
   `cash_paid` decimal(10,2) UNSIGNED NOT NULL,
   `balance` decimal(10,2) UNSIGNED NOT NULL,
	PRIMARY KEY  (`id`),
	INDEX (`id`),
	FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`id`)
	ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ice_cream_sales_order` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`sales_id` INT UNSIGNED NOT NULL,
	`category_id` INT UNSIGNED NOT NULL,
	`product_id` INT UNSIGNED NOT NULL,
	`item_name` varchar(250) NOT NULL,
	`order_item_quantity` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
	`unit_price` decimal(10,2) NOT NULL,
	`selling_price` decimal(10,2) NOT NULL,
	`total_cost_price` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.0,
   `total_selling_price` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.0,
	PRIMARY KEY  (`id`),
	FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (`sales_id`) REFERENCES `ice_cream_sales` (`id`)
	ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `stationary_sales` (
   `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
   `sales_code` VARCHAR(50) NOT NULL,
   `payment_date` DATE NOT NULL,
   `total_cost_price` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.0,
   `total_selling_price` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.0,
   `profit` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.0,
   `cash_paid` decimal(10,2) UNSIGNED NOT NULL,
	PRIMARY KEY  (`id`),
	INDEX (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `stationary_sales_order` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`sales_id` INT UNSIGNED NOT NULL,
	`category_id` INT UNSIGNED NOT NULL,
	`product_id` INT UNSIGNED NOT NULL,
	`item_name` varchar(250) NOT NULL,
	`order_item_quantity` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
	`unit_price` decimal(10,2) NOT NULL,
	`selling_price` decimal(10,2) NOT NULL,
	`total_cost_price` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.0,
	`total_selling_price` decimal(10,2) UNSIGNED NOT NULL DEFAULT 0.0,
	PRIMARY KEY  (`id`),
	FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
	ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (`sales_id`) REFERENCES `stationary_sales` (`id`)
	ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;