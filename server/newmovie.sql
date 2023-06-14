-- Adminer 4.8.1 MySQL 8.0.32 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `banner_id` int NOT NULL AUTO_INCREMENT,
  `film_id` int NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`banner_id`),
  KEY `film_id` (`film_id`),
  CONSTRAINT `banner_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `banner` (`banner_id`, `film_id`, `image`) VALUES
(1,	1,	'https://mir-s3-cdn-cf.behance.net/project_modules/1400/706b9474134343.5c239806af449.jpg'),
(2,	2,	'https://goggler.my/wp-content/uploads/2019/12/JM2_INTL_30Sht_BRIDGE_03-e1575889045252.jpg'),
(3,	3,	'https://i.redd.it/c6vvgssko2r21.jpg');

DROP TABLE IF EXISTS `book_ticket`;
CREATE TABLE `book_ticket` (
  `email` varchar(255) NOT NULL,
  `book_ticket_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_ci NOT NULL,
  `showtimes_id` int NOT NULL,
  `seat_id` int NOT NULL,
  `ticket_price` int NOT NULL,
  PRIMARY KEY (`email`,`book_ticket_id`),
  UNIQUE KEY `book_ticket_id` (`book_ticket_id`),
  KEY `showtimes_id` (`showtimes_id`),
  KEY `seat_id` (`seat_id`),
  CONSTRAINT `book_ticket_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`),
  CONSTRAINT `book_ticket_ibfk_2` FOREIGN KEY (`showtimes_id`) REFERENCES `showtimes` (`showtimes_id`),
  CONSTRAINT `book_ticket_ibfk_3` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`seat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `book_ticket` (`email`, `book_ticket_id`, `showtimes_id`, `seat_id`, `ticket_price`) VALUES
('giahuy4@gmail.com',	'0a916fa6-cf01-4309-8c93-c33e7cefe197',	2,	88,	100000),
('giahuy4@gmail.com',	'1a07a7aa-3c2e-45bf-880b-e3b09d8d3ace',	11,	8,	100000),
('giahuy4@gmail.com',	'23bdc01f-3cea-40c0-812d-84bda7ea914b',	2,	55,	85000),
('giahuy4@gmail.com',	'5e7bcdd4-49fa-40ea-b1fb-f6487ac15889',	2,	54,	85000),
('giahuy4@gmail.com',	'700323c7-92ac-4ae3-a907-685d63a2fa60',	12,	9,	85000),
('giahuy4@gmail.com',	'7b853fdf-df4c-4b17-99ff-e9fe6f8a19a3',	7,	8,	100000),
('giahuy4@gmail.com',	'7ff9a178-40cf-4705-b400-74b750534fc0',	3,	8,	100000),
('giahuy4@gmail.com',	'a4a1cae5-c91c-4cce-a2b9-f1b54ce23d8c',	7,	9,	85000),
('giahuy4@gmail.com',	'b1dfae5a-657e-4b42-a481-edb3d3a1d627',	12,	8,	100000),
('giahuy4@gmail.com',	'ee156ed4-3149-49a9-bc09-73102a6e448a',	3,	9,	85000),
('giahuy4@gmail.com',	'f7094b70-6b4f-47df-91c2-5437ff3e4ef9',	11,	9,	85000),
('giahuy8@gmail.com',	'8a7b46d9-b446-488d-8b95-8fd72bbadff2',	3,	1,	100000),
('giahuy8@gmail.com',	'c02fe305-f54e-44c7-a38e-42d41d21e077',	3,	3,	85000),
('giahuy8@gmail.com',	'f2d80f57-edde-47e8-8468-8b909ce6bfba',	3,	2,	85000),
('user3@gmail.com',	'2907319b-66af-4624-b11d-2e4d6cb417d4',	7,	8,	100000),
('user3@gmail.com',	'3e6c2805-8201-46ec-95db-8bfd2a7178da',	2,	6,	100000),
('user3@gmail.com',	'59df55ff-ed21-4248-9ba7-26200ea53b74',	11,	5,	85000),
('user3@gmail.com',	'5ee167a1-e00b-4c6e-811a-334d01520cd1',	10,	5,	85000),
('user3@gmail.com',	'68be5718-d957-4f90-9ed1-f8b770f7fa79',	3,	6,	100000),
('user3@gmail.com',	'738dd91a-b6bc-4e84-8ebe-d1670500ef16',	7,	9,	85000),
('user3@gmail.com',	'8d17176f-3374-4a0c-827b-ba56898f3486',	3,	6,	100000),
('user3@gmail.com',	'960d47e3-8757-4815-af03-c6d1e01e89b9',	3,	7,	85000),
('user3@gmail.com',	'a7d9217a-f8b3-4df2-8473-ad09b5eae6dc',	7,	9,	85000),
('user3@gmail.com',	'bd1d0b1a-b897-4a92-bbfd-bc9145135c33',	1,	6,	85000),
('user3@gmail.com',	'edef2af0-db39-4720-9a60-55433cad132a',	6,	8,	100000),
('user3@gmail.com',	'f9f7e1a4-ac49-4639-88e3-6fa481b8d685',	6,	9,	85000),
('user3@gmail.com',	'fb4cd50c-d11e-437a-ae82-b937f420f533',	7,	8,	100000);

DROP TABLE IF EXISTS `cinema`;
CREATE TABLE `cinema` (
  `cinema_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `cinemaGroup_id` int NOT NULL,
  PRIMARY KEY (`cinema_id`),
  KEY `cinemaGroup_id` (`cinemaGroup_id`),
  CONSTRAINT `cinema_ibfk_1` FOREIGN KEY (`cinemaGroup_id`) REFERENCES `cinemaGroup` (`cinemaGroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `cinema` (`cinema_id`, `name`, `cinemaGroup_id`) VALUES
(1,	'Rạp 1',	1),
(2,	'Rạp 2',	2),
(3,	'Rạp 3',	3),
(4,	'Rạp 4',	4),
(5,	'Rạp 5',	5),
(8,	'Rạp 1',	6),
(9,	'Rạp 2',	7),
(10,	'Rạp 1 ',	8),
(11,	'Rạp 3',	9),
(12,	'Rạp 2',	10),
(13,	'Rạp 1',	11),
(14,	'Rạp 2',	12),
(15,	'Rạp 1',	13),
(16,	'Rạp 1',	14),
(17,	'Rạp 1',	15);

DROP TABLE IF EXISTS `cinemaGroup`;
CREATE TABLE `cinemaGroup` (
  `cinemaGroup_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `cinemaSystem_id` int NOT NULL,
  PRIMARY KEY (`cinemaGroup_id`),
  KEY `cinemaSystem_id` (`cinemaSystem_id`),
  CONSTRAINT `cinemaGroup_ibfk_1` FOREIGN KEY (`cinemaSystem_id`) REFERENCES `cinemaSystem` (`cinemaSystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `cinemaGroup` (`cinemaGroup_id`, `name`, `address`, `cinemaSystem_id`) VALUES
(1,	'BHD Star Cineplex - Trần Hưng Đạo',	'15/2 KP2 Trần Hưng Đạo, Q10',	1),
(2,	'BHD Star Cineplex - Đường 3/2',	'L5-Vincom 3/2, 3C Đường 3/2, Q.10',	1),
(3,	'BHD Star Cineplex - Phạm Hùng',	'B1-Vincom QT, 190 Phạm Hùng, Gò Vấp',	1),
(4,	'BHD Star Cineplex - Lê Văn Việt',	'L3-Bitexco Icon 68, 2 Lê Văn Việt, Q.1',	1),
(5,	'BHD Star Cineplex - Thảo Điền',	'L5, P2 Thảo Triều, Q.1',	1),
(6,	'Cinestar - Nguyễn Văn',	'B2, 23/54 Nguyễn Văn, Q9',	2),
(7,	'Cinestar - Hai Bà Trưng',	'135 Hai Bà Trưng, Bến Nghé, Q.1',	2),
(8,	'Cinestar - Quốc Thanh',	'271 Quốc Thanh, Q.1',	2),
(9,	'Galaxy Cinema - Huỳnh Phát',	'1362 Huỳnh Tấn Phát, KP1, Phú Mỹ, Q.7',	3),
(10,	'Galaxy Cinema - Nguyễn Du',	'87 Nguyễn Du, KP1, Phú Mỹ, Thủ Đức',	3),
(11,	'Mega GS - Bình Tân',	'32, Aeon Bình Tân, Q3',	4),
(12,	'Lotte cinema - Cao Thắng',	'43, L5, Cao Thắng, Q.10',	5),
(13,	'Lotte cinema - Hoàng Văn Thụ',	'68, L5, Hoàng Văn Thụ, Q7',	5),
(14,	'Lotte cinema - Đồng Khởi',	' 72 Lê Thánh Tôn, Bến Nghé, Q. 1',	5),
(15,	'Galaxy Cinema - Bitexco',	'43 Bitextco, Hàm Nghi, Q1',	3);

DROP TABLE IF EXISTS `cinemaSystem`;
CREATE TABLE `cinemaSystem` (
  `cinemaSystem_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  PRIMARY KEY (`cinemaSystem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `cinemaSystem` (`cinemaSystem_id`, `name`, `logo`) VALUES
(1,	'BHD Star Cineplex',	'https://movienew.cybersoft.edu.vn/hinhanh/bhd-star-cineplex.png'),
(2,	'Cinestar',	'https://movienew.cybersoft.edu.vn/hinhanh/cinestar.png'),
(3,	'Galaxy Cinema',	'https://movienew.cybersoft.edu.vn/hinhanh/galaxy-cinema.png'),
(4,	'Mega GS',	'https://movienew.cybersoft.edu.vn/hinhanh/megags.png'),
(5,	'Lotte cinema',	'https://movienew.cybersoft.edu.vn/hinhanh/lotte-cinema.png');

DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `film_id` int NOT NULL,
  `date` varchar(255) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`comment_id`),
  KEY `email` (`email`),
  KEY `film_id` (`film_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `comment` (`comment_id`, `email`, `film_id`, `date`, `content`) VALUES
(3,	'user2@gmail.com',	2,	'2020-02-1',	'phim tệ'),
(5,	'user2@gmail.com',	3,	'2020-02-1',	'tạm thôi ko quá hay');

DROP TABLE IF EXISTS `film`;
CREATE TABLE `film` (
  `film_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `trailer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text,
  `release_day` varchar(100) DEFAULT NULL,
  `rate` int DEFAULT NULL,
  `hot` tinyint(1) DEFAULT NULL,
  `coming` tinyint(1) DEFAULT NULL,
  `showing` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`film_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `film` (`film_id`, `name`, `trailer`, `image`, `description`, `release_day`, `rate`, `hot`, `coming`, `showing`) VALUES
(1,	'URI : biệt đội chống ma',	'https://www.youtube.com/watch?v=VVY3do673Zc',	'1686714595409_test.jpg',	'mô tả phim URI',	'2022-01-01',	5,	1,	0,	1),
(2,	'Jumanji',	'https://www.youtube.com/watch?v=2QKg5SZ_35I',	'https://m.media-amazon.com/images/I/71Wv4ZNXWQL._AC_UF894,1000_QL80_.jpg',	'mô tả phim jumnaji',	'2022-02-01',	5,	0,	0,	1),
(3,	'Avenger 2',	'https://www.youtube.com/watch?v=TcMBFSGVi1c',	'https://cdn.shopify.com/s/files/1/0057/3728/3618/products/108b520c55e3c9760f77a06110d6a73b_480x.progressive.jpg?v=1573652543',	'mô tả phim avenger',	'2020-02-01',	4,	1,	0,	1),
(4,	'Sát thủ john cena',	'https://www.youtube.com/watch?v=i43tkaTXtwI',	'https://www.themoviedb.org/t/p/w440_and_h660_face/ksg3XSEezxpRVEB6BrKxmNOuhft.jpg',	'phim kể về cậu bé bút chì ',	'2022-04-06',	5,	1,	0,	1),
(5,	'White man cannot jump',	'',	'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/7MUQMSncjUSYeNx0ZAgFCxhlPhv.jpg',	'phim mỹ',	'2021-03-05',	1,	0,	0,	1),
(7,	'Lật mặt nhé',	'https://www.youtube.com/watch?v=9E87PRS437g',	'https://m.media-amazon.com/images/I/71Wv4ZNXWQL._AC_UF894,1000_QL80_.jpg',	'Tấm vé có mệnh giá 10.000 đồng và sở hữu những con số \"định mệnh\": 10, 16, 18, 20, 27, 28 - ngày sinh của hội bạn thân sáu người do Trung Dũng, Quốc Cường, Thanh Thức, Huy Khánh, Hoàng Mèo, Trần Kim Hải đảm nhận.',	'2022-04-06',	5,	1,	0,	1),
(8,	'GUARDIANS OF THE GALAXY VOL.3',	'https://www.youtube.com/watch?v=9E87PRS437g',	'https://movienew.cybersoft.edu.vn/hinhanh/guardians-of-the-galaxy-vol-3-xem-them-tai-https-www-galaxycine-vn-dat-ve-guardians-of-the-galaxy-vol3_gp03.jpg',	'Trong phần phim thứ 3 về Vệ Binh Dải Ngân Hà, biệt đội mà chúng ta từng biết sẽ có một vài sự thay đổi. Peter Quill vẫn đang chìm đắm trong nỗi đau mất đi Gamora nhưng vẫn phải làm tròn trách nhiệm tập hợp cả đội để bảo vệ toàn vũ trụ. Họ phải đối mặt với một nhiệm vụ cam go và nếu như thất bại',	'2022-08-06',	5,	1,	0,	1),
(9,	'CON NHÓT MÓT CHỒNG',	'https://www.youtube.com/watch?v=9E87PRS437g',	'https://movienew.cybersoft.edu.vn/hinhanh/con-nhot-mot-chong_gp03.jpg',	'Lấy cảm hứng từ web drama Chuyện Xóm Tui, phiên bản điện ảnh sẽ mang một màu sắc hoàn toàn khác: hài hước hơn, gần gũi và nhiều cảm xúc hơn. Bộ phim là câu chuyện của Nhót ',	'2021-03-05',	4,	0,	0,	1),
(10,	'THE LITTLE MERMAID',	'https://www.youtube.com/watch?v=LEkhKtxFIE8&t=1039s',	'https://m.media-amazon.com/images/I/81lo95a3KsL._AC_UF1000,1000_QL80_.jpg',	'“Nàng Tiên Cá” là câu chuyện được yêu thích về Ariel - một nàng tiên cá trẻ xinh đẹp và mạnh mẽ với khát khao phiêu lưu. Ariel là con gái út của Vua Triton và cũng là người ngang ngạnh nhất, nàng khao khát khám phá về thế giới bên kia đại dương. Trong một lần ghé thăm đất liền, nàng đã phải lòng Hoàng tử Eric bảnh bao. Trong khi tiên cá bị cấm tiếp xúc với con người, Ariel đã làm theo trái tim mình',	'2023-02-07',	5,	1,	0,	1),
(11,	'Người Nhện: Du Hành Vũ Trụ Nhện',	'https://www.youtube.com/watch?v=LEkhKtxFIE8&t=1039s',	'https://starlight.vn/Areas/Admin/Content/Fileuploads/images/POSTER/ng-nhen.jpg',	'Sau khi gặp lại Gwen Stacy, chàng Spider-Man thân thiện đến từ Brooklyn phải du hành qua đa vũ trụ và gặp một nhóm Người Nhện chịu trách nhiệm bảo vệ các thế giới song song.',	'2023-02-04',	5,	1,	0,	1),
(12,	'Quỷ Quyệt: Cửa Đỏ Vô Định',	'https://www.youtube.com/watch?v=LEkhKtxFIE8&t=1039s',	'https://cinema.momocdn.net/img/11531170932584132-faafq0NouR3wSemwc77slLEJHId.jpg',	'Để đưa những con quỷ của họ xuống địa ngục một lần và mãi mãi, Josh Lambert và người bạn đại học bằng tuổi Dalton Lambert phải đi sâu vào The Further hơn bao giờ hết, đối mặt với quá khứ tăm tối của gia đình họ và một loạt những kinh hoàng mới và khủng khiếp hơn nữa ẩn sau cánh cửa màu đỏ.',	'2021-03-05',	4,	0,	0,	1),
(13,	'VÂY HÃM: KHÔNG LỐI THOÁT',	'https://www.youtube.com/watch?v=LEkhKtxFIE8&t=1039s',	'https://m.media-amazon.com/images/I/71Wv4ZNXWQL._AC_UF894,1000_QL80_.jpg',	'Quái vật cơ bắp Seok-do (Ma Dong Seok) dẫn đầu đội hình sự truy lùng đường dây buôn chất cấm của thiếu gia Joo Seong Cheol. Cuộc truy đuổi càng thêm gay cấn khi cú đấm công lý \\\"chú Ma\\\" chạm trán thanh kiếm lừng lẫy chốn giang hồ Nhật Bản.',	'2022-04-02',	5,	1,	0,	1),
(14,	'Transformers: Quái Thú Trỗi Dậy',	'https://www.youtube.com/watch?v=2QKg5SZ_35I',	'https://popcornusa.s3.amazonaws.com/gallery/1546642068-uri-the-.jpg',	'Câu chuyện gốc của Optimus Prime và cách anh ấy trở thành thủ lĩnh của Autobots, đồng thời giới thiệu Maximals, Predacons và Terrorcons.',	'2022-04-06',	5,	1,	0,	1);

DROP TABLE IF EXISTS `seat`;
CREATE TABLE `seat` (
  `seat_id` int NOT NULL AUTO_INCREMENT,
  `seat_name` varchar(255) NOT NULL,
  `seat_type` varchar(255) NOT NULL,
  `cinema_id` int NOT NULL,
  `is_reserved` bit(1) NOT NULL,
  `email_reserved` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`seat_id`),
  KEY `cinema_id` (`cinema_id`),
  CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`cinema_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `seat` (`seat_id`, `seat_name`, `seat_type`, `cinema_id`, `is_reserved`, `email_reserved`) VALUES
(1,	'1',	'normal',	1,	CONV('1', 2, 10) + 0,	'giahuy4@gmail.com'),
(2,	'2',	'normal',	1,	CONV('1', 2, 10) + 0,	'giahuy4@gmail.com'),
(3,	'3',	'normal',	1,	CONV('1', 2, 10) + 0,	'giahuy4@gmail.com'),
(4,	'4',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(5,	'5',	'normal',	1,	CONV('1', 2, 10) + 0,	'user3@gmail.com'),
(6,	'6',	'normal',	1,	CONV('1', 2, 10) + 0,	'user3@gmail.com'),
(7,	'7',	'normal',	1,	CONV('1', 2, 10) + 0,	'user3@gmail.com'),
(8,	'8',	'normal',	1,	CONV('1', 2, 10) + 0,	'user3@gmail.com'),
(9,	'9',	'normal',	1,	CONV('1', 2, 10) + 0,	'user3@gmail.com'),
(10,	'10',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(11,	'11',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(12,	'12',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(13,	'13',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(14,	'14',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(15,	'15',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(16,	'16',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(17,	'17',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(18,	'18',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(19,	'19',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(20,	'20',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(21,	'21',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(22,	'22',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(23,	'23',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(24,	'24',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(25,	'25',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(26,	'26',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(27,	'27',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(28,	'28',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(29,	'29',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(30,	'30',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(31,	'31',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(32,	'32',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(33,	'33',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(34,	'34',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(35,	'35',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(36,	'36',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(37,	'37',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(38,	'38',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(39,	'39',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(40,	'40',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(41,	'41',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(42,	'42',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(43,	'43',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(44,	'44',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(45,	'45',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(46,	'46',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(47,	'47',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(48,	'48',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(49,	'49',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(50,	'50',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(51,	'51',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(52,	'52',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(53,	'53',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(54,	'54',	'normal',	1,	CONV('1', 2, 10) + 0,	'user3@gmail.com'),
(55,	'55',	'normal',	1,	CONV('1', 2, 10) + 0,	'giahuy4@gmail.com'),
(56,	'56',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(57,	'57',	'normal',	1,	CONV('1', 2, 10) + 0,	'user3@gmail.com'),
(58,	'58',	'normal',	1,	CONV('1', 2, 10) + 0,	'giahuy5@gmail.com'),
(59,	'59',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(60,	'60',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(61,	'61',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(62,	'62',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(63,	'63',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(64,	'64',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(65,	'65',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(66,	'66',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(67,	'67',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(68,	'68',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(69,	'69',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(70,	'70',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(71,	'71',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(72,	'72',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(73,	'73',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(74,	'74',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(75,	'75',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(76,	'76',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(77,	'77',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(78,	'78',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(79,	'79',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(80,	'80',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(81,	'81',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(82,	'82',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(83,	'83',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(84,	'84',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(85,	'85',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(86,	'86',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(87,	'87',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(88,	'88',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(89,	'89',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(90,	'90',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(91,	'91',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(92,	'92',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(93,	'93',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(94,	'94',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(95,	'95',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(96,	'96',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(97,	'97',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(98,	'98',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(99,	'99',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(100,	'100',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(101,	'101',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(102,	'102',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(103,	'103',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(104,	'104',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(105,	'105',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(106,	'106',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(107,	'107',	'normal',	1,	CONV('1', 2, 10) + 0,	'giahuy4@gmail.com'),
(108,	'108',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(109,	'109',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(110,	'110',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(111,	'111',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(112,	'112',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(113,	'113',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(114,	'114',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(115,	'115',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(116,	'116',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(117,	'117',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(118,	'118',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(119,	'119',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(120,	'120',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(121,	'121',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(122,	'122',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(123,	'123',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(124,	'124',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(125,	'125',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(126,	'126',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(127,	'127',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(128,	'128',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(129,	'129',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(130,	'130',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(131,	'131',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(132,	'132',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(133,	'133',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(134,	'134',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(135,	'135',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(136,	'136',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(137,	'137',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(138,	'138',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(139,	'139',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(140,	'140',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(141,	'141',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(142,	'142',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(143,	'143',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(144,	'144',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(145,	'145',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(146,	'146',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(147,	'147',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(148,	'148',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(149,	'149',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(150,	'150',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(151,	'151',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(152,	'152',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(153,	'153',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(154,	'154',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(155,	'155',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(156,	'156',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(157,	'157',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(158,	'158',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(159,	'159',	'normal',	1,	CONV('1', 2, 10) + 0,	NULL),
(160,	'160',	'normal',	1,	CONV('0', 2, 10) + 0,	NULL),
(161,	'1',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(162,	'2',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(163,	'3',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(164,	'4',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(165,	'5',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(166,	'6',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(167,	'7',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(168,	'8',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(169,	'9',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(170,	'10',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(171,	'11',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(172,	'12',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(173,	'13',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(174,	'14',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(175,	'15',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(176,	'16',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(177,	'17',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(178,	'18',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(179,	'19',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(180,	'20',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(181,	'21',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(182,	'22',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(183,	'23',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(184,	'24',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(185,	'25',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(186,	'26',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(187,	'27',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(188,	'28',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(189,	'29',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(190,	'30',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(191,	'31',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(192,	'32',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(193,	'33',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(194,	'34',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(195,	'35',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(196,	'36',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(197,	'37',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(198,	'38',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(199,	'39',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(200,	'40',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(201,	'41',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(202,	'42',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(203,	'43',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(204,	'44',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(205,	'45',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(206,	'46',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(207,	'47',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(208,	'48',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(209,	'49',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(210,	'50',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(211,	'51',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(212,	'52',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(213,	'53',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(214,	'54',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(215,	'55',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(216,	'56',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(217,	'57',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(218,	'58',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(219,	'59',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(220,	'60',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(221,	'61',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(222,	'62',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(223,	'63',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(224,	'64',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(225,	'65',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(226,	'66',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(227,	'67',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(228,	'68',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(229,	'69',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(230,	'70',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(231,	'71',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(232,	'72',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(233,	'73',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(234,	'74',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(235,	'75',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(236,	'76',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(237,	'77',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(238,	'78',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(239,	'79',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(240,	'80',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(241,	'81',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(242,	'82',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(243,	'83',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(244,	'84',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(245,	'85',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(246,	'86',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(247,	'87',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(248,	'88',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(249,	'89',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(250,	'90',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(251,	'91',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(252,	'92',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(253,	'93',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(254,	'94',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(255,	'95',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(256,	'96',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(257,	'97',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(258,	'98',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(259,	'99',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(260,	'100',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(261,	'101',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(262,	'102',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(263,	'103',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(264,	'104',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(265,	'105',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(266,	'106',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(267,	'107',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(268,	'108',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(269,	'109',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(270,	'110',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(271,	'111',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(272,	'112',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(273,	'113',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(274,	'114',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(275,	'115',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(276,	'116',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(277,	'117',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(278,	'118',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(279,	'119',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(280,	'120',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(281,	'121',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(282,	'122',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(283,	'123',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(284,	'124',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(285,	'125',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(286,	'126',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(287,	'127',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(288,	'128',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(289,	'129',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(290,	'130',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(291,	'131',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(292,	'132',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(293,	'133',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(294,	'134',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(295,	'135',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(296,	'136',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(297,	'137',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(298,	'138',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(299,	'139',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(300,	'140',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(301,	'141',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(302,	'142',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(303,	'143',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(304,	'144',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(305,	'145',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(306,	'146',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(307,	'147',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(308,	'148',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(309,	'149',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(310,	'150',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(311,	'151',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(312,	'152',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(313,	'153',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(314,	'154',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(315,	'155',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(316,	'156',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(317,	'157',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(318,	'158',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(319,	'159',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL),
(320,	'160',	'normal',	2,	CONV('0', 2, 10) + 0,	NULL);

DROP TABLE IF EXISTS `showtimes`;
CREATE TABLE `showtimes` (
  `showtimes_id` int NOT NULL AUTO_INCREMENT,
  `cinema_id` int NOT NULL,
  `film_id` int NOT NULL,
  `showing_times` varchar(100) DEFAULT NULL,
  `ticket_price` varchar(100) NOT NULL,
  PRIMARY KEY (`showtimes_id`),
  KEY `cinema_id` (`cinema_id`),
  KEY `film_id` (`film_id`),
  CONSTRAINT `showtimes_ibfk_1` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`cinema_id`),
  CONSTRAINT `showtimes_ibfk_2` FOREIGN KEY (`film_id`) REFERENCES `film` (`film_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `showtimes` (`showtimes_id`, `cinema_id`, `film_id`, `showing_times`, `ticket_price`) VALUES
(1,	1,	1,	'2022-01-01 10:00:00',	'75000'),
(2,	2,	2,	'2022-02-01 18:00:00',	'105000'),
(3,	1,	1,	'2022-02-02 00:00:00',	'120000'),
(4,	4,	1,	'2022-02-02 00:00:00',	'55000'),
(6,	1,	1,	'2022-02-02',	'60000'),
(7,	1,	1,	'2022-02-02',	'45000'),
(8,	2,	1,	'2022-02-02',	'50000'),
(9,	5,	1,	'2022-02-02 10:30:00',	'50000'),
(10,	2,	3,	'2022-02-02 10:30:00',	'50000'),
(11,	1,	4,	'2022-02-02 10:30:00',	'50000'),
(12,	3,	1,	'2022-02-02 10:30:00',	'75000'),
(13,	2,	1,	'2022-02-02 10:30:00',	'50000'),
(14,	2,	1,	'2022-02-02 10:30:00',	'50000'),
(15,	2,	2,	'2023-02-02 10:30:00',	'50000');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `user_type` varchar(50) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `users` (`email`, `password`, `fullname`, `phoneNumber`, `avatar`, `user_type`) VALUES
('abc@gmail.com',	'$2b$10$8DD.Zj.E3GDw2GKH2vx46eHmPv2TSWFiJ1Fx8d4u3IdLj0bxmoAOG',	'Haha',	'7654',	'123',	'normal'),
('abc2d@gmail.com',	'$2b$10$abWuU/0AQLSOCdK3OcNNNeMhLdxUjIxxOXOGFOgByVowrNp.8mB06',	'Haha',	'7654',	'123',	'admin'),
('abcd@gmail.com',	'$2b$10$AsJu4nF1bvrev63VpEZ.G.NillDEEOBHpIroM2CPtfv3tYn8m3lNu',	'hải lí',	'7654',	'12344444',	'admin'),
('giacat2783@gmail.com',	'$2b$10$tjcczC3EKm3/p6l8DmKeC.pNJLLymwJfVnkiquR0QRYUk.rHBVBPi',	'Giacat',	'1234',	'1234',	'normal'),
('giahuy4@gmail.com',	'$2b$10$q5DiwfuKitBb5GX/3Rx9.etrVeNM0xQAz/upnW0UWaDCLff6fWjIC',	'Phạm Gia huy',	'0987654321',	'1234',	'normal'),
('giahuy5@gmail.com',	'$2b$10$jRA4YCgC3DgLSdGsVlwhX.P9JFbmJrg7NYGTBfjRSBWkZvVAF1gmG',	'Gia huy',	'0987654321',	'1234',	'normal'),
('giahuy8@gmail.com',	'$2b$10$H/XCktnLUxrtYQXoZme1yOIrX0iIQnmN8EfXpl1J/TDcJkKv4dXP.',	'Phạm Gia huy',	'0987654321',	'1234',	'normal'),
('huy3@gmail.com',	'$2b$10$BffCpuKkw2DqLSrPelzLe.pmeXVyTKG3AD82xRdFULJiIw6Bh.auu',	'Gia huy',	'0987654321',	'1234',	'normal'),
('newUser@gmail.com',	'$2b$10$62oBLgs49uCFx2aBDqvRwesOspi6q9kVRZd9tSjqlHD1IWLZH4SuG',	'Tài',	'7654',	'123',	'admin'),
('no@gmail.com',	'$2b$10$by2wfdu.KVSekxNN/bhVc.YDXW6CNhgzFfm8UixiAWcD7f7NwzE8S',	'Tài',	'7654',	'123',	'admin'),
('user2@gmail.com',	'$2b$10$ZT0oPH.fd3cUeZ9Bk0DHz.mACl85/VBd7URzXSQZXcljwUiKVyBUC',	'Jane Smith',	'987654321',	'https://cdn-icons-png.flaticon.com/512/149/149071.png',	'admin'),
('user3@gmail.com',	'$2b$10$ZT0oPH.fd3cUeZ9Bk0DHz.mACl85/VBd7URzXSQZXcljwUiKVyBUC',	'Huy ',	'1234',	'1234',	'normal'),
('user4@gmail.com',	'$2b$10$nejEfCZw/RZ/2F0i82mpcOl44q9SBHEuWQ4MDC.nu1.310IUg2lNy',	'Huy Bốn',	'1234',	'1234',	'normal'),
('user5@gmail.com',	'$2b$10$cGInnicSlrMcKkvJqCdFautyvKSuoTRDEO6kygoGE67IpQvlDlT6W',	'Huy 5',	'1234',	'1234',	'normal');

-- 2023-06-14 04:33:15
