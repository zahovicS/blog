-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 02-02-2024 a las 06:08:22
-- Versión del servidor: 5.7.33
-- Versión de PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `blog`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`) VALUES
(1, 'Sin categorizar', '2024-02-01 22:41:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `header_image` varchar(255) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `post_image` varchar(150) COLLATE utf8mb4_spanish2_ci NOT NULL DEFAULT 'images/posts/placeholder.jpg',
  `title` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `extract` varchar(120) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `content` text COLLATE utf8mb4_spanish2_ci NOT NULL,
  `posted_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `id_user`, `id_category`, `header_image`, `post_image`, `title`, `slug`, `extract`, `content`, `posted_at`) VALUES
(1, 1, 1, NULL, 'images/posts/placeholder.jpg', 'MUNDO BLOG PHP', 'mundo-blog-php', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam ve', '<p>asdasdasdsd</p>\\n<p>\\x3C!-- pagebreak --></p>\\n<p>sfasdasdas</p>', '2024-01-01 20:19:37'),
(2, 1, 1, NULL, 'images/posts/placeholder.jpg', 'MUNDO BLOG PHP 2', 'mundo-blog-php-2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam ve', '<h4>Hola <span class=\"hljs-selector-tag\">a</span> todos,</h4>\\n<p>Me gustar&iacute;<span class=\"hljs-selector-tag\">a</span> compartir algunas reflexiones sobre el tema <span class=\"hljs-selector-tag\">del</span> cambio clim&aacute;tico y su impacto en nuestras vidas. Es innegable que el calentamiento global est&aacute; causando cambios significativos en nuestro planeta. Los cient&iacute;ficos advierten sobre el aumento de las temperaturas, el derretimiento de los glaciares y el aumento <span class=\"hljs-selector-tag\">del</span> nivel <span class=\"hljs-selector-tag\">del</span> mar. Como ciudadanos <span class=\"hljs-selector-tag\">del</span> mundo, es nuestro deber tomar medidas para mitigar estos efectos y proteger nuestro entorno natural. Esto implica reducir nuestra huella de carbono, adoptar pr&aacute;cticas de consumo sostenible y abogar por pol&iacute;ticas ambientales m&aacute;s s&oacute;lidas. Cada peque&ntilde;<span class=\"hljs-selector-tag\">a</span> acci&oacute;n cuenta, desde reciclar en casa hasta apoyar <span class=\"hljs-selector-tag\">a</span> empresas comprometidas con la sostenibilidad. Adem&aacute;s, es importante reconocer que el cambio clim&aacute;tico no afecta <span class=\"hljs-selector-tag\">a</span> todos por igual. Las comunidades m&aacute;s vulnerables, especialmente en los pa&iacute;ses en desarrollo, enfrentan desaf&iacute;os <span class=\"hljs-selector-tag\">a</span>&uacute;n mayores debido <span class=\"hljs-selector-tag\">a</span> la falta de recursos y la infraestructura adecuada para hacer frente <span class=\"hljs-selector-tag\">a</span> los impactos clim&aacute;ticos extremos. En resumen, el cambio clim&aacute;tico es un problema urgente que requiere una acci&oacute;n global concertada. Debemos trabajar juntos para proteger nuestro planeta para las generaciones futuras. Cada uno de nosotros puede marcar la diferencia. &iexcl;Es hora de actuar! Gracias por leer y por ser parte de la soluci&oacute;n.</p>\\n<p>Saludos, Zahovic</p>\\n<blockquote>\\n<p>asdasdasdasdssdadsadasdasddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd</p>\\n</blockquote>', '2024-01-01 20:19:37'),
(3, 1, 1, NULL, 'images/posts/placeholder.jpg', 'MUNDO BLOG PHP 3', 'mundo-blog-php-3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam ve', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam vel nunc tincidunt sagittis auctor id justo. Mauris ullamcorper risus velit, et tincidunt justo varius sed. Sed blandit orci sit amet faucibus euismod. Etiam consectetur nunc a erat viverra egestas. Nunc dictum ornare felis ac ultrices. Integer in sapien laoreet, ultricies elit vitae, consequat sem. Mauris sit amet urna quis felis lobortis lobortis sed at nibh. In consequat porttitor est, eget elementum orci lobortis ac. In ornare purus non consequat porttitor. Vivamus finibus arcu ante, a faucibus nibh pretium in. Vestibulum ornare massa convallis pretium maximus. Sed sodales massa enim, ac imperdiet urna blandit in. Quisque non aliquet libero. Sed ac molestie neque, a tristique sem. Mauris id convallis enim. Aenean a luctus neque. Duis non consequat mi, quis venenatis est. Mauris ultricies sodales urna. Fusce justo ipsum, tempus quis magna at, tincidunt aliquam velit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse commodo, nunc a hendrerit blandit, nibh neque commodo sapien, vel malesuada erat lectus ut libero.', '2024-01-01 20:19:37'),
(4, 1, 1, NULL, 'images/posts/placeholder.jpg', 'MUNDO BLOG PHP 4', 'mundo-blog-php-4', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam ve', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam vel nunc tincidunt sagittis auctor id justo. Mauris ullamcorper risus velit, et tincidunt justo varius sed. Sed blandit orci sit amet faucibus euismod. Etiam consectetur nunc a erat viverra egestas. Nunc dictum ornare felis ac ultrices. Integer in sapien laoreet, ultricies elit vitae, consequat sem. Mauris sit amet urna quis felis lobortis lobortis sed at nibh. In consequat porttitor est, eget elementum orci lobortis ac. In ornare purus non consequat porttitor. Vivamus finibus arcu ante, a faucibus nibh pretium in. Vestibulum ornare massa convallis pretium maximus. Sed sodales massa enim, ac imperdiet urna blandit in. Quisque non aliquet libero. Sed ac molestie neque, a tristique sem. Mauris id convallis enim. Aenean a luctus neque. Duis non consequat mi, quis venenatis est. Mauris ultricies sodales urna. Fusce justo ipsum, tempus quis magna at, tincidunt aliquam velit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse commodo, nunc a hendrerit blandit, nibh neque commodo sapien, vel malesuada erat lectus ut libero.', '2024-01-01 20:19:37'),
(5, 1, 1, NULL, 'images/posts/placeholder.jpg', 'MUNDO BLOG PHP 5', 'mundo-blog-php', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam ve', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam vel nunc tincidunt sagittis auctor id justo. Mauris ullamcorper risus velit, et tincidunt justo varius sed. Sed blandit orci sit amet faucibus euismod. Etiam consectetur nunc a erat viverra egestas. Nunc dictum ornare felis ac ultrices. Integer in sapien laoreet, ultricies elit vitae, consequat sem. Mauris sit amet urna quis felis lobortis lobortis sed at nibh. In consequat porttitor est, eget elementum orci lobortis ac. In ornare purus non consequat porttitor. Vivamus finibus arcu ante, a faucibus nibh pretium in. Vestibulum ornare massa convallis pretium maximus. Sed sodales massa enim, ac imperdiet urna blandit in. Quisque non aliquet libero. Sed ac molestie neque, a tristique sem. Mauris id convallis enim. Aenean a luctus neque. Duis non consequat mi, quis venenatis est. Mauris ultricies sodales urna. Fusce justo ipsum, tempus quis magna at, tincidunt aliquam velit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse commodo, nunc a hendrerit blandit, nibh neque commodo sapien, vel malesuada erat lectus ut libero.', '2024-01-01 20:19:37'),
(6, 1, 1, NULL, 'images/posts/placeholder.jpg', 'MUNDO BLOG PHP 6', 'mundo-blog-php', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam ve', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam vel nunc tincidunt sagittis auctor id justo. Mauris ullamcorper risus velit, et tincidunt justo varius sed. Sed blandit orci sit amet faucibus euismod. Etiam consectetur nunc a erat viverra egestas. Nunc dictum ornare felis ac ultrices. Integer in sapien laoreet, ultricies elit vitae, consequat sem. Mauris sit amet urna quis felis lobortis lobortis sed at nibh. In consequat porttitor est, eget elementum orci lobortis ac. In ornare purus non consequat porttitor. Vivamus finibus arcu ante, a faucibus nibh pretium in. Vestibulum ornare massa convallis pretium maximus. Sed sodales massa enim, ac imperdiet urna blandit in. Quisque non aliquet libero. Sed ac molestie neque, a tristique sem. Mauris id convallis enim. Aenean a luctus neque. Duis non consequat mi, quis venenatis est. Mauris ultricies sodales urna. Fusce justo ipsum, tempus quis magna at, tincidunt aliquam velit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse commodo, nunc a hendrerit blandit, nibh neque commodo sapien, vel malesuada erat lectus ut libero.', '2024-01-01 20:19:37'),
(7, 1, 1, NULL, 'images/posts/placeholder.jpg', 'MUNDO BLOG PHP 7', 'mundo-blog-php', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam ve', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam vel nunc tincidunt sagittis auctor id justo. Mauris ullamcorper risus velit, et tincidunt justo varius sed. Sed blandit orci sit amet faucibus euismod. Etiam consectetur nunc a erat viverra egestas. Nunc dictum ornare felis ac ultrices. Integer in sapien laoreet, ultricies elit vitae, consequat sem. Mauris sit amet urna quis felis lobortis lobortis sed at nibh. In consequat porttitor est, eget elementum orci lobortis ac. In ornare purus non consequat porttitor. Vivamus finibus arcu ante, a faucibus nibh pretium in. Vestibulum ornare massa convallis pretium maximus. Sed sodales massa enim, ac imperdiet urna blandit in. Quisque non aliquet libero. Sed ac molestie neque, a tristique sem. Mauris id convallis enim. Aenean a luctus neque. Duis non consequat mi, quis venenatis est. Mauris ultricies sodales urna. Fusce justo ipsum, tempus quis magna at, tincidunt aliquam velit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse commodo, nunc a hendrerit blandit, nibh neque commodo sapien, vel malesuada erat lectus ut libero.', '2024-01-01 20:19:37'),
(8, 1, 1, NULL, 'images/posts/placeholder.jpg', 'MUNDO BLOG PHP 8', 'mundo-blog-php', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam ve', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam vel nunc tincidunt sagittis auctor id justo. Mauris ullamcorper risus velit, et tincidunt justo varius sed. Sed blandit orci sit amet faucibus euismod. Etiam consectetur nunc a erat viverra egestas. Nunc dictum ornare felis ac ultrices. Integer in sapien laoreet, ultricies elit vitae, consequat sem. Mauris sit amet urna quis felis lobortis lobortis sed at nibh. In consequat porttitor est, eget elementum orci lobortis ac. In ornare purus non consequat porttitor. Vivamus finibus arcu ante, a faucibus nibh pretium in. Vestibulum ornare massa convallis pretium maximus. Sed sodales massa enim, ac imperdiet urna blandit in. Quisque non aliquet libero. Sed ac molestie neque, a tristique sem. Mauris id convallis enim. Aenean a luctus neque. Duis non consequat mi, quis venenatis est. Mauris ultricies sodales urna. Fusce justo ipsum, tempus quis magna at, tincidunt aliquam velit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse commodo, nunc a hendrerit blandit, nibh neque commodo sapien, vel malesuada erat lectus ut libero.', '2024-01-01 20:19:37'),
(9, 1, 1, NULL, 'images/posts/placeholder.jpg', 'MUNDO BLOG PHP 9', 'mundo-blog-php', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam ve', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam vel nunc tincidunt sagittis auctor id justo. Mauris ullamcorper risus velit, et tincidunt justo varius sed. Sed blandit orci sit amet faucibus euismod. Etiam consectetur nunc a erat viverra egestas. Nunc dictum ornare felis ac ultrices. Integer in sapien laoreet, ultricies elit vitae, consequat sem. Mauris sit amet urna quis felis lobortis lobortis sed at nibh. In consequat porttitor est, eget elementum orci lobortis ac. In ornare purus non consequat porttitor. Vivamus finibus arcu ante, a faucibus nibh pretium in. Vestibulum ornare massa convallis pretium maximus. Sed sodales massa enim, ac imperdiet urna blandit in. Quisque non aliquet libero. Sed ac molestie neque, a tristique sem. Mauris id convallis enim. Aenean a luctus neque. Duis non consequat mi, quis venenatis est. Mauris ultricies sodales urna. Fusce justo ipsum, tempus quis magna at, tincidunt aliquam velit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse commodo, nunc a hendrerit blandit, nibh neque commodo sapien, vel malesuada erat lectus ut libero.', '2024-01-01 20:19:37'),
(10, 1, 1, NULL, 'images/posts/placeholder.jpg', 'MUNDO BLOG PHP 10', 'mundo-blog-php', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam ve', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam vel nunc tincidunt sagittis auctor id justo. Mauris ullamcorper risus velit, et tincidunt justo varius sed. Sed blandit orci sit amet faucibus euismod. Etiam consectetur nunc a erat viverra egestas. Nunc dictum ornare felis ac ultrices. Integer in sapien laoreet, ultricies elit vitae, consequat sem. Mauris sit amet urna quis felis lobortis lobortis sed at nibh. In consequat porttitor est, eget elementum orci lobortis ac. In ornare purus non consequat porttitor. Vivamus finibus arcu ante, a faucibus nibh pretium in. Vestibulum ornare massa convallis pretium maximus. Sed sodales massa enim, ac imperdiet urna blandit in. Quisque non aliquet libero. Sed ac molestie neque, a tristique sem. Mauris id convallis enim. Aenean a luctus neque. Duis non consequat mi, quis venenatis est. Mauris ultricies sodales urna. Fusce justo ipsum, tempus quis magna at, tincidunt aliquam velit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse commodo, nunc a hendrerit blandit, nibh neque commodo sapien, vel malesuada erat lectus ut libero.', '2024-01-01 20:19:37'),
(11, 1, 1, NULL, 'images/posts/placeholder.jpg', 'MUNDO BLOG PHP 11', 'mundo-blog-php', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam ve', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam vel nunc tincidunt sagittis auctor id justo. Mauris ullamcorper risus velit, et tincidunt justo varius sed. Sed blandit orci sit amet faucibus euismod. Etiam consectetur nunc a erat viverra egestas. Nunc dictum ornare felis ac ultrices. Integer in sapien laoreet, ultricies elit vitae, consequat sem. Mauris sit amet urna quis felis lobortis lobortis sed at nibh. In consequat porttitor est, eget elementum orci lobortis ac. In ornare purus non consequat porttitor. Vivamus finibus arcu ante, a faucibus nibh pretium in. Vestibulum ornare massa convallis pretium maximus. Sed sodales massa enim, ac imperdiet urna blandit in. Quisque non aliquet libero. Sed ac molestie neque, a tristique sem. Mauris id convallis enim. Aenean a luctus neque. Duis non consequat mi, quis venenatis est. Mauris ultricies sodales urna. Fusce justo ipsum, tempus quis magna at, tincidunt aliquam velit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse commodo, nunc a hendrerit blandit, nibh neque commodo sapien, vel malesuada erat lectus ut libero.', '2024-01-01 20:19:37'),
(12, 1, 1, NULL, 'images/posts/placeholder.jpg', 'MUNDO BLOG PHP 12', 'mundo-blog-php', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam ve', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam vel nunc tincidunt sagittis auctor id justo. Mauris ullamcorper risus velit, et tincidunt justo varius sed. Sed blandit orci sit amet faucibus euismod. Etiam consectetur nunc a erat viverra egestas. Nunc dictum ornare felis ac ultrices. Integer in sapien laoreet, ultricies elit vitae, consequat sem. Mauris sit amet urna quis felis lobortis lobortis sed at nibh. In consequat porttitor est, eget elementum orci lobortis ac. In ornare purus non consequat porttitor. Vivamus finibus arcu ante, a faucibus nibh pretium in. Vestibulum ornare massa convallis pretium maximus. Sed sodales massa enim, ac imperdiet urna blandit in. Quisque non aliquet libero. Sed ac molestie neque, a tristique sem. Mauris id convallis enim. Aenean a luctus neque. Duis non consequat mi, quis venenatis est. Mauris ultricies sodales urna. Fusce justo ipsum, tempus quis magna at, tincidunt aliquam velit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse commodo, nunc a hendrerit blandit, nibh neque commodo sapien, vel malesuada erat lectus ut libero.', '2024-01-01 20:19:37'),
(13, 1, 1, NULL, 'images/posts/placeholder.jpg', 'MUNDO BLOG PHP 13', 'mundo-blog-php', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam ve', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam vel nunc tincidunt sagittis auctor id justo. Mauris ullamcorper risus velit, et tincidunt justo varius sed. Sed blandit orci sit amet faucibus euismod. Etiam consectetur nunc a erat viverra egestas. Nunc dictum ornare felis ac ultrices. Integer in sapien laoreet, ultricies elit vitae, consequat sem. Mauris sit amet urna quis felis lobortis lobortis sed at nibh. In consequat porttitor est, eget elementum orci lobortis ac. In ornare purus non consequat porttitor. Vivamus finibus arcu ante, a faucibus nibh pretium in. Vestibulum ornare massa convallis pretium maximus. Sed sodales massa enim, ac imperdiet urna blandit in. Quisque non aliquet libero. Sed ac molestie neque, a tristique sem. Mauris id convallis enim. Aenean a luctus neque. Duis non consequat mi, quis venenatis est. Mauris ultricies sodales urna. Fusce justo ipsum, tempus quis magna at, tincidunt aliquam velit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse commodo, nunc a hendrerit blandit, nibh neque commodo sapien, vel malesuada erat lectus ut libero.', '2024-01-01 20:19:37'),
(14, 1, 1, NULL, 'images/posts/placeholder.jpg', 'MUNDO BLOG PHP 14', 'mundo-blog-php', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam ve', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam vel nunc tincidunt sagittis auctor id justo. Mauris ullamcorper risus velit, et tincidunt justo varius sed. Sed blandit orci sit amet faucibus euismod. Etiam consectetur nunc a erat viverra egestas. Nunc dictum ornare felis ac ultrices. Integer in sapien laoreet, ultricies elit vitae, consequat sem. Mauris sit amet urna quis felis lobortis lobortis sed at nibh. In consequat porttitor est, eget elementum orci lobortis ac. In ornare purus non consequat porttitor. Vivamus finibus arcu ante, a faucibus nibh pretium in. Vestibulum ornare massa convallis pretium maximus. Sed sodales massa enim, ac imperdiet urna blandit in. Quisque non aliquet libero. Sed ac molestie neque, a tristique sem. Mauris id convallis enim. Aenean a luctus neque. Duis non consequat mi, quis venenatis est. Mauris ultricies sodales urna. Fusce justo ipsum, tempus quis magna at, tincidunt aliquam velit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse commodo, nunc a hendrerit blandit, nibh neque commodo sapien, vel malesuada erat lectus ut libero.', '2024-01-01 20:19:37'),
(15, 1, 1, NULL, 'images/posts/placeholder.jpg', 'MUNDO BLOG PHP 15', 'mundo-blog-php', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam ve', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam vel nunc tincidunt sagittis auctor id justo. Mauris ullamcorper risus velit, et tincidunt justo varius sed. Sed blandit orci sit amet faucibus euismod. Etiam consectetur nunc a erat viverra egestas. Nunc dictum ornare felis ac ultrices. Integer in sapien laoreet, ultricies elit vitae, consequat sem. Mauris sit amet urna quis felis lobortis lobortis sed at nibh. In consequat porttitor est, eget elementum orci lobortis ac. In ornare purus non consequat porttitor. Vivamus finibus arcu ante, a faucibus nibh pretium in. Vestibulum ornare massa convallis pretium maximus. Sed sodales massa enim, ac imperdiet urna blandit in. Quisque non aliquet libero. Sed ac molestie neque, a tristique sem. Mauris id convallis enim. Aenean a luctus neque. Duis non consequat mi, quis venenatis est. Mauris ultricies sodales urna. Fusce justo ipsum, tempus quis magna at, tincidunt aliquam velit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse commodo, nunc a hendrerit blandit, nibh neque commodo sapien, vel malesuada erat lectus ut libero.', '2024-01-01 20:19:37'),
(16, 1, 1, NULL, 'images/posts/placeholder.jpg', 'MUNDO BLOG PHP 16', 'mundo-blog-php', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam ve', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam vel nunc tincidunt sagittis auctor id justo. Mauris ullamcorper risus velit, et tincidunt justo varius sed. Sed blandit orci sit amet faucibus euismod. Etiam consectetur nunc a erat viverra egestas. Nunc dictum ornare felis ac ultrices. Integer in sapien laoreet, ultricies elit vitae, consequat sem. Mauris sit amet urna quis felis lobortis lobortis sed at nibh. In consequat porttitor est, eget elementum orci lobortis ac. In ornare purus non consequat porttitor. Vivamus finibus arcu ante, a faucibus nibh pretium in. Vestibulum ornare massa convallis pretium maximus. Sed sodales massa enim, ac imperdiet urna blandit in. Quisque non aliquet libero. Sed ac molestie neque, a tristique sem. Mauris id convallis enim. Aenean a luctus neque. Duis non consequat mi, quis venenatis est. Mauris ultricies sodales urna. Fusce justo ipsum, tempus quis magna at, tincidunt aliquam velit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse commodo, nunc a hendrerit blandit, nibh neque commodo sapien, vel malesuada erat lectus ut libero.', '2024-01-01 20:19:37'),
(17, 1, 1, NULL, 'images/posts/placeholder.jpg', 'MUNDO BLOG PHP 17', 'mundo-blog-php', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam ve', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam vel nunc tincidunt sagittis auctor id justo. Mauris ullamcorper risus velit, et tincidunt justo varius sed. Sed blandit orci sit amet faucibus euismod. Etiam consectetur nunc a erat viverra egestas. Nunc dictum ornare felis ac ultrices. Integer in sapien laoreet, ultricies elit vitae, consequat sem. Mauris sit amet urna quis felis lobortis lobortis sed at nibh. In consequat porttitor est, eget elementum orci lobortis ac. In ornare purus non consequat porttitor. Vivamus finibus arcu ante, a faucibus nibh pretium in. Vestibulum ornare massa convallis pretium maximus. Sed sodales massa enim, ac imperdiet urna blandit in. Quisque non aliquet libero. Sed ac molestie neque, a tristique sem. Mauris id convallis enim. Aenean a luctus neque. Duis non consequat mi, quis venenatis est. Mauris ultricies sodales urna. Fusce justo ipsum, tempus quis magna at, tincidunt aliquam velit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse commodo, nunc a hendrerit blandit, nibh neque commodo sapien, vel malesuada erat lectus ut libero.', '2024-01-01 20:19:37'),
(18, 1, 1, NULL, 'images/posts/placeholder.jpg', 'MUNDO BLOG PHP 18', 'mundo-blog-php', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam ve', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam vel nunc tincidunt sagittis auctor id justo. Mauris ullamcorper risus velit, et tincidunt justo varius sed. Sed blandit orci sit amet faucibus euismod. Etiam consectetur nunc a erat viverra egestas. Nunc dictum ornare felis ac ultrices. Integer in sapien laoreet, ultricies elit vitae, consequat sem. Mauris sit amet urna quis felis lobortis lobortis sed at nibh. In consequat porttitor est, eget elementum orci lobortis ac. In ornare purus non consequat porttitor. Vivamus finibus arcu ante, a faucibus nibh pretium in. Vestibulum ornare massa convallis pretium maximus. Sed sodales massa enim, ac imperdiet urna blandit in. Quisque non aliquet libero. Sed ac molestie neque, a tristique sem. Mauris id convallis enim. Aenean a luctus neque. Duis non consequat mi, quis venenatis est. Mauris ultricies sodales urna. Fusce justo ipsum, tempus quis magna at, tincidunt aliquam velit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse commodo, nunc a hendrerit blandit, nibh neque commodo sapien, vel malesuada erat lectus ut libero.', '2024-01-01 20:19:37'),
(19, 1, 1, NULL, 'images/posts/placeholder.jpg', 'MUNDO BLOG PHP 19', 'mundo-blog-php', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam ve', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam vel nunc tincidunt sagittis auctor id justo. Mauris ullamcorper risus velit, et tincidunt justo varius sed. Sed blandit orci sit amet faucibus euismod. Etiam consectetur nunc a erat viverra egestas. Nunc dictum ornare felis ac ultrices. Integer in sapien laoreet, ultricies elit vitae, consequat sem. Mauris sit amet urna quis felis lobortis lobortis sed at nibh. In consequat porttitor est, eget elementum orci lobortis ac. In ornare purus non consequat porttitor. Vivamus finibus arcu ante, a faucibus nibh pretium in. Vestibulum ornare massa convallis pretium maximus. Sed sodales massa enim, ac imperdiet urna blandit in. Quisque non aliquet libero. Sed ac molestie neque, a tristique sem. Mauris id convallis enim. Aenean a luctus neque. Duis non consequat mi, quis venenatis est. Mauris ultricies sodales urna. Fusce justo ipsum, tempus quis magna at, tincidunt aliquam velit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse commodo, nunc a hendrerit blandit, nibh neque commodo sapien, vel malesuada erat lectus ut libero.', '2024-01-01 20:19:37'),
(20, 1, 1, NULL, 'images/posts/placeholder.jpg', 'MUNDO BLOG PHP 20', 'mundo-blog-php', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam ve', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam vel nunc tincidunt sagittis auctor id justo. Mauris ullamcorper risus velit, et tincidunt justo varius sed. Sed blandit orci sit amet faucibus euismod. Etiam consectetur nunc a erat viverra egestas. Nunc dictum ornare felis ac ultrices. Integer in sapien laoreet, ultricies elit vitae, consequat sem. Mauris sit amet urna quis felis lobortis lobortis sed at nibh. In consequat porttitor est, eget elementum orci lobortis ac. In ornare purus non consequat porttitor. Vivamus finibus arcu ante, a faucibus nibh pretium in. Vestibulum ornare massa convallis pretium maximus. Sed sodales massa enim, ac imperdiet urna blandit in. Quisque non aliquet libero. Sed ac molestie neque, a tristique sem. Mauris id convallis enim. Aenean a luctus neque. Duis non consequat mi, quis venenatis est. Mauris ultricies sodales urna. Fusce justo ipsum, tempus quis magna at, tincidunt aliquam velit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse commodo, nunc a hendrerit blandit, nibh neque commodo sapien, vel malesuada erat lectus ut libero.', '2024-01-01 20:19:37'),
(21, 1, 1, NULL, 'images/posts/placeholder.jpg', 'MUNDO BLOG PHP 21', 'mundo-blog-php', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam ve', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam vel nunc tincidunt sagittis auctor id justo. Mauris ullamcorper risus velit, et tincidunt justo varius sed. Sed blandit orci sit amet faucibus euismod. Etiam consectetur nunc a erat viverra egestas. Nunc dictum ornare felis ac ultrices. Integer in sapien laoreet, ultricies elit vitae, consequat sem. Mauris sit amet urna quis felis lobortis lobortis sed at nibh. In consequat porttitor est, eget elementum orci lobortis ac. In ornare purus non consequat porttitor. Vivamus finibus arcu ante, a faucibus nibh pretium in. Vestibulum ornare massa convallis pretium maximus. Sed sodales massa enim, ac imperdiet urna blandit in. Quisque non aliquet libero. Sed ac molestie neque, a tristique sem. Mauris id convallis enim. Aenean a luctus neque. Duis non consequat mi, quis venenatis est. Mauris ultricies sodales urna. Fusce justo ipsum, tempus quis magna at, tincidunt aliquam velit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse commodo, nunc a hendrerit blandit, nibh neque commodo sapien, vel malesuada erat lectus ut libero.', '2024-01-01 23:19:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socials`
--

CREATE TABLE `socials` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `icon` varchar(150) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `socials`
--

INSERT INTO `socials` (`id`, `name`, `icon`, `created_at`) VALUES
(1, 'Instagram', 'ri-instagram-line', '2024-02-01 22:43:17'),
(2, 'Facebook', 'ri-facebook-circle-line', '2024-02-01 22:43:26'),
(3, 'Twitter', 'ri-twitter-line', '2024-02-01 22:43:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `social_users`
--

CREATE TABLE `social_users` (
  `id` int(11) NOT NULL,
  `id_social` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `social_users`
--

INSERT INTO `social_users` (`id`, `id_social`, `id_user`, `link`, `created_at`) VALUES
(1, 2, 1, 'https://www.facebook.com/zahovic.saraviasuarez/', '2024-02-01 22:46:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(150) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `username` varchar(10) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `profile_image` varchar(255) COLLATE utf8mb4_spanish2_ci NOT NULL DEFAULT 'images/authors/placeholder.jpg',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `full_name`, `username`, `password`, `email`, `description`, `profile_image`, `created_at`) VALUES
(1, 'Zahovic Saravia Suarez', 'zahovicS', '$2y$10$hWCsrbfhm5BGAa7MpW7utuz00WP5B.2vI8f5LMvIbLVb5HaODB7l.', 'zahovic.work@gmail.com', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris commodo lorem sed placerat cursus. Phasellus nec diam vel nunc tincidunt sagittis auctor id justo.', 'images/authors/placeholder.jpg', '2024-01-01 20:16:03');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `title` (`title`),
  ADD KEY `slug` (`slug`),
  ADD KEY `posted_at` (`posted_at`),
  ADD KEY `id_category` (`id_category`);

--
-- Indices de la tabla `socials`
--
ALTER TABLE `socials`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `social_users`
--
ALTER TABLE `social_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_social` (`id_social`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `full_name` (`full_name`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `socials`
--
ALTER TABLE `socials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `social_users`
--
ALTER TABLE `social_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`);

--
-- Filtros para la tabla `social_users`
--
ALTER TABLE `social_users`
  ADD CONSTRAINT `social_users_ibfk_1` FOREIGN KEY (`id_social`) REFERENCES `socials` (`id`),
  ADD CONSTRAINT `social_users_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
