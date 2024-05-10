create database if not exists threaderz_store;
use threaderz_store;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 10, 2024 lúc 02:08 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `threaderz_store`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `products_id` int(10) NOT NULL,
  `ip_add` varchar(255) NOT NULL,
  `qty` int(10) NOT NULL,
  `size` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `c_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`products_id`, `ip_add`, `qty`, `size`, `date`, `c_id`) VALUES
(11, '::1', 1, 'Large', '2024-05-10 09:33:41', 'user@gmail.com'),
(22, '::1', 4, 'Medium', '2024-05-10 11:47:36', 'user@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `cat_id` int(10) NOT NULL,
  `cat_title` text NOT NULL,
  `cat_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`cat_id`, `cat_title`, `cat_desc`) VALUES
(1, 'Groom', ' Latest and best outfits for grooms'),
(2, 'Bride', ' Latest and best outfits for brides'),
(3, 'Accessories', ' Latest and best accessories');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(10) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_pass` varchar(50) NOT NULL,
  `customer_address` varchar(400) NOT NULL,
  `customer_contact` text NOT NULL,
  `customer_image` text NOT NULL,
  `customer_ip` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_email`, `customer_pass`, `customer_address`, `customer_contact`, `customer_image`, `customer_ip`) VALUES
(31, 'user', 'user@gmail.com', '123', 'LouCiTy', '03002291527', '2.jpeg', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` int(10) NOT NULL,
  `order_qty` int(10) NOT NULL,
  `order_price` int(10) NOT NULL,
  `c_id` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `products_id` int(10) NOT NULL,
  `p_cat_id` int(10) NOT NULL,
  `cat_id` int(10) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `product_title` text NOT NULL,
  `product_img1` text NOT NULL,
  `product_img2` text NOT NULL,
  `product_price` int(10) NOT NULL,
  `product_keywords` text NOT NULL,
  `product_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`products_id`, `p_cat_id`, `cat_id`, `date`, `product_title`, `product_img1`, `product_img2`, `product_price`, `product_keywords`, `product_desc`) VALUES
(1, 4, 1, '2024-05-10 11:26:10', 'Men\'s Navy Blue Suit', 'men-3.png', 'men-3.png', 1400, 'Jogers', '<p>Looking for the sharpest tool in your wardrobe? The Men\'s Navy Blue Suit is it. Our navy is a dark blue suit that’s both saturated and subtle, perfectly fit for any occasion–and for the everyday. Constructed with smooth, flexible fabric, this is the navy blue suit for men, keeping a focus on comfort. This navy blue suit is wedding style idealized, and so much more–a classic neutral that can be romantic or neat, formal or relaxed, and always versatile. Designed to be a crisp look outdoors; timeless worn inside a venue; and powerful at the office, navy is the dark blue suit suitable for it all.</p>'),
(2, 3, 2, '2024-05-10 11:19:18', 'Mermaid Scoop Pleated Crepe Back Satin Brides Dress', 'women-2.png', 'women-2.png', 1800, 'Jeans', '<p>Celebrate a special moment in Moonlight, our modern bridal gown cut from crepeback satin. She features a scoop neckline paired with off-shoulder straps and a keyhole back. The bodice pleats extend down the mermaid skirt, leading to a dramatic leg slit. The look is complete with a chapel length train.</p>'),
(3, 2, 2, '2024-05-10 11:07:44', 'A-Line Sequins Chiffon Brides Dress', 'woman-4.png', 'woman-4.png', 800, 'Printed Tee', '<p>Trixie is a beautiful and classic bridal dress to wear when you say “I do.\" Cut in chiffon, this gorgeous dress features a plunging V-neckline with embroidered lace applique over the bodice and neckline. A dramatic keyhole back with illusion tulle and lace leads to a chapel length train to complete the look.</p>'),
(4, 3, 2, '2024-05-10 12:06:48', 'Mermaid Sequins Stretch Crepe Brides Dress', 'men-2.png', 'men-2.png', 2200, 'Skinny Jeans', '<p>Your guests will gasp in awe as you walk down the aisle in Estephanie, our dramatic lace and stretch crepe wedding dress. She features a stunning lace illusion sleeveless bodice with a V-neckline and illusion side panels with skin-tone lining to blend into your skin. Her gorgeous scalloped lace train with buttons down the cathedral length train will be talked about for ages to come.</p>'),
(6, 2, 2, '2024-05-10 12:06:27', 'A-Line Lace Tulle Brides Dress', 'kid-1.png', 'kid-1-b.png', 800, 'Tank', '<p>Monda is our stunning bridal gown cut from lace applique, 3D flowers, and tulle. She features an illusion plunge neckline and a low V-back. The soft A-line skirt is paired with a leg slit and chapel train.</p>'),
(7, 2, 2, '2024-05-10 11:09:16', 'A-Line Sequins Tulle Brides Dress', 'women-5.png', 'won-5-b.png', 2200, 'Black Top', '<p>Look soft and ethereal while wearing the Sade dress on your special day. Crafted with lace applique over glitter dot tulle for a soft glam effect, your guests will remember this dress for years to come. It features an illusion plunge bodice with a V-back paired with spaghetti straps. The mermaid silhouette is designed with a sweep length train. To complete the look, we added a removable chapel length A-line overskirt attached to a beaded belt.</p>'),
(9, 1, 2, '2024-05-10 12:05:22', 'A-Line Halter Sequins Tulle Brides Dress', 'boys-Puffer-Coat-With-Detachable-Hood-1.jpg', 'boys-Puffer-Coat-With-Detachable-Hood-1.jpg', 2100, 'Black Warm', '<p>Let your day be perfect with our dazzling and light-catching A-line gown, Dysis. Her illusion halter neckline is adorned with hand sewn lace that drapes around the neck and onto her keyhole back. Buttons are sewn down the zipper and the A-line skirt has floral lace appliques that cascade down the chapel train.</p>'),
(10, 1, 2, '2024-05-10 12:05:37', 'A-Line Sweetheart Lace Brides Dress', 'boys-Puffer-Coat-With-Detachable-Hood-2.jpg', 'boys-Puffer-Coat-With-Detachable-Hood-2.jpg', 2300, 'Warm Red', '<p>Whimsical and dreamy lace applique decorates our romantic wedding gown, Vivienne. Unique dimensional floral lace hand-sewn along every angle creates this masterpiece. The universally flattering A-line style features a leg slit and sweep length train. The sweetheart bodice on this beauty has the option to be worn with the puff sleeves, or as a charming off-shoulder look: two looks in one.</p>'),
(11, 2, 2, '2024-05-10 11:09:47', 'A-Line Lace Chiffon Brides Dress', 'g-polos-tshirt-1.png', 'g-polos-tshirt-2.png', 750, 'White Tee', '<p>Turn heads as you walk down the aisle in Gala, our stunning and lightweight bridal gown. Crafted from tulle and chiffon, she features a lace embellished V-neckline and spaghetti straps. The V-back has double straps for added detail and support. The look is complete with a classic A-line skirt and chapel length train.</p>'),
(12, 1, 2, '2024-05-10 10:58:09', 'A-Line Sweetheart Sequins Tulle Brides Dress', 'brown-jacket.jpg', 'brown-jacket.jpg', 2700, 'Warm', '<p>Walk down the aisle in Florentina, our romantic and feminine bridal gown cut from tulle. She features a sweetheart neckline with off shoulder sleeves embellished with 3D floral applique over an illusion bodice with exposed boning. The look is complete with a V-back that leads to a chapel length A-line skirt.</p>'),
(13, 1, 2, '2024-05-10 10:58:59', 'A-Line V-Neck Lace Tulle Brides Dress', 'pink jacket.jpg', 'pink jacket.jpg', 3200, 'Warm', '<p>Feel graceful and beautiful on your wedding day wearing Arabelle, a whimsical lace wedding dress. Her flattering V-neck bodice and flowy tulle A-line skirt accentuate your feminine figure. She has a gorgeous beaded open V-back and long flower shaped train that will draw everyone’s attention as you walk down the aisle. We’ve added a layer of sparkle tulle and hand beaded lace to make sure you are the shining star of your perfect day.</p>'),
(14, 4, 1, '2024-05-10 12:07:06', 'Men\'s Tan Suit', 'blackheels.jpg', 'blackheels.jpg', 2300, 'Black Heels', '<p>Embody laid-back elegance in the light tan suit. This mod, sandy shade with visible woven texture throughout is designed to suit you from sunny celebrations to the office, candlelit dinners, and everywhere in between. The men\'s tan suit is crafted from signature Eco Stretch fabric, sure to keep you cool and comfortable through it all. Of all tan suits for men, this is the ultimate new neutral, everyday look, warm-weather classic, or tan wedding suit.</p>'),
(15, 1, 2, '2024-05-10 12:05:50', 'A-Line Sequins Crepe Back Satin Brides Dress', 'Man-Geox-Winter-jacket-1.jpg', 'Man-Geox-Winter-jacket-2.jpg', 3500, 'Jacket Grey', '<p>Marisela is our stunning bridal gown crafted from crepe back satin. She features a strapless V-neckline with pleats along the bodice and skirt. Her hand beaded illusion V-back with boning details emphasizes the silhouette, leading to a chapel-length A-line skirt. This dress also has a leg slit to show off your legs.</p>'),
(16, 4, 1, '2024-05-10 12:07:21', 'Men\'s Black Tuxedo', 'whiteheels.jpg', 'whiteheels.jpg', 1900, 'Shiney', '<p>The best in black tie: the Men\'s Black Tuxedo. Between sharp yet comfort-oriented fabric, satin detailing on the lapel, buttons, pockets, and waistband, and a perfectly flattering contemporary fit, this is the ideal in black tuxedo wedding attire, gala outfitting, prom tuxedo, and beyond. This all black tuxedo beats the rest, combining modern standards–like an updated, sleek and simple pant leg–with timeless tradition and more. What high-style dreams are made of, look your absolute best in this men’s black tuxedo.</p>'),
(17, 5, 3, '2024-05-10 12:07:37', 'CRYSTAL CONSTELLATION EARRINGS', 'hoodie-2.png', 'hoodie-2.png', 1900, 'Grey Hoodie', '<p>These post earrings feature natural clusters of oval-shaped crystals for a flawless look.\r\nMaterial Type：Copper,Zircon.\r\nLength：1.06\"(Approx.2.7cm).\r\nWidth：0.51\"(Approx.1.3cm).\r\nDue to different production batches, there may be variations in the packaging boxes.</p>'),
(18, 3, 2, '2024-05-10 11:21:29', 'Mermaid Scoop Pleated Crepe Back Satin Brides Dress', 'jeanss.png', 'jeanss.png', 1800, 'Ripped Black', '<p>Look glamorous and sexy while wearing our Daira dress on your big day. Crafted from our silky crepe back satin she features a cowl draped neckline to highlight the bust and create a flattering silhouette leading to her fitted mermaid silhouette. Draping extends from the bodice to the overlapping skirt and features a sultry leg slit and a gorgeous chapel length train. The leg slit gives you the perfect opportunity to show off your bridal shoes.</p>'),
(19, 5, 3, '2024-05-10 11:30:14', 'RHINESTONE ADJUSTABLE STRAND BRACELET', 'hoodie-4.png', 'hoodie-4.png', 2300, 'Colorful', '<p>Unleash your inner sparkle with our Rhinestone Adjustable Strand Bracelet. The adjustable wrist chain feature ensures comfort and elegance, adding a touch of glamour to any look.\r\nMaterial Type：Alloy、Rhinestones.\r\nLength：11.42\"(Approx.29.0cm).</p>'),
(20, 1, 2, '2024-05-10 12:06:18', 'A-Line V-Neck Sequins Tulle Brides Dress', 'boys-Puffer-Coat-With-Detachable-Hood-3.jpg', 'boys-Puffer-Coat-With-Detachable-Hood-3.jpg', 3100, 'Black', '<p>Celebrate a memorable day in our Florian bridal gown. She features an illusion tulle bodice and V neckline embellished with lace and handmade beading. The look is complete with an A line skirt and chapel length train.</p>'),
(21, 5, 3, '2024-05-10 11:30:45', 'THIN SWIRL BRACELET', 'hoodie-3.png', 'hoodie-3.png', 1900, 'Black', '<p>A rhinestone-encrusted bracelet with small copper balls on the ends.\r\nMaterial Type：Rhinestone, Copper.\r\nDiameter of Bracelet：2.17\"(Approx.5.5cm).\r\nWidth of Bracelet：0.19\"(Approx.0.5cm).\r\nDue to different production batches, there may be variations in the packaging boxes.</p>'),
(22, 5, 3, '2024-05-10 12:07:49', 'SHINY DROP SHAPED RHINESTONE JEWELRY SET', 'hoodie-1.png', 'hoodie-1.png', 2300, 'Black White', '<p>This statement-making jewelry set includes a chain necklace and earrings, each with large rhinestone crystal pendants for an added wow-factor.\r\nMaterial Type：Rhinestones、Alloy.\r\nLength of Necklace：15.75\"(Approx.40.0cm).\r\nLength of Earrings：0.98\"(Approx.2.5cm).\r\nWidth of Earrings：0.39\"(Approx.1.0cm).\r\nQuantity: 3Pcs.</p>'),
(23, 2, 2, '2024-05-10 12:06:38', 'Mermaid Stretch Crepe Brides Dress', 'B&W Tee Shirt.jpg', 'B&W Tee Shirt.jpg', 1300, 'Black White Tee', '<p>Sharen is our timeless elegant dress that can be passed down through generations to come. Cut from stretch crepe, she features a flattering V-neckline and a beautiful mermaid silhouette. Her illusion back is adorned with buttons down her chapel length train. She also has removable ties along the shoulders. </p>');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_categories`
--

CREATE TABLE `product_categories` (
  `p_cat_id` int(10) NOT NULL,
  `p_cat_title` text NOT NULL,
  `p_cat_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_categories`
--

INSERT INTO `product_categories` (`p_cat_id`, `p_cat_title`, `p_cat_desc`) VALUES
(1, 'A-Line dresses', 'Indulge in timeless elegance with our A-Line wedding dress, a symbol of grace and sophistication. Crafted with meticulous attention to detail, this gown effortlessly enhances your natural beauty, ensuring you feel radiant on your special day.'),
(2, 'Boho dresses', 'Embrace free-spirited romance and effortless elegance with our boho wedding dress, a celebration of unconventional beauty and whimsical charm. Inspired by the laid-back bohemian lifestyle, this gown is designed to capture the essence of wanderlust and adventure, ensuring you feel radiant and carefree on your special day.'),
(3, 'Mermaid dresses', 'Make a statement of timeless elegance and feminine allure with our exquisite mermaid wedding dress. Designed to enchant and captivate, this gown embodies sophistication and romance, ensuring you feel like a true queen on your special day.'),
(4, 'Suits', 'Elevate your wedding day ensemble with our sophisticated groom\'s suit, meticulously crafted to embody timeless style and impeccable craftsmanship. Whether you\'re saying \"I do\" in a grand ballroom or exchanging vows in a rustic garden setting, this suit promises to make a statement of refined elegance.'),
(5, 'Accessories', 'Complete your wedding day ensemble with our exquisite collection of accessories, meticulously curated to add a touch of elegance and sophistication to your special day. From dazzling tiaras and sparkling cufflinks to delicate veils and stylish bow ties, our accessories are designed to elevate your look and create unforgettable memories that will last a lifetime.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slider`
--

CREATE TABLE `slider` (
  `slide_id` int(10) NOT NULL,
  `slide_name` varchar(255) NOT NULL,
  `slide_image` text NOT NULL,
  `slide_heading` varchar(100) NOT NULL,
  `slide_text` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `slider`
--

INSERT INTO `slider` (`slide_id`, `slide_name`, `slide_image`, `slide_heading`, `slide_text`) VALUES
(1, 'Slide 1', 'slide_1.jpg', 'Summer Sale', 'Walk in for the Fashion, Stay in for the Style.'),
(2, 'Slide 2', 'slide_2.jpg', 'Black friday', 'Simply Eveything You Want.');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`products_id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`products_id`);

--
-- Chỉ mục cho bảng `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`p_cat_id`);

--
-- Chỉ mục cho bảng `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`slide_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `cat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `products_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `p_cat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `slider`
--
ALTER TABLE `slider`
  MODIFY `slide_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
