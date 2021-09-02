-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 02, 2021 lúc 05:35 PM
-- Phiên bản máy phục vụ: 10.4.20-MariaDB
-- Phiên bản PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ebook`
--

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_book_infor` (IN `price` INT)  SELECT * FROM inventoryreceivingdeliverynote
WHERE inventoryreceivingdeliverynote.CurrentPriceOfBook = price$$

--
-- Các hàm
--
CREATE DEFINER=`root`@`localhost` FUNCTION `number_of_contact` (`id` CHAR(7) CHARSET utf8mb4) RETURNS INT(11) RETURN (SELECT COUNT(contact.CIDStaff)
			FROM ebook.contact
			WHERE contact.CIDStaff = id)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attached`
--

CREATE TABLE `attached` (
  `IDBook` char(7) NOT NULL,
  `IDCategory` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `author`
--

CREATE TABLE `author` (
  `IDAuthor` char(7) NOT NULL,
  `Fname` varchar(15) DEFAULT NULL,
  `Mname` varchar(15) DEFAULT NULL,
  `Lname` varchar(15) DEFAULT NULL,
  `AddressAuthor` varchar(50) DEFAULT NULL,
  `EmailAuthor` varchar(50) DEFAULT NULL,
  `PhoneAuthor` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `author`
--

INSERT INTO `author` (`IDAuthor`, `Fname`, `Mname`, `Lname`, `AddressAuthor`, `EmailAuthor`, `PhoneAuthor`) VALUES
('00010', 'Nam', NULL, 'Cao', '151, Thượng Đình, Thanh Xuân, Hà Nội', 'namcao@writer.vn', '5454578596'),
('00011', 'Vũ', 'Trọng', 'Phụng', '151, Thượng Đình, Thanh Xuân, Hà Nội', 'vutrongphung@writer.vn', '2130254658'),
('00012', 'Tố', NULL, 'Hữu', '151, Thượng Đình, Thanh Xuân, Hà Nội', 'tohuu@writer.vn', '5465858597'),
('00013', 'Huy', NULL, 'Cận', '151, Thượng Đình, Thanh Xuân, Hà Nội', 'huycan@writer.vn', '5465859576'),
('00014', 'Xuân', NULL, 'Diệu', '151, Thượng Đình, Thanh Xuân, Hà Nội', 'xuandieu@writer.vn', '5465895765'),
('00015', 'Thạch', NULL, 'Lam', '151, Thượng Đình, Thanh Xuân, Hà Nội', 'thachlam@writer.vn', '5458545657'),
('00016', 'Nguyễn', 'Nhật', 'Ánh', '151, Thượng Đình, Thanh Xuân, Hà Nội', 'nguyennhatanh@writer.vn', '5456589576'),
('00017', 'Nguyễn', NULL, 'Du', '151, Thượng Đình, Thanh Xuân, Hà Nội', 'nguyendu@writer.vn', '5465895765'),
('00018', 'Hồ', 'Xuân', 'Hương', '151, Thượng Đình, Thanh Xuân, Hà Nội', 'hoxuanhuong@writer.vn', '1236458953'),
('00019', 'Tô', NULL, 'Hoài', '151, Thượng Đình, Thanh Xuân, Hà Nội', 'tohoai@writer.vn', '1245815685'),
('00020', 'Nguyễn', 'Quang', 'Sáng', '151, Thượng Đình, Thanh Xuân, Hà Nội', 'nguyenquangsang@writer.vn', '5456957825');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `availableobject`
--

CREATE TABLE `availableobject` (
  `IDVoucher` char(7) NOT NULL,
  `AvailableOn` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book`
--

CREATE TABLE `book` (
  `IDBook` char(7) NOT NULL,
  `CurrentBookPrice` int(11) DEFAULT NULL,
  `NameBook` varchar(50) DEFAULT NULL,
  `CoverImage` varchar(255) DEFAULT NULL,
  `BookSummary` varchar(255) DEFAULT NULL,
  `BookPrice` int(11) DEFAULT NULL,
  `BNamePublisher` varchar(50) DEFAULT NULL,
  `PublisherYear` char(4) DEFAULT NULL,
  `PublisherTime` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bookstorage`
--

CREATE TABLE `bookstorage` (
  `AddressStorage` varchar(50) DEFAULT NULL,
  `EmailStorage` varchar(50) DEFAULT NULL,
  `PhoneStorage` varchar(11) DEFAULT NULL,
  `NameStorage` varchar(50) DEFAULT NULL,
  `IDStorage` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `bookstorage`
--

INSERT INTO `bookstorage` (`AddressStorage`, `EmailStorage`, `PhoneStorage`, `NameStorage`, `IDStorage`) VALUES
('121, Tân Phú, Thủ Đức, TP Hồ Chí Minh', 'nhanam@ebook.vn', '123456790', 'Nhã Nam', '001'),
('121, Linh Trung, Thủ Đức, TP Hồ Chí Minh', 'nguyenvancu@hcmut.edu.vn', '0563456790', 'Nguyễn Văn Cừ', '002'),
('121, Phường 9, Bình Thạnh, TP Hồ Chí Minh', 'fahasa@ebook.vn', '123849790', 'Fahasa', '003'),
('121, Bà Điểm, Hóc Môn, TP Hồ Chí Minh', 'phuongnam@ebook.vn', '789156790', 'Phương Nam', '004'),
('121, An Phú Đông, Quận 12, TP Hồ Chí Minh', 'xuanthu@ebook.vn', '896156790', 'Xuân Thu', '005');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cardpayment`
--

CREATE TABLE `cardpayment` (
  `IDPayment` char(7) NOT NULL,
  `NumberCard` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `NumberOfBook` int(11) DEFAULT NULL,
  `NameCategory` varchar(50) DEFAULT NULL,
  `IDCategory` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `IDCustomer` char(7) NOT NULL,
  `CmtTime` datetime NOT NULL,
  `IDBookC` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact`
--

CREATE TABLE `contact` (
  `CIDAuthor` char(7) NOT NULL,
  `CIDStaff` char(7) NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `contact`
--

INSERT INTO `contact` (`CIDAuthor`, `CIDStaff`, `ID`) VALUES
('00010', '0002', 1),
('00011', '0007', 2),
('00012', '0003', 3),
('00013', '0005', 4),
('00014', '0007', 5),
('00015', '0007', 6),
('00016', '0008', 7),
('00017', '0008', 8),
('00018', '0003', 9),
('00019', '0005', 10),
('00020', '0003', 11);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `content`
--

CREATE TABLE `content` (
  `Evaluate` smallint(6) DEFAULT NULL CHECK (`Evaluate` >= 0 and `Evaluate` <= 5),
  `Comment` varchar(255) DEFAULT NULL,
  `ShippingQuantity` smallint(6) DEFAULT NULL CHECK (`ShippingQuantity` >= 0 and `ShippingQuantity` <= 5),
  `ServiceQuantity` smallint(6) DEFAULT NULL CHECK (`ServiceQuantity` >= 0 and `ServiceQuantity` <= 5),
  `IDCustomer` char(7) NOT NULL,
  `IDBookC` char(7) NOT NULL,
  `Time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `creditcard`
--

CREATE TABLE `creditcard` (
  `NumberCard` varchar(16) NOT NULL CHECK (`NumberCard` not in ('','null','NULL')),
  `EndTime` date DEFAULT NULL,
  `NameBank` varchar(50) DEFAULT NULL,
  `NameOwer` varchar(50) DEFAULT NULL,
  `StartTime` date DEFAULT NULL,
  `NameBranch` varchar(50) DEFAULT NULL,
  `IDCustomer` char(7) NOT NULL CHECK (`IDCustomer` not in ('','null','NULL'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `Fname` varchar(15) DEFAULT NULL,
  `Mname` varchar(15) DEFAULT NULL,
  `Lname` varchar(15) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL CHECK (`Sex` in ('M','F')),
  `DateOfBirth` date DEFAULT NULL,
  `AddressCustomer` varchar(50) DEFAULT NULL,
  `PhoneCustomer` varchar(11) DEFAULT NULL,
  `EmailCustomer` varchar(50) DEFAULT NULL,
  `PasswordCustomer` varchar(20) DEFAULT NULL,
  `UserCustomer` varchar(20) DEFAULT NULL,
  `IDCustomer` char(7) NOT NULL CHECK (`IDCustomer` not in ('','null','NULL'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ebook`
--

CREATE TABLE `ebook` (
  `IDBook` char(7) NOT NULL,
  `AddressBook` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `inventoryreceivingdeliverynote`
--

CREATE TABLE `inventoryreceivingdeliverynote` (
  `IDNote` char(7) NOT NULL,
  `NameStaff` varchar(50) DEFAULT NULL,
  `Time` datetime DEFAULT NULL,
  `StoreAddress` varchar(50) DEFAULT NULL,
  `NameOfBook` varchar(50) DEFAULT NULL,
  `IDOfBook` char(7) NOT NULL,
  `AmountOfBook` int(11) DEFAULT NULL,
  `CurrentPriceOfBook` int(11) DEFAULT NULL,
  `IDIDStaff` char(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `inventoryreceivingdeliverynote`
--

INSERT INTO `inventoryreceivingdeliverynote` (`IDNote`, `NameStaff`, `Time`, `StoreAddress`, `NameOfBook`, `IDOfBook`, `AmountOfBook`, `CurrentPriceOfBook`, `IDIDStaff`) VALUES
('00001', 'Phạm Công Hậu', '2021-08-28 15:40:58', '121, Tân Phú, Thủ Đức, TP Hồ Chí Minh', 'Hoàng Tử Bé', '000001', 50, 65000, '0007'),
('00002', 'Bùi Tiến Bình', '2021-08-28 15:40:58', '121, Tân Phú, Thủ Đức, TP Hồ Chí Minh', 'Thần Thoại Bắc Âu', '000021', 100, 130000, '0008'),
('00003', 'Chế Quang Huy', '2021-08-28 15:40:58', '121, Linh Trung, Thủ Đức, TP Hồ Chí Minh', 'Thần Thoại Hy Lạp', '000020', 100, 160000, '0005'),
('00004', 'Trần Minh Phong', '2021-08-28 15:40:58', '121, Linh Trung, Thủ Đức, TP Hồ Chí Minh', 'Các Vị Thần Ai Cập', '000022', 100, 100000, '0002'),
('00005', 'Trần Trọng Nguyên', '2021-08-28 15:40:58', '121, Phường 9, Bình Thạnh, TP Hồ Chí Minh', 'Tuổi Trẻ Đáng Giá Bao Nhiêu', '000101', 500, 60000, '0003'),
('00006', 'Phạm Công Hậu', '2021-08-28 16:59:12', '121, Tân Phú, Thủ Đức, TP Hồ Chí Minh', 'Những Thời Thơ Ấu', '000002', 50, 63000, '0007'),
('00007', 'Bùi Tiến Bình', '2021-08-28 17:54:59', '121, Tân Phú, Thủ Đức, TP Hồ Chí Minh', 'Chiếc Lá Cuối Cùng', '000003', 50, 70000, '0008');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `keyword`
--

CREATE TABLE `keyword` (
  `IDBook` char(7) NOT NULL,
  `BKeyWord` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `OIDPayment` char(7) NOT NULL,
  `IDOrder` char(7) NOT NULL,
  `DateTime` datetime DEFAULT NULL,
  `Amount` int(11) DEFAULT NULL,
  `CurrentPrice` int(11) DEFAULT NULL,
  `PaymentTime` datetime DEFAULT NULL,
  `NameOfBook` varchar(50) DEFAULT NULL,
  `IDBOOK` char(7) NOT NULL,
  `IDVoucher` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderbook`
--

CREATE TABLE `orderbook` (
  `ONamePublisher` varchar(50) NOT NULL,
  `OrderedTime` datetime DEFAULT NULL,
  `OIDStaff` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `orderbook`
--

INSERT INTO `orderbook` (`ONamePublisher`, `OrderedTime`, `OIDStaff`) VALUES
('First New', '2021-08-28 15:26:08', '0008'),
('Giáo Dục', '2021-08-28 15:24:59', '0007'),
('Hồng Đức', '2021-08-28 15:24:17', '0003'),
('Khoa Học - Kỹ Thuật', '2021-08-28 15:26:08', '0008'),
('Kim Đồng', '2021-08-28 15:24:17', '0005'),
('Lao Động', '2021-08-28 15:23:19', '0002'),
('Phụ Nữ', '2021-08-28 15:23:19', '0007'),
('Thanh Niên', '2021-08-28 15:24:59', '0007'),
('Tri Thức', '2021-08-28 15:26:54', '0005'),
('Tuổi Trẻ', '2021-08-28 15:26:54', '0003');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ordered`
--

CREATE TABLE `ordered` (
  `IDCustomer` char(7) DEFAULT NULL,
  `OIDBook` char(7) NOT NULL,
  `OIDOrder` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `paperbook`
--

CREATE TABLE `paperbook` (
  `IDBook` char(7) NOT NULL,
  `SIDStore` char(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payment`
--

CREATE TABLE `payment` (
  `IDPayment` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `publisher`
--

CREATE TABLE `publisher` (
  `NamePublisher` varchar(50) NOT NULL,
  `AddressPublisher` varchar(50) DEFAULT NULL,
  `PhonePublisher` varchar(11) DEFAULT NULL,
  `EmailPublisher` varchar(50) DEFAULT NULL,
  `BusinessCode` char(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `publisher`
--

INSERT INTO `publisher` (`NamePublisher`, `AddressPublisher`, `PhonePublisher`, `EmailPublisher`, `BusinessCode`) VALUES
('First New', '151, Linh Trung, Thủ Đức, TP Hồ Chí Minh', '1245678952', 'firstnew@.pub.vn', '01'),
('Giáo Dục', '151, Phương Liệt, Thanh Xuân, Hà Nội', '5467954823', 'giaoduc@.pub.vn', '02'),
('Hồng Đức', '151, Phường 7, Quận 10, TP Hồ Chí Minh', '5465795823', 'hongduc@.pub.vn', '03'),
('Khoa Học - Kỹ Thuật', '151, Thanh Trì, Hoàng Mai, Hà Nội', '2546578958', 'khkthuat@.pub.vn', '04'),
('Kim Đồng', '151, Đa Cao, Quận 1, TP Hồ Chí Minh', '5465485492', 'kimdong@.pub.vn', '05'),
('Lao Động', '151, Bến Thành, Quận 1, TP Hồ Chí Minh', '5454457856', 'laodong@.pub.vn', '06'),
('Phụ Nữ', '151, Nhật Tân, Tây Hồ, Hà Nội', '2146585965', 'phunu@.pub.vn', '07'),
('Thanh Niên', '151, Phường 5, Quận 10, TP Hồ Chí Minh', '5458595456', 'thanhnien@.pub.vn', '08'),
('Tri Thức', '151, Phường 7, Quận 3, TP Hồ Chí Minh', '5454789563', 'trithuc@.pub.vn', '09'),
('Tuổi Trẻ', '151, Nghé, Quận 1, TP Hồ Chí Minh', '5465789546', 'tuoitre@.pub.vn', '10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rcomment`
--

CREATE TABLE `rcomment` (
  `IDCustomer` char(7) NOT NULL,
  `IDBookC` char(7) NOT NULL,
  `RTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `staff`
--

CREATE TABLE `staff` (
  `Fname` varchar(15) DEFAULT NULL,
  `Mname` varchar(15) DEFAULT NULL,
  `Lname` varchar(15) DEFAULT NULL,
  `AddressStaff` varchar(50) DEFAULT NULL,
  `EmailStaff` varchar(50) DEFAULT NULL,
  `PhoneStaff` varchar(11) DEFAULT NULL,
  `PasswordStaff` varchar(20) DEFAULT NULL,
  `UserStaff` varchar(20) DEFAULT NULL,
  `IDStaff` char(7) NOT NULL,
  `SIDStorage` char(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `staff`
--

INSERT INTO `staff` (`Fname`, `Mname`, `Lname`, `AddressStaff`, `EmailStaff`, `PhoneStaff`, `PasswordStaff`, `UserStaff`, `IDStaff`, `SIDStorage`) VALUES
('Trần', 'Minh', 'Phong', '122, Tân Phú, Quận 9, TP Hồ Chí Minh', 'phong.tran@hcmut.edu.vn', '0000000004', '0000004', 'phong.tran', '0002', '002'),
('Trần', 'Trọng', 'Nguyên', '123, Tân Phú, Quận 9, TP Hồ Chí Minh', 'nguyen.tran@hcmut.edu.vn', '0393153500', '0000005', 'nguyen.tran', '0003', '003'),
('Chế', 'Quang', 'Huy', '124, Tân Phú, Quận 9, TP Hồ Chí Minh', 'huy.che@hcmut.edu.vn', '0123456789', '0000001', 'huy.che', '0005', '002'),
('Phạm', 'Công', 'Hậu', '191, Tân Phú, Quận 9, TP Hồ Chí Minh', 'hau.pham@hcmut.edu.vn', '0000000002', '0000002', 'hau.pham', '0007', '001'),
('Bùi', 'Tiến', 'Bình', '125, Tân Phú, Quận 9, TP Hồ Chí Minh', 'binh.bui@hcmut.edu.vn', '0000000003', '0000003', 'binh.bui', '0008', '001');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `storagetypebook`
--

CREATE TABLE `storagetypebook` (
  `TIDStorage` char(7) NOT NULL,
  `TypeBook` varchar(50) NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `storagetypebook`
--

INSERT INTO `storagetypebook` (`TIDStorage`, `TypeBook`, `ID`) VALUES
('002', 'Khoa Học Tự Nhiên', 1),
('002', 'Khoa Học Xã Hội', 2),
('003', 'Tham Khảo', 3),
('003', 'Thiếu Nhi', 4),
('004', 'Chính Trị', 5),
('004', 'Đời Sống - Gia Đình', 6),
('005', 'Công Nghệ - Kinh Tế', 7),
('005', 'Sách Giáo Khoa', 8),
('001', 'Văn Học Việt Nam', 9),
('001', 'Văn Học Nước Ngoài', 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tranfer`
--

CREATE TABLE `tranfer` (
  `IDPayment` char(7) NOT NULL,
  `BankAccountNumber` varchar(20) DEFAULT NULL,
  `NameBank` varchar(50) DEFAULT NULL,
  `NameBranch` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `typeofbook`
--

CREATE TABLE `typeofbook` (
  `IDBook` char(7) NOT NULL,
  `BookType` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `voucher`
--

CREATE TABLE `voucher` (
  `Discount` smallint(6) DEFAULT NULL,
  `TimeOfVoucher` datetime DEFAULT NULL,
  `IDVoucher` char(7) NOT NULL,
  `VIDBook` char(7) DEFAULT NULL,
  `VIDOrder` char(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `writtenby`
--

CREATE TABLE `writtenby` (
  `IDBook` char(7) NOT NULL,
  `IDAuthor` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `attached`
--
ALTER TABLE `attached`
  ADD PRIMARY KEY (`IDBook`,`IDCategory`),
  ADD KEY `IDCategory` (`IDCategory`);

--
-- Chỉ mục cho bảng `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`IDAuthor`);

--
-- Chỉ mục cho bảng `availableobject`
--
ALTER TABLE `availableobject`
  ADD PRIMARY KEY (`IDVoucher`,`AvailableOn`);

--
-- Chỉ mục cho bảng `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`IDBook`),
  ADD KEY `BNamePublisher` (`BNamePublisher`);

--
-- Chỉ mục cho bảng `bookstorage`
--
ALTER TABLE `bookstorage`
  ADD PRIMARY KEY (`IDStorage`);

--
-- Chỉ mục cho bảng `cardpayment`
--
ALTER TABLE `cardpayment`
  ADD PRIMARY KEY (`IDPayment`),
  ADD KEY `NumberCard` (`NumberCard`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`IDCategory`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`IDCustomer`,`CmtTime`,`IDBookC`),
  ADD KEY `IDBookC` (`IDBookC`);

--
-- Chỉ mục cho bảng `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`IDBookC`,`IDCustomer`,`Time`),
  ADD KEY `IDCustomer` (`IDCustomer`,`Time`,`IDBookC`);

--
-- Chỉ mục cho bảng `creditcard`
--
ALTER TABLE `creditcard`
  ADD PRIMARY KEY (`NumberCard`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`IDCustomer`);

--
-- Chỉ mục cho bảng `ebook`
--
ALTER TABLE `ebook`
  ADD PRIMARY KEY (`IDBook`);

--
-- Chỉ mục cho bảng `inventoryreceivingdeliverynote`
--
ALTER TABLE `inventoryreceivingdeliverynote`
  ADD PRIMARY KEY (`IDNote`),
  ADD KEY `IDIDStaff` (`IDIDStaff`);

--
-- Chỉ mục cho bảng `keyword`
--
ALTER TABLE `keyword`
  ADD PRIMARY KEY (`IDBook`,`BKeyWord`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`IDOrder`),
  ADD KEY `OIDPayment` (`OIDPayment`),
  ADD KEY `IDVoucher` (`IDVoucher`);

--
-- Chỉ mục cho bảng `orderbook`
--
ALTER TABLE `orderbook`
  ADD PRIMARY KEY (`ONamePublisher`,`OIDStaff`),
  ADD KEY `ONamePublisher` (`ONamePublisher`,`OIDStaff`);

--
-- Chỉ mục cho bảng `ordered`
--
ALTER TABLE `ordered`
  ADD PRIMARY KEY (`OIDBook`,`OIDOrder`),
  ADD KEY `OIDOrder` (`OIDOrder`),
  ADD KEY `IDCustomer` (`IDCustomer`);

--
-- Chỉ mục cho bảng `paperbook`
--
ALTER TABLE `paperbook`
  ADD PRIMARY KEY (`IDBook`),
  ADD KEY `SIDStore` (`SIDStore`);

--
-- Chỉ mục cho bảng `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`IDPayment`);

--
-- Chỉ mục cho bảng `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Chỉ mục cho bảng `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Chỉ mục cho bảng `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Chỉ mục cho bảng `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Chỉ mục cho bảng `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Chỉ mục cho bảng `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Chỉ mục cho bảng `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Chỉ mục cho bảng `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Chỉ mục cho bảng `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Chỉ mục cho bảng `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Chỉ mục cho bảng `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Chỉ mục cho bảng `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Chỉ mục cho bảng `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Chỉ mục cho bảng `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Chỉ mục cho bảng `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- Chỉ mục cho bảng `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`NamePublisher`);

--
-- Chỉ mục cho bảng `rcomment`
--
ALTER TABLE `rcomment`
  ADD PRIMARY KEY (`RTime`,`IDBookC`),
  ADD KEY `IDCustomer` (`IDCustomer`,`RTime`,`IDBookC`);

--
-- Chỉ mục cho bảng `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`IDStaff`),
  ADD KEY `SIDStorage` (`SIDStorage`);

--
-- Chỉ mục cho bảng `storagetypebook`
--
ALTER TABLE `storagetypebook`
  ADD PRIMARY KEY (`ID`);

--
-- Chỉ mục cho bảng `tranfer`
--
ALTER TABLE `tranfer`
  ADD PRIMARY KEY (`IDPayment`);

--
-- Chỉ mục cho bảng `typeofbook`
--
ALTER TABLE `typeofbook`
  ADD PRIMARY KEY (`IDBook`,`BookType`);

--
-- Chỉ mục cho bảng `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`IDVoucher`),
  ADD KEY `VIDBook` (`VIDBook`),
  ADD KEY `VIDOrder` (`VIDOrder`);

--
-- Chỉ mục cho bảng `writtenby`
--
ALTER TABLE `writtenby`
  ADD PRIMARY KEY (`IDBook`,`IDAuthor`),
  ADD KEY `IDAuthor` (`IDAuthor`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `contact`
--
ALTER TABLE `contact`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `storagetypebook`
--
ALTER TABLE `storagetypebook`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `attached`
--
ALTER TABLE `attached`
  ADD CONSTRAINT `attached_ibfk_1` FOREIGN KEY (`IDBook`) REFERENCES `book` (`IDBook`),
  ADD CONSTRAINT `attached_ibfk_2` FOREIGN KEY (`IDCategory`) REFERENCES `category` (`IDCategory`);

--
-- Các ràng buộc cho bảng `availableobject`
--
ALTER TABLE `availableobject`
  ADD CONSTRAINT `availableobject_ibfk_1` FOREIGN KEY (`IDVoucher`) REFERENCES `voucher` (`IDVoucher`);

--
-- Các ràng buộc cho bảng `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`BNamePublisher`) REFERENCES `publisher` (`NamePublisher`);

--
-- Các ràng buộc cho bảng `cardpayment`
--
ALTER TABLE `cardpayment`
  ADD CONSTRAINT `cardpayment_ibfk_1` FOREIGN KEY (`IDPayment`) REFERENCES `payment` (`IDPayment`),
  ADD CONSTRAINT `cardpayment_ibfk_2` FOREIGN KEY (`NumberCard`) REFERENCES `creditcard` (`NumberCard`);

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`IDBookC`) REFERENCES `book` (`IDBook`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`IDCustomer`) REFERENCES `customer` (`IDCustomer`);

--
-- Các ràng buộc cho bảng `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`CIDStaff`) REFERENCES `staff` (`IDStaff`),
  ADD CONSTRAINT `contact_ibfk_2` FOREIGN KEY (`CIDAuthor`) REFERENCES `author` (`IDAuthor`);

--
-- Các ràng buộc cho bảng `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `content_ibfk_1` FOREIGN KEY (`IDCustomer`,`Time`,`IDBookC`) REFERENCES `comment` (`IDCustomer`, `CmtTime`, `IDBookC`);

--
-- Các ràng buộc cho bảng `ebook`
--
ALTER TABLE `ebook`
  ADD CONSTRAINT `ebook_ibfk_1` FOREIGN KEY (`IDBook`) REFERENCES `book` (`IDBook`);

--
-- Các ràng buộc cho bảng `inventoryreceivingdeliverynote`
--
ALTER TABLE `inventoryreceivingdeliverynote`
  ADD CONSTRAINT `inventoryreceivingdeliverynote_ibfk_1` FOREIGN KEY (`IDIDStaff`) REFERENCES `staff` (`IDStaff`);

--
-- Các ràng buộc cho bảng `keyword`
--
ALTER TABLE `keyword`
  ADD CONSTRAINT `keyword_ibfk_1` FOREIGN KEY (`IDBook`) REFERENCES `book` (`IDBook`);

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`OIDPayment`) REFERENCES `payment` (`IDPayment`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`IDVoucher`) REFERENCES `voucher` (`IDVoucher`);

--
-- Các ràng buộc cho bảng `orderbook`
--
ALTER TABLE `orderbook`
  ADD CONSTRAINT `orderbook_ibfk_1` FOREIGN KEY (`OIDStaff`) REFERENCES `staff` (`IDStaff`),
  ADD CONSTRAINT `orderbook_ibfk_2` FOREIGN KEY (`ONamePublisher`) REFERENCES `publisher` (`NamePublisher`);

--
-- Các ràng buộc cho bảng `ordered`
--
ALTER TABLE `ordered`
  ADD CONSTRAINT `ordered_ibfk_1` FOREIGN KEY (`OIDBook`) REFERENCES `book` (`IDBook`),
  ADD CONSTRAINT `ordered_ibfk_2` FOREIGN KEY (`OIDOrder`) REFERENCES `order` (`IDOrder`),
  ADD CONSTRAINT `ordered_ibfk_3` FOREIGN KEY (`IDCustomer`) REFERENCES `customer` (`IDCustomer`);

--
-- Các ràng buộc cho bảng `paperbook`
--
ALTER TABLE `paperbook`
  ADD CONSTRAINT `paperbook_ibfk_1` FOREIGN KEY (`IDBook`) REFERENCES `book` (`IDBook`),
  ADD CONSTRAINT `paperbook_ibfk_2` FOREIGN KEY (`SIDStore`) REFERENCES `bookstorage` (`IDStorage`);

--
-- Các ràng buộc cho bảng `rcomment`
--
ALTER TABLE `rcomment`
  ADD CONSTRAINT `rcomment_ibfk_1` FOREIGN KEY (`IDCustomer`,`RTime`,`IDBookC`) REFERENCES `comment` (`IDCustomer`, `CmtTime`, `IDBookC`);

--
-- Các ràng buộc cho bảng `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`SIDStorage`) REFERENCES `bookstorage` (`IDStorage`);

--
-- Các ràng buộc cho bảng `storagetypebook`
--
ALTER TABLE `storagetypebook`
  ADD CONSTRAINT `storagetypebook_ibfk_1` FOREIGN KEY (`TIDStorage`) REFERENCES `bookstorage` (`IDStorage`);

--
-- Các ràng buộc cho bảng `tranfer`
--
ALTER TABLE `tranfer`
  ADD CONSTRAINT `tranfer_ibfk_1` FOREIGN KEY (`IDPayment`) REFERENCES `payment` (`IDPayment`);

--
-- Các ràng buộc cho bảng `typeofbook`
--
ALTER TABLE `typeofbook`
  ADD CONSTRAINT `typeofbook_ibfk_1` FOREIGN KEY (`IDBook`) REFERENCES `book` (`IDBook`);

--
-- Các ràng buộc cho bảng `voucher`
--
ALTER TABLE `voucher`
  ADD CONSTRAINT `voucher_ibfk_1` FOREIGN KEY (`VIDBook`) REFERENCES `book` (`IDBook`),
  ADD CONSTRAINT `voucher_ibfk_2` FOREIGN KEY (`VIDOrder`) REFERENCES `order` (`IDOrder`);

--
-- Các ràng buộc cho bảng `writtenby`
--
ALTER TABLE `writtenby`
  ADD CONSTRAINT `writtenby_ibfk_1` FOREIGN KEY (`IDBook`) REFERENCES `book` (`IDBook`),
  ADD CONSTRAINT `writtenby_ibfk_2` FOREIGN KEY (`IDAuthor`) REFERENCES `author` (`IDAuthor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
