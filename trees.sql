-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2021 at 03:56 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trees`
--

-- --------------------------------------------------------

--
-- Table structure for table `donhang`
--

CREATE TABLE `donhang` (
  `so` int(11) NOT NULL,
  `ma` int(11) NOT NULL,
  `ngaydat` date DEFAULT NULL,
  `trigia` varchar(30) NOT NULL,
  `ngaygiao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `donhang`
--

INSERT INTO `donhang` (`so`, `ma`, `ngaydat`, `trigia`, `ngaygiao`) VALUES
(1, 2, '2021-01-01', '150.000', NULL),
(2, 1, '2021-01-02', '95.000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ncc`
--

CREATE TABLE `ncc` (
  `id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `tenNCC` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `diachi` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `dienthoai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ncc`
--

INSERT INTO `ncc` (`id`, `tenNCC`, `diachi`, `dienthoai`) VALUES
('NCC1', 'ABC', 'adbvsf', 1234333);

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `idSP` int(11) NOT NULL,
  `idPL` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `tenSP` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`idSP`, `idPL`, `tenSP`) VALUES
(1, '1', 'Cây cảnh để bàn'),
(2, '1', 'Cây thủy sinh'),
(3, '1', 'Cây chậu treo'),
(4, '1', 'Cây Bonsai'),
(9, '2', 'Chậu men sứ'),
(10, '2', 'Chậu thủy tinh'),
(11, '2', 'Chậu nhựa ABS'),
(12, '2', 'Chậu đất nung'),
(13, '2', 'Chậu Composite'),
(14, '3', 'Đất trồng'),
(15, '3', 'Phân bón'),
(16, '3', 'Dụng cụ làm vườn'),
(17, '3', 'Vật tư trang trí');

-- --------------------------------------------------------

--
-- Table structure for table `theloai`
--

CREATE TABLE `theloai` (
  `idPL` int(11) NOT NULL,
  `tenPL` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `theloai`
--

INSERT INTO `theloai` (`idPL`, `tenPL`) VALUES
(1, 'Cây cảnh'),
(2, 'Chậu cảnh'),
(3, 'Phụ kiện cây cảnh');

-- --------------------------------------------------------

--
-- Table structure for table `thongtinsp`
--

CREATE TABLE `thongtinsp` (
  `idC` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `idSP` int(11) NOT NULL,
  `idPL` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `tenCC` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `mota` text COLLATE utf8_unicode_ci NOT NULL,
  `giaban` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `anh` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `thongtinsp`
--

INSERT INTO `thongtinsp` (`idC`, `idSP`, `idPL`, `tenCC`, `mota`, `giaban`, `anh`) VALUES
('DB_01', 1, '1', 'Trầu Bà Sữa', 'Tên thường gọi: Cây Trầu bà sữa chậu treo, cây Trầu bà cẩm thạch chậu treo…\r\n\r\nTên tiếng Anh: Australian native monstera\r\n\r\nTên khoa học: Epipremnum aureum ‘Marble Queen’\r\n\r\nHọ thực vật: Araceae (họ Ráy)\r\n\r\nChiều cao: 20-30 cm (cả chậu)\r\n\r\nCông dụng: Cây trầu bà sữa chậu treo thường  dùng để trang trí quán cafe, tiểu cảnh giếng trời, giàn treo sân thượng, trang trí văn phòng làm việc,… Màu lá cây trầu bà sữa trông lạ mắt, dáng cây rũ rất phù hợp chậu treo.', '150,000', 'https://vuoncayviet.com/data/items/868/trau-ba-sua-3.jpg'),
('DB_02', 1, '1', 'Cây Vạn Lộc', 'Tên thường gọi: Vạn lộc\r\nTên khác: Thiên Phú\r\nTên tiếng Anh: Aglaonema ‘lady valentine’\r\nTên khoa học: Aglaonema rotundum pink\r\nHọ: Araceae (Ráy)\r\nXuất xứ: Thái Lan, Indonesia\r\nĐặc điểm\r\n\r\nLà cây thân thảo, có lá màu hồng đậm khi già, lá non màu hồng nhạt, có rễ chùm, dễ sống và chăm sóc.\r\nHoa màu trắng, có rễ trùm nên rất dễ sống và chăm sóc.\r\nÝ nghĩa phong thuỷ\r\n\r\nMang lại phú quý, tiền tài. Màu đỏ của cây thể hiện sự thịnh vượng, tốt lành, may mắn và phát lộc\r\nCây hợp với người mệnh Hoả hoặc Thổ, giúp mang đến tài lộc và may mắn\r\nCông dụng\r\n\r\nThanh lọc không khí, hấp thụ các chất hữu cơ gây bệnh\r\nPhù hợp để bàn làm việc, bàn uống nước, trang trí quán cà phê\r\nLàm quà tặng, quà trang trí, gửi gắm lời chúc tốt đẹp đến người nhận', '200,000', 'https://vuoncayviet.com/data/items/949/cay-van-loc-vuoncayviet.jpg'),
('DB_03', 1, '1', 'Cây Tùng Hạnh Phúc', 'Giới thiệu cây Tùng Hạnh Phúc\r\n\r\nTên khác: May Mắn Tài Lộc, Cây Lâm Lộc May Mắn\r\nXuất xứ: Nhật Bản\r\nĐặc điểm\r\n\r\nCây kích thước nhỏ, cao chừng 15-20cm, đường kính 8cm\r\nLá cây khá giống với lá cây tùng la hán, nhỏ, nhọn 2 đầu màu xanh thẫm\r\nÝ nghĩa phong thủy\r\n\r\nMang ý nghĩa phong thuỷ tốt: cầu chúc mọi điềm lành trong cuộc sống.\r\nCông dụng\r\n\r\nPhù hợp chưng trong nhà, văn phòng, bàn làm việc hoặc trên giá, trên kệ, làm quà tặng\r\nCách trồng\r\n\r\nCó thể sống trong môi trường khắc nghiệt, dễ chăm sóc, không cần phải tưới hàng ngày\r\nChịu úng hạn tốt, sức sống bền bỉ, khỏe khoắn và phát triển đều đặn, thậm chí trong môi trường thiếu ánh sáng, môi trường máy lạnh.', '160,000', 'https://vuoncayviet.com/data/items/1036/cay-tung-hanh-phuc.JPG'),
('DB_04', 1, '1', 'Cây Trường Sinh', 'Tên gọi khác: Diệp Sinh Căn, Thiên Cảnh Tạp Giao\r\nTên khoa học: Peperomia obtusifolia\r\nTên tiếng Anh: Baby Rubber Plant\r\nHọ: Crassulaceae (thuốc Bỏng)\r\nXuất xứ: Florida, Mexico và vùng Caribbean\r\nĐặc điểm\r\n\r\nThân thảo, nhẵn bóng, tròn, mọng nước, trồng chậu cao khoảng 10-60cm\r\nLá có màu xanh lục đậm, bóng, với hình tròn xinh viên mãn.\r\nLá mọc từ gốc hoặc thân, dạng đối, mọc khỏe khoắn, xum xuê\r\nHoa màu trắng, dạng chuỗi, nở kéo dài từ tháng 12 đến tháng 4 năm sau\r\nÝ nghĩa phong thủy\r\n\r\nĐúng như tên gọi, chỉ sự trường tồn, mãi mãi, ngụ ý về một mối quan hệ bền lâu\r\nTượng trưng cho tài lộc, may mắn được vững bền\r\nGiúp gia chủ thêm vượng khí, sức khỏe dồi dào\r\nCây phù hợp với người mệnh Mộc, mang đến niềm tin, hy vọng và sự hợp tác lâu dài, bền vững.\r\nCông dụng\r\n\r\nTrồng chậu trang trí trong nhà, cơ quan, đặt bàn làm việc, tạo không gian tươi mát, dễ chịu\r\nCó thể hút bớt khí độc và giảm ảnh hưởng xấu từ tia tử ngoại, tia bức xạ của đồ điện tử\r\nThích hợp làm quà tặng trong lễ mừng thọ, mừng sinh nhật…', '190,000', 'https://vuoncayviet.com/data/items/941/cay-truong-sinh-de-ban-vuoncayviet.com.jpg'),
('DB_05', 2, '1', 'Cây Vạn Lộc thuỷ sinh', 'Tên thường gọi: Vạn lộc\r\nTên khác: Thiên Phú\r\nTên khoa học: Aglaonema rotundum pink\r\nHọ: Araceae\r\nXuất xứ: Thái Lan, Indonesia\r\nĐặc điểm\r\n\r\nLà cây thân thảo, có lá màu hồng đậm khi già, lá non màu hồng nhạt, có rễ chùm, dễ sống và chăm sóc.\r\nHoa màu trắng, có rễ trùm nên rất dễ sống và chăm sóc.\r\nÝ nghĩa phong thuỷ\r\n\r\nMang đến tài lộc và may mắn\r\nCây vốn hợp mệnh Hoả, nhưng do trồng thuỷ sinh nên mệnh này hạn chế trồng.\r\nCông dụng\r\n\r\nThanh lọc không khí, hấp thụ các chất hữu cơ gây bệnh\r\nPhù hợp để bàn làm việc, bàn uống nước, trang trí quán cà phê', '200,000', 'https://vuoncayviet.com/data/items/953/cay-van-loc-ts012-vcv.jpg'),
('DB_06', 2, '1', 'Cây Trầu Bà Đế Vương Đỏ thuỷ sinh', 'Tên thông thường: Trầu Bà Đế Vương Đỏ\r\nTên khoa học: Philodendron Imperial Red\r\nHọ: Araceae (Ráy)\r\nChiều cao: 30 – 50cm tính cả chậu\r\nĐặc điểm\r\n\r\nCây thân thảo, lá lớn, thuôn nhọn đầu, tim sâu ở gốc, lá non màu đỏ tía, lá già màu lục tía, cuống dài màu đỏ tím đậm, gốc có bẹ ôm thân. Cây có nhiều rễ khí sinh.\r\nCó hoa, cụm hoa dạng mo nhỏ trên cuống.\r\nCây được trồng từ 5-6 tháng sẽ cho chiều cao trung bình 30-35 cm, từ 6-8 lá \r\nÝ nghĩa phong thuỷ\r\n\r\nCây có vẻ đẹp sang trọng thể hiện tinh thần đế vương, quyền uy... thích hợp cho người quản lý, lãnh đạo trong một tổ chức.\r\nTên cây cũng thể hiện ý chí không ngừng nỗ lực để hướng tới vị trí cao hơn.\r\nCây còn mang lại nhiều tài lộc và may mắn cho gia chủ, giúp tránh xa những điều không may, thị phi trong cuộc sống hàng ngày.\r\nCây vốn phù hợp với người mệnh Hoả do sắc lá, thân đỏ rực, nhưng vì trồng thuỷ sinh nên mệnh này hạn chế. \r\nCông dụng\r\n\r\nTrầu Bà Đế Vương Đỏ với màu lá đậm ấn tượng, là cây cảnh để bàn hoàn hảo cho việc tạo ra cảm giác tươi mát và bắt mắt.\r\nLà nhà vô địch trong các cây nội thất hấp thụ khí độc, là một chiếc máy điều hoà mini thanh lọc không khí cho không gian thêm trong lành và mát mẻ.\r\nCây phù hợp trang trí quầy kệ, bàn làm việc, bàn khách, bàn trà, kệ cửa sổ…mang lại sự thư thái và khích lệ tinh thần làm việc.', '150,000', 'https://vuoncayviet.com/data/items/952/cay-trau-ba-de-vuong-do-ts010.jpg'),
('DB_07', 2, '1', 'Cây Trầu Bà Vàng thuỷ sinh', 'Giới thiệu cây Trầu Bà Vàng\r\n\r\nTên khác: Trầu Bà Thái\r\nTên khoa học: Philodendron erubescens ‘gold’\r\nHọ: Araceae (họ ráy)\r\nĐặc điểm\r\n\r\nLà cây thân thảo, có rễ khí sinh, thân tròn, mọng nước.\r\nLá đơn, màu xanh vàng sáng đẹp và cuống màu hồng nhạt. Lá cây có dạng thuôn dài nhọn ở đỉnh, hình tim ở gốc.\r\nCây có hoa, quả và hạt.\r\nÝ nghĩa phong thủy\r\n\r\nMang ý nghĩa về sự thành đạt, thăng tiến trong công danh sự nghiệp\r\nLời chúc mọi sự bình an\r\nCông dụng\r\n\r\nThường dùng để trang trí văn phòng, bàn làm việc, cây có thể trồng chậu đứng, chậu đất để bàn, chậu treo hay trồng trong chậu thủy tinh.\r\nLàm cây trồng viền, cây trồng nền cảnh quan dưới các chân cầu. Hoặc làm tường cây.\r\nThanh lọc không khí, loại bỏ các khí độc hại và các chất ô nhiễm.\r\nLàm quà tặng giàu ý nghĩa cho bạn bè, người quen', '200,000', 'https://vuoncayviet.com/data/items/1102/cay-trau-ba-vang-thuy-sinh.jpg'),
('DB_08', 2, '1', 'Cây Trầu Bà Cẩm Thạch thuỷ sinh', 'Giới thiệu cây Trầu Bà Cẩm Thạch thuỷ sinh\r\n\r\nTên khác: Trầu bà sữa\r\nTên tiếng Anh: Australian native monstera\r\nTên khoa học: Epipremnum aureum ‘Marble Queen’\r\nHọ: Ráy (Araceae)\r\nXuất xứ: miền Bắc Australia, Malaisia\r\nĐặc điểm\r\n\r\nCây thân thảo, sống lâu năm, dạng cây leo\r\nLá hình trái tim, nhiều vệt trắng như sữa trên nền lá\r\nCuống lá dài màu trắng, gân chính của lá rõ ràng, mép nguyên.\r\nThân cây mềm mại với nhiều rễ phụ rũ xuống\r\nÝ nghĩa phong thủy\r\n\r\nTượng trưng cho may mắn, thành đạt và bình an.\r\nCông dụng\r\n\r\nHút khí độc, làm không khí trong lành\r\nGiảm bức xạ máy tính\r\nTrang trí quán cafe, tiểu cảnh giếng trời, giàn treo sân thượng, trang trí văn phòng làm việc,…', '220,000', 'https://vuoncayviet.com/data/items/1012/trau-ba-cam-thach-1.jpg'),
('DB_09', 3, '1', 'Cây Lan Hạt Dưa Cẩm Thạch', 'Tên thường gọi: Cây Lan Hạt Dưa Cẩm Thạch, cây Lan Dollar Cẩm Thạch\r\nTên khoa học: Dischidia oiantha Schltr\r\nHọ thực vật: Asclepiadaceae (họ Thiên lý)\r\nChiều cao cây: 20 – 30cm\r\nĐặc điểm\r\n\r\nThuộc cây thân leo, sống phụ thuộc vào nơi bám trụ, mọc thành bụi, thân mảnh\r\nLá có hình bầu dục giống như đồng tiền, mép nguyên, gân chính nổi, cong và mọc đối nhau theo từng cặp. Lá dày, mọng nước, mặt lá nhẵn với viền màu vàng và lòng màu xanh cẩm thạch\r\nÝ nghĩa và công dụng\r\n\r\nTượng trưng cho sức mạnh, ý chí và sự quyết tâm\r\nMang lại tiền tài, may mắn cho gia chủ\r\nTrồng chậu treo ban công, trang trí cho không gian thêm sinh động', '85,000', 'https://vuoncayviet.com/data/items/892/lan-hat-dua-cam-thach.jpg'),
('DB_10', 3, '', 'Cây Hải Đường', 'Tên thường gọi: cây hoa Hải Đường\r\nTên gọi khác: Hải Đường đỏ, hay cây Hải Đường\r\nTên khoa học: Malus spectabilis Borkh\r\nHọ:  Theaceae\r\nNguồn gốc xuất xứ: tại Trung Quốc\r\nĐặc điểm\r\nThân: thuộc cây thân bụi cao 3 – 4m, cành non có màu nâu nhạt và nhẵn.\r\nLá: có xuống ngắn, không lông phiến lá to thuôn hình bầu dục, dày màu nâu ở mặt trên, xanh ở mặt dưới, mép lá có răng cưa nhọn, gân chính nổi rõ.\r\nHoa : có màu đỏ, cánh hoa gồm 8 – 12 cánh hình trứng rộng đỉnh tròn.\r\nQuả: hình cầu, nhẵn khí thành 3 rãnh 3 ô.\r\nÝ nghĩa phong thủy\r\nLà loại hoa quý, không chỉ đẹp với màu sắc thắm đỏ rực rỡ vào độ xuân sanng mà hoa hải đường còn giàu ý nghĩa ngay từ tên gọi. Theo tiếng Hán, chữ đường còn hàm ý nhà ngôi nhà lớn vì vậy cây hoa hải đường là loài hoa phong thủy tượng trưng cho sự phú quý viên mãn, cuộc sống sum vầy, anh em hòa hợp, tình bạn keo sơn gắn bó.\r\nHải đường còn tượng trưng cho mùa xuân nên còn mang đến may mắn, làm ăn tấn tới.\r\nCông dụng\r\nLàm quà tặng nhân những dịp lễ tết quan trọng đặc biệt là năm mới hoặc mừng tân gia.  Người xưa quan niệm tặng tranh hoặc chậu hoa hải đường là lễ vật quý chúc gia chủ đầy ắp phú quý vinh hoa, thăng quan, tiến chức.\r\nNgười ta còn thường mua một chậu hoa hải đường trưng phòng khách, phòng thờ, trước cửa nhà hoặc cắm lọ lục bình trên bàn thờ để đón xuân sang với mong muốn một năm đỏ đắn, sung túc.\r\nCây hoa hải đường còn được trồng vườn, trồng bồn trước nhà tô điểm cho ngôi nhà thêm sinh động.', '85,000', 'https://vuoncayviet.com/data/items/1218/cay-hoa-hai-duong.jpg'),
('DB_11', 3, '1', 'Cây Lan Tim', 'Tên thường gọi: Lan Tim, Khúc Thủy\r\nHọ: Asclepiadaceae (họ Thiên lý)\r\nXuất xứ: Thái Lan\r\nĐặc điểm\r\n\r\nLà loại dây leo xanh quanh năm, sống lâu và bền bỉ.\r\nLà cây thân thảo, mền mại, phân nhiều mánh mọc từ gốc rũ xuống.\r\nLá hình trái tim đẹp, mọc đối xứng, màu xanh đậm, bóng nhắn đầu lá \r\nCông dụng\r\n\r\nDùng trang trí nhà hàng, quán cafe, ban công, sân thượng\r\nÝ nghĩa phong thuỷ\r\n\r\nCây đem đến cho bạn cảm giác ấm áp, yên bình. Là món quà ý nghĩa dành tặng cho người thương yêu, là quà tặng thể hiện tình cảm đôi lứa.', '85,000', 'https://vuoncayviet.com/data/items/919/cay-lan-tim.jpg'),
('DB_12', 3, '1', 'Cây Thài Lài Sọc treo', 'Tên thường gọi: Cây Thài Lài Sọc\r\nTên khoa học: Tradescantia zebrina\r\nHọ thực vật: Commelinaceae (họ thài lài)\r\nXuất xứ: Mexico\r\nĐặc điểm\r\nThài Lài là loại cây có thân lá mọng nước, cao khoảng 10 đến 30 cm.\r\nLá dài, hơi nhọn ở đầu, màu lục xám điểm các đốm màu đỏ hoặc tím. \r\nHoa có mày hồng nhạt, cây nở hoa liên tục nhưng chủ yếu vào buổi sáng lúc có ánh sáng nhẹ, ấm áp.\r\nCông dụng\r\nThường được dùng trang trí giàn leo, ban công, sân thượng, cửa sổ… tô điểm cho không gian một màu sắc tía lạ mắt và ấm cúng.\r\nCây thài lài sọc cũng được trồng thảm che phủ nền rất đẹp.', '115,000', 'https://vuoncayviet.com/data/items/1217/thai-lai-soc-treo.png'),
('DB_13', 4, '1', 'Cây Nhất Chi Mai', 'Tên khác: Mai trắng (Bạch mai, Hàn mai, Lưỡng nhị mai, nhị độ mai)\r\nTen khoa hojcL Prunus mume Sieb. & Zucc\r\nHọ: hoa hồng (Rosaceae)\r\nĐặc điểm\r\n\r\nCùng họ với đào, anh đào, mơ, mận, là loài mai quý hiếm, chỉ sống ở những nơi có mùa đông và giá lạnh\r\nCây chậm lớn, gốc xù xì, thân đen óng, nụ màu đỏ, khi nở chuyển sang màu trắng với nhiều tầng cánh xếp vào nhau và cũng là lúc đẹp nhất, tàn thì chuyển về màu đỏ\r\nCây không quả, chiết giống khó khăn\r\nÝ nghĩa phong thủy\r\n\r\nMang lại may mắn, hạnh phúc, tài lộc và sức khỏe đến cho mọi người.\r\nBiểu tượng của người quân tử trung tín, tiết tháo, ngoan cường chọc trời khuấy nước\r\nCông dụng\r\n\r\nTrang trí trong nhà, bàn làm việc', '190,000', 'https://vuoncayviet.com/data/items/1048/cay-nhat-chi-mai-1.JPG'),
('DB_14', 4, '1', 'Cây Ngũ Gia Bì bonsai', 'Tên thường gọi: Cây Ngũ Gia Bì, Ngũ Gia Bì Xanh bonsai\r\nTên gọi khác: cây Chân Chim Bảy Lá, cây Sâm Non, cây Lằng\r\nTên khoa học: Scheffera Octophylla\r\nĐặc điểm\r\n\r\nCây có thân nhỏ, vỏ xám, cứng cáp, có thể tạo hình nghệ thuật\r\nMỗi cành nhánh có từ 4-8 lá chụm lại ở cuống, xòe ra như hình chân chim\r\nLá xanh mướt, bóng, đầu thuôn, có mùi thơm dịu nhẹ\r\nÝ nghĩa phong thuỷ\r\n\r\nCây Ngũ Gia Bì Xanh bonsai giúp gắn kết các thành viên được hòa thuận, gia đình thêm êm ấm hơn\r\nLà loại cây có thể giúp người trồng phát triển sự nghiệp vững mạnh, củng cố được tiền bạc, ổn định tài vận\r\nThích hợp dành cho người mệnh Mộc, Hỏa và tuổi Dần\r\nCông dụng\r\n\r\nTrồng trang trí bàn làm việc, quầy thu ngân, kệ sách, kệ tivi rất mát mắt và sinh động\r\nMùi hương dịu nhẹ có thể xua đuổi được muỗi ra khỏi không gian trồng\r\nTrong Đông y, cây Ngũ Gia Bì bonsai có thể được sử dụng làm thuốc trị đau bụng, chống suy nhược thần kinh, mệt mỏi, giúp an thần, tăng trí nhớ, kháng viêm, giảm đau, hạ sốt...', '240,000', 'https://vuoncayviet.com/data/items/1128/ngu-gia-bi-bonsai-vuoncayviet.jpg'),
('DB_15', 4, '1', 'Cây Kim Ngân Củ bonsai', 'Tên gọi khác: Cây Thắt Bím\r\n\r\nTên khoa học: Pachira aquatica\r\n\r\nHọ thực vật: Bombacaceae (Gòn/Gạo)\r\n\r\nXuất xứ: Trung Mỹ và Nam Mỹ.\r\n\r\nĐặc điểm:\r\nCó 1 thân duy nhất, thân to và ngắn tạo thành một khối tròn hình củ. Tạo nên vẻ đồ sộ và phú quý cho cây.\r\nThân cây kim ngân còn non có màu xanh sáng, khi già chuyển sang màu xám trắng. Các thân cây kim ngân thường được đan vào nhau (thắt như bím tóc cô gái) trông rất đẹp mắt.\r\nLá cây kim ngân màu xanh đậm, rộng 20 – 25 cm, trông như chân chim.\r\nNhững bông hoa kim ngân nở từ nụ dài khoảng 35 cm. Chúng thường ẩn dưới những tán lá dày đặc. Những cánh hoa màu kem rũ xuống và rụng đi để khoe những cụm dài 7.5 – 10 cm màu đỏ trên đầu, những nhị hoa trắng.\r\nÝ nghĩa phong thủy:\r\nCây có ý nghĩa là cây tiền, mang đến tài lộc, giàu sang và may mắn đến với gia chủ.\r\nLá của cây thắt bím biểu tượng cho 5 yếu tố ngũ hành :Kim,Mộc,Thủy,Hỏa,Thổ….\r\nCông dụng:\r\nLà cây cảnh để bàn ưa chuộng trên toàn thế giới trong những năm gần đây.\r\nLá cây có tác dụng hút tia điện tử do máy tính,điện thoại phóng ra bên ngoài trong quá trình sử dụng.\r\nThanh lọc không khí,điều hòa và ổn định môi trường xung quanh cho bạn một cảm giác thoải mái,thư giãn nhất.\r\nTăng khả năng tập trung,giúp bạn đạt hiệu quả cao trong công việc.\r\nLà món quà đặc biệt tặng người thân,bạn bè,nhằm chúc nhau may mắn,tiền tài….\r\nThân cây và lá cây có mùi hương có thể xua đuổi được đám muỗi phiền phước trong gia đình bạn.', '9,000,000', 'https://vuoncayviet.com/data/items/1202/kim-ngan-cu-bonsai.jpg'),
('DB_16', 4, '1', 'Cây Da Bonsai', 'Tên gọi khác: Da Si Bonsai, cây Da Nhật\r\nTên khoa học: Ficus microcarpa\r\nHọ thực vật: Moraceae (họ dâu tằm)\r\nĐặc điểm\r\n\r\nThân gỗ nhưng dễ dàng uốn cong tạo hình, màu nâu Lá cây hơi thuôn, dạng e-lip hoặc quả trứng, mép nguyên, mặt trên bóng, màu xanh\r\nChiều cao: 30-60cm (tính cả chậu)\r\nÝ nghĩa phong thủy\r\n\r\nTrồng với mong muốn trừ tà, xua đuổi khí xấu trong nhà\r\nCây hợp với người mệnh Mộc và Hỏa\r\nCông dụng\r\n\r\nĐáp ứng sở thích chơi cây cảnh tạo hình nghệ thuật, cây bonsai mà diện tích không gian ở không quá rộng của nhiều người\r\nThích hợp đặt trang trí nơi bàn phòng khách, bàn họp, bàn làm việc, kệ tủ, giá sách,…', '200,000', 'https://vuoncayviet.com/data/items/994/da-bonsai-3.jpg'),
('DB_17', 9, '2', 'Chậu sứ trụ vuông - CM009', '- Kích thước:  12x12\r\n- Màu sắc:      Trắng, xanh lam\r\n- Chất liệu:      Men sứ\r\n- Kiểu dáng:    Hình trụ vuông', '70,000', 'https://vuoncayviet.com/data/items/978/chau-su-tru-vuong-cm009.jpg'),
('DB_18', 9, '2', 'Chậu sứ trụ tròn vát - CM006', 'Kich thước:   24x29 cm\r\nMàu sắc:       Trắng\r\nChất liệu:      Men sứ, sứ cao cấp\r\nKiểu dáng:    Trụ tròn vát, có viền tròn trên thân', '150,000', 'https://vuoncayviet.com/data/items/967/chau-su-tru-tron-vat-cm002.jpg'),
('DB_19', 9, '2', 'Chậu sứ trụ tròn vân ô vuông - CM008', 'Kich thước: 16x12 cm\r\nMàu sắc:     Trắng\r\nChất liệu:    Sứ cao cấp\r\nKiểu dáng:  Trụ tròn lùn, trên thân có vân ô vuông', '99,000', 'https://vuoncayviet.com/data/items/977/chau-su-tru-tron-van-o-vuong-cm008.jpg'),
('DB_20', 9, '2', 'Chậu sứ trụ cong- CM007', 'Kich thước:  12.5x11 cm\r\nMàu sắc:       Hồng cánh sen\r\nChất liệu:      Men sứ, bán sứ\r\nKiểu dáng:    Hình trụ, hơi cong ở thân', '59,000', 'https://vuoncayviet.com/data/items/976/chau-su-tru-cong-cm007.jpg'),
('DB_21', 10, '2', 'Chậu thủy tinh có giá treo bằng sắt - CT001', 'Chất liệu: thủy tinh borosilicate cao\r\n Quy trình sản phẩm: thổi nhân tạo\r\n Kích thước sản phẩm: Sản phẩm này có nhiều kích cỡ tùy chọn (Bóng thủy tinh đường kính: 8cm, 10cm)\r\n kệ sắt:23cm, 28cm', '55,000', 'https://www.shopnghethuat.com.vn/uploads/images/2018/03/02/15199750968010.jpg'),
('DB_22', 10, '2', 'Chậu thủy tinh trồng cây gắn tường - CT002', 'Đặc trưng:\r\n Sẽ đẹp và bắt mắt hơn nếu bạn cho vào sản phẩm một vài viên sỏi\r\n Có thể dùng làm bình hoa thủy canh, bình tiểu cảnh DIY.\r\n Giúp làm đẹp và thanh lọc ngôi nhà hoặc văn phòng của bạn, một phụ kiện trang trí tuyệt vời cho bạn\r\n Một món quà tuyệt vời để gửi cho bạn bè, người thân và đồng nghiệp của bạn, v.v.\r\n \r\n Mô tả:\r\n Sản phẩm mới 100%, chất lượng cao\r\n \r\n Màu sắc: Trong suốt\r\n \r\n Chất liệu: Kính\r\n \r\n Kích thước: Bán cầu (Đường kính 15cm); Hình lục giác (13 * 13cm); Hình dạng giọt (18 * 8cm) (xấp xỉ)', '65,000', 'https://yeutieucanh.com/wp-content/uploads/2018/12/be-ca-mini-treo-tuong-dep-5.jpg'),
('DB_23', 11, '2', 'Chậu nhựa trụ vuông vát lớn - CA002', '- Kích thước:  26x24 cm\r\n- Màu sắc:      Vân gỗ\r\n- Chất liệu:     Nhựa ABS\r\n- Kiểu dáng:   Trụ vuông vát', '180,000', 'https://vuoncayviet.com/data/items/981/chau-nhua-tru-vuong-vat-lon-ca002.jpg-3.jpg'),
('DB_24', 11, '2', 'Chậu nhựa trụ vuông vát - CA001', '- Kích thước: 20x18 cm\r\n- Màu sắc:     Trắng, vân gỗ\r\n- Chất liệu:     Nhựa ABS\r\n- Kiểu dáng:   Trụ vuông vát', '120,000', 'https://vuoncayviet.com/data/items/979/chau-nhua-tru-vuong-vat-ca001-4.jpg'),
('DB_25', 11, '2', 'Chậu nhựa cao tròn - CA003', '- Kích thước: 20x18 cm\r\n- Màu sắc:     Trắng\r\n- Chất liệu:     Nhựa ABS sơn bóng\r\n- Kiểu dáng:   Cao tròn vát ', '100,000', 'https://vuoncayviet.com/data/items/982/chau-nhua-cao-tron-ca003-3.jpg'),
('DB_26', 12, '2', 'Chậu đất nung trắng 5x5', 'Kích thước:   5x5 cm\r\nMàu sắc:       Trắng\r\nChất liệu:      Đất nung\r\nKiểu dáng:    Trụ tròn vát', '5,000', 'https://vuoncayviet.com/data/items/1253/chau-dat-nung-trang-5x5.png'),
('DB_27', 12, '2', 'Chậu đất nung trắng 17x9', 'Kích thước:  17x9 cm\r\nMàu sắc:       Trắng\r\nChất liệu:      Đất nung\r\nKiểu dáng:    Trụ tròn vát thấp', '30,000', 'https://vuoncayviet.com/data/items/1257/chau-dat-nung-trang-17x9-cm.PNG'),
('DB_28', 12, '2', 'Chậu đất nung trắng 13x13', 'Kích thước:  13x13 cm\r\nMàu sắc:       Trắng\r\nChất liệu:      Đất nung\r\nKiểu dáng:    Trụ tròn vát', '20,000', 'https://vuoncayviet.com/data/items/1254/chau-dat-nung-trang-13x13.png'),
('DB_29', 12, '2', 'Chậu đất nung đỏ 8x8', 'Kích thước:  8x8 cm\r\nMàu sắc:       đỏ\r\nChất liệu:      Đất nung\r\nKiểu dáng:    Trụ tròn', '12,000', 'https://vuoncayviet.com/data/items/1259/chau-dat-nung-do-tru-tron-8x8-cm.PNG'),
('DB_30', 13, '2', 'Chậu composite trụ vuông vát - CP002', 'Kich thước:  32x60 cm\r\nMàu sắc:      Trắng\r\nChất liệu:     Composite sơn bóng\r\nKiểu dáng:   Trụ vuông vát', '1,400,000', 'https://vuoncayviet.com/data/items/958/chau-composite-tru-vuong-vat-cp002-1.jpg'),
('DB_31', 13, '2', 'Chậu composite tròn đầu đạn vân sóng đứng - CP005', 'Kich thước: 30x45 cm\r\nMàu sắc:     Trắng\r\nChất liệu:    Composite sơn bóng\r\nKiểu dáng:   Hình tròn giống đầu đạn, trên thân có vân sóng đứng', '1,250,000', 'https://vuoncayviet.com/data/items/964/chau-composite-tron-dau-dan-van-song-dung-cp005.jpg'),
('DB_32', 13, '2', 'Chậu composite hình trứng vân sóng đứng - CP004', 'Kich thước:  35x40 cm\r\nMàu sắc:      Đỏ\r\nChất liệu:     Composite sơn bóng\r\nKiểu dáng:   Cao tròn hình trứng, trên thân có vân sóng đứng', '1,250,000', 'https://vuoncayviet.com/data/items/962/chau-composite-hinh-trung-van-song-dung-cp004.jpg'),
('DB_33', 13, '2', 'Chậu composite hình ly miệng vành - CP003', 'Kich thước:  40x60 cm\r\nMàu sắc:      Trắng\r\nChất liệu:     Composite sơn bóng\r\nKiểu dáng:    Hình ly miệng vành', '2,700,000', 'https://vuoncayviet.com/data/items/961/Chau-composite-hinh-ly-mieng-vanh-CP003.jpg'),
('DB_34', 13, '2', 'Chậu composite bầu tròn - CP001', 'Kich thước:  32x26 cm\r\nMàu sắc:     Trắng\r\nChất liệu:     Composite sơn bóng\r\nKiểu dáng:   Bầu tròn', '550,000', 'https://vuoncayviet.com/data/items/957/chau-composite-bau-tron-cp001-2.jpg'),
('DB_35', 14, '3', 'Đất sạch hữu cơ', 'Đất trồng là một trong khoản đầu tư ban đầu  tạo dựng  một mảnh vườn xanh tốt. Vậy muốn giảm chi phí với đất trồng rau giá rẻ mà chất lượng nhất?', '25,000', 'https://giongrausach.com/wp-content/uploads/2015/07/dat-sach-huu-co-trong-cay-300x300.jpg'),
('DB_36', 14, '3', 'Đất sạch Tribat 5dm3', 'Đất sạch Tribat chuyên dùng để trồng rau sạch, trồng hoa cây cảnh giúp cây trồng  sinh trưởng và phát triển toàn diện không phải bòn thêm bất kỳ loại phân hóa học nào.', '20,000', 'https://giongrausach.com/wp-content/uploads/2014/12/dat-sach-tribat-trong-cay-5dme-300x300.jpg'),
('DB_37', 14, '3', 'Đất trồng cao cấp Sài Gòn', 'Đất trồng cao cấp Hà Nội chuyên làm đất trồng cây tại nhà như rau mầm, rau ăn lá, hoa cây cảnh mà sử dụng lâu dài, không cần thay đất', '40,000', 'https://giongrausach.com/wp-content/uploads/2015/05/Dat-trong-rau-cao-cap-sai-gon-1-300x300.jpg'),
('DB_38', 14, '3', 'Đất Tribat chuyên trồng mầm 20dm3', 'Đất trồng mầm tribat khối lượng to nhất, lớn nhất trồng mầm được nhiều hơn, giá rẻ hơn nhiều. Đất trồng hoan toàn sạch mầm bệnh và an toàn.', '45,000', 'https://giongrausach.com/wp-content/uploads/2014/12/Dat-sach-tribat-trong-rau-mam-300x300.jpg'),
('DB_39', 15, '3', 'Chế phẩm sinh học BiMa (Trichoderma)', 'Chế phẩm sinh học Trichoderma được sử dụng rộng rãi trong nông nghiệp. Trong chế phẩm có nấm đối kháng Trichoderma sẽ phân hủy những bã, rác nông nghiệp thành phân bón, tạo độ xốp cho cây trồng', '70,000', 'https://giongrausach.com/wp-content/uploads/2017/04/che-pham-sinh-hoc-bima-300x300.jpg'),
('DB_40', 15, '3', 'Chế phẩm Super Root kích thích ra hoa cây cảnh', 'Chế phẩm Super Root chuyên dùng kích thích ra rễ cho lan và cây cảnh. Kích thích ra rễ cực mạnh cho cây trồng còi cọc, giúp cho bộ rễ phát triển mạnh.', '30,000', 'https://giongrausach.com/wp-content/uploads/2018/05/che-pham-super-root-300x300.jpg'),
('DB_41', 15, '3', 'Phân bón cao cấp NPK 16 – 16 – 16 + TE', 'Phân bón cao cấp NPK tổng hợp với tỷ lệ NPK 1:1:1 kèm theo trung vi lượng cung cấp cho cây trồng ra rễ bật chồi và cây trồng phát triển cân đối.', '30,000', 'https://giongrausach.com/wp-content/uploads/2018/03/Phan-bon-cao-cao-premun-16-16-16-300x300.jpg'),
('DB_42', 15, '3', 'Phân bón cao cấp NPK 19 – 9 – 19 + TE', 'Phân bón tổng hợp NPK nhập khẩu từ Nga đồng thời cung cấp các nguyên tôi trung vi lượng cho cây trồng giúp cho bộ rễ phát triển mạnh, cho củ to, chắc, đẹp mã', '30,000', 'https://giongrausach.com/wp-content/uploads/2018/03/phan-bon-cao-cap-NPK-nhap-khau-300x300.jpg'),
('DB_43', 16, '3', 'Dụng cụ làm vườn mini: Xẻng, Xúc, Cào', 'Bộ dụng cụ làm vườn mini hỗ trợ việc chăm sóc cây cảnh được dễ dàng và hiệu quả hơn so với làm bằng tay.\r\nBộ sản phẩm bao gồm xẻng, xúc, cào được làm bằng sắt và sơn đen tĩnh điện bên ngoài, mỗi dụng cụ đều có tay cầm bằng gỗ giúp việc sử dụng được thoải mái\r\nKích thước: từ 12 - 15 cm.\r\nThành phần\r\n\r\nXẻng: xúc đất, xới đất, làm tơi xốp, đào đất, đào hố, trộn đất, vun gốc cây, sang chậu mới cho cây…\r\nXúc: đầu lưỡi nhọn, lưỡi thường cong để xúc được, làm tơi đất, đào lỗ nhỏ, trồng cây và làm cỏ, trộn phân bón hoặc các phụ chất khác.\r\nCào: 4 răng dài, thưa, khỏe trông như chiếc lược, đơn giản, gọn nhẹ, cào đất trên mặt chậu, giúp đất không bị chai, dễ tưới nước ngấm xuống đáy để rễ hấp thụ, gom lá khô úa, rụng dưới gốc để chậu trồng thông thoáng.', '35,000', 'https://vuoncayviet.com/data/items/1100/dung-cu-lam-vuon-mini.jpg'),
('DB_44', 16, '3', 'Bộ dụng cụ làm vườn mini Daiwa 4 món', 'Dụng cụ làm vườn làm một phần không thể thiếu khi bạn bắt đầu trồng rau. Bộ dụng cụ làm vườn mini nhật bản với 4 món nhỏ gọn và cứng cáp cho bạn thoải mái làm đất, đào hố…', '80,000', 'https://giongrausach.com/wp-content/uploads/2015/08/bo-dung-cu-lam-vuon-4-mon-300x300.jpg'),
('DB_45', 16, '3', 'Bình tưới cây ô doa bằng nhựa PP', 'Bình tưới cây kiểu ô doa hay còn gọi ô doa tưới cây là một trong những dụng cụ làm vườn cần thiết. Bình tưới cây được làm bằng nhựa an toàn với đủ màu sắc và kích thước.', '55,000', 'https://giongrausach.com/wp-content/uploads/2015/08/binh-tuoi-nuoc-o-doa-300x300.jpg'),
('DB_46', 16, '3', 'Bộ dây nước tưới cây kèm theo vòi phun', 'Bộ dây tưới nước kèm vòi xịt hàng chính hãng, đẹp, giá rẻ. Với dây tưới nước 3 lớp đặt tiêu chuẩn Châu Âu, vòi xịt tưới cây, cây cảnh, rửa xe đa năng với nối dây và vòi tưới nước thông minh, Giao hàng toàn quốc, Ship code toàn quốc.', '250,000', 'https://giongrausach.com/wp-content/uploads/2017/08/day-tuoi-nuoc-kem-theo-voi-300x300.jpg'),
('DB_47', 17, '3', 'Sỏi Màu Trang Trí 500gr', 'Kích thước mỗi viên sỏi: 1-1,5cm\r\nTrọng lượng: bịch 500gr\r\nMàu sắc: trắng, cam, vàng...\r\nCông dụng\r\n\r\nTrang trí bề mặt chậu, giúp tạo vẻ thẩm mỹ cho chậu cây\r\nKhi tưới nước không làm văng đất, phân bón ra ngoài, giữ vệ sinh xung quanh chậu cây\r\nCó nhiều màu sắc phù hợp với mệnh, tuổi, sở thích', '40,000', 'https://vuoncayviet.com/data/items/1093/soi-mau-trang-tri-500gr.jpg'),
('DB_48', 17, '3', 'Thảm cỏ giả nhân tạo trang trí', 'Thảm cỏ nhựa trang trí giá rẻ nhất Hà Nội treo trên tường làm bằng tấm, thảm cỏ vĩ lá rủ, tai chuột, xà lách xoong  nhựa giống thật hơn 90% trang trí trên tường giá rẻ chỉ còn 40k/tấm, bạn dùng cỏ dán lên tường ban công, quá café, khách sạn, nhà hàng, cửa hàng, chụp cưới studio backgroup, backsdrop.', '50,000', 'https://giongrausach.com/wp-content/uploads/2017/08/co-nhan-tao-trang-tri-tuong-1-300x300.jpg'),
('DB_49', 17, '3', 'Hàng rào nhựa đẹp mini', 'Hàng rào nhựa trang trí cây thông trong dịp noel hàng rào nhựa lắp ghép màu trắng bạn rất linh động sắp xếp theo từng góc canh bạn muốn. Hàng rào dùng cho trẻ em hay em bé chơi giá bán từ 30k', '30,000', 'https://giongrausach.com/wp-content/uploads/2017/07/hang-rao-nhua-trang-tri-300x300.jpg'),
('DB_50', 17, '3', 'Khay (Đĩa) tròn lót đáy chậu', 'Khay hay còn gọi địa hứng nước ở đáy chậu, bạn chỉ đặt chậu vào trong lòng đĩa, đĩa hứng toàn bộ nước, đất thừa sau mỗi lần bạn tưới nước cho cây. Đĩa được làm bằng nhựa PP dẻo hoàn toàn dễ dàng vận chuyển chậu, kéo, dịch chuyển', '4,000', 'https://giongrausach.com/wp-content/uploads/2018/05/khay-dia-lot-chau-tron-300x300.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`so`);

--
-- Indexes for table `ncc`
--
ALTER TABLE `ncc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`idSP`),
  ADD KEY `SANPHAM_theloai` (`idPL`);

--
-- Indexes for table `theloai`
--
ALTER TABLE `theloai`
  ADD PRIMARY KEY (`idPL`);

--
-- Indexes for table `thongtinsp`
--
ALTER TABLE `thongtinsp`
  ADD PRIMARY KEY (`idC`),
  ADD KEY `TT_SP` (`idSP`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `donhang`
--
ALTER TABLE `donhang`
  MODIFY `so` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `idSP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `theloai`
--
ALTER TABLE `theloai`
  MODIFY `idPL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `thongtinsp`
--
ALTER TABLE `thongtinsp`
  ADD CONSTRAINT `TT_SP` FOREIGN KEY (`idSP`) REFERENCES `sanpham` (`idSP`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
