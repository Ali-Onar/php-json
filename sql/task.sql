-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 22 Nis 2021, 17:36:38
-- Sunucu sürümü: 10.4.16-MariaDB
-- PHP Sürümü: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `task`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `comment`
--

CREATE TABLE `comment` (
  `created` int(11) NOT NULL,
  `rating` int(3) NOT NULL,
  `body` text COLLATE utf8_turkish_ci NOT NULL,
  `product_id` int(3) NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `comment`
--

INSERT INTO `comment` (`created`, `rating`, `body`, `product_id`, `order_id`) VALUES
(1612133109, 4, '<p>Yanlışlıkla almışım.</p>', 317, 1062),
(1612213109, 4, '<p>Yanlışlıkla baskılı almışım.</p>', 317, 1036),
(1612233109, 5, '<p>Yanlışlıkla baskısız almışım.</p>', 317, 106),
(1612234109, 2, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed volutpat vel eros ut consequat.</p>', 129, 100),
(1612236109, 5, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed volutpat vel eros ut consequat. In sapien velit, ultricies in ligula sed, convallis suscipit libero. Porta nunc, vehicula bibendum mi. Proin ex mi, pharetra id bibendum quis, laoreet ac urna. In hac habitasse platea dictumst. Cras nec metus lacus.</p>', 129, 101),
(1612276109, 3, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed volutpat vel eros ut consequat. In sapien velit, ultricies in ligula sed, convallis suscipit libero. Donec placerat tellus tortor, non bibendum felis aliquet in. Cras luctus lacvamus vulputate urna in nisi scelerisque semper. Nunc efficitur molestie sapien, ut auctor lorem laoreet et. Etiam non nunc a odio feugiat porta. Praesent sit amet porta nunc, vehicula bibendum mi. Proin ex mi, pharetra id bibendum quis, laoreet ac urna. In hac habitasse platea dictumst. Cras nec metus lacus.</p>', 128, 432),
(1612296109, 4, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed volutpat vel eros ut consequat. In sapien velit, ultricies in ligula sed, convallis suscipit libero. Donec placerat tellus tortor, non bibendum felis aliquet in. Cras luctus lacus risus, vitae hendrerit mauris rhoncus in. Mauris turpis turpis, dictum ut nibh eget, finibus iaculis eros. Nunc finibus viverra arcu a tincidunt. Curabitur viverra neque vitae ultricies lacinia. Integer auctor posuere iaculis. Quisque tempus eleifend magna, eget commodo libero sodales eget. Vestibulum tristique augue vitae metus interdum, nec efficitur purus iaculis. In porta posuere pellentesque. Cras convallis massa non sagittis consequat.</p><p>Sed ac ligula cursus, sodales sem id, egestas risus. Duis lobortis dignissim placerat. Suspendisse maximus tincidunt urna quis euismod. Sed a lectus blandit, imperdiet lorem ut, viverra risus. Sed mattis eleifend venenatis. Nam eget aliquam mi, at accumsan dui. Vivamus vulputate urna in nisi scelerisque semper. Nunc efficitur molestie sapien, ut auctor lorem laoreet et. Etiam non nunc a odio feugiat porta. Praesent sit amet porta nunc, vehicula bibendum mi. Proin ex mi, pharetra id bibendum quis, laoreet ac urna. In hac habitasse platea dictumst. Cras nec metus lacus.</p>', 128, 123);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `owner_mail` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `orders`
--

INSERT INTO `orders` (`order_id`, `owner_mail`, `product_id`) VALUES
(100, 'yct@yct.com', 129),
(101, 'mel@blue.com', 129),
(106, 'zey@zey.com', 317),
(123, 'john@doe.com', 128),
(432, 'doe@john.com', 128),
(1036, 'tey@tey.com', 317),
(1062, 'bdb@bdb.com', 317);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(50) COLLATE utf8_turkish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `product`
--

INSERT INTO `product` (`product_id`, `product_name`) VALUES
(128, 'Standart Kartvizit'),
(129, 'El İlanı'),
(317, 'Rulo');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`created`);

--
-- Tablo için indeksler `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Tablo için indeksler `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `comment`
--
ALTER TABLE `comment`
  MODIFY `created` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1612296110;

--
-- Tablo için AUTO_INCREMENT değeri `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1063;

--
-- Tablo için AUTO_INCREMENT değeri `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=318;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
