-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Июл 10 2023 г., 00:46
-- Версия сервера: 8.0.30
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `BD_CP`
--

-- --------------------------------------------------------

--
-- Структура таблицы `dayweek`
--

CREATE TABLE `dayweek` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `dayweek`
--

INSERT INTO `dayweek` (`id`, `name`) VALUES
(1, 'Понедельник'),
(2, 'Вторник'),
(3, 'Среда'),
(4, 'Четверг'),
(5, 'Пятница'),
(6, 'Суббота'),
(7, 'Воскресенье');

-- --------------------------------------------------------

--
-- Структура таблицы `grade`
--

CREATE TABLE `grade` (
  `id` int NOT NULL,
  `number` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `grade`
--

INSERT INTO `grade` (`id`, `number`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `img`
--

CREATE TABLE `img` (
  `id` int NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `img`
--

INSERT INTO `img` (`id`, `path`) VALUES
(1, '/src/assets/img/img4.jpg'),
(2, '/src/assets/img/banner1.jpg'),
(3, '/src/assets/img/banner2.jpg'),
(4, '/src/assets/img/logo_relp.svg'),
(5, '/src/assets/img/menu1.jpg'),
(6, '/src/assets/img/menu.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `listimg`
--

CREATE TABLE `listimg` (
  `id` int NOT NULL,
  `img_id` int NOT NULL,
  `product_menu_id` int DEFAULT NULL,
  `review_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `listimg`
--

INSERT INTO `listimg` (`id`, `img_id`, `product_menu_id`, `review_id`, `product_id`) VALUES
(4, 6, 1, NULL, NULL),
(5, 5, 2, NULL, NULL),
(6, 5, 3, NULL, NULL),
(7, 6, 4, NULL, NULL),
(8, 2, NULL, NULL, 3),
(9, 3, NULL, NULL, 3),
(10, 2, NULL, NULL, 2),
(11, 3, NULL, NULL, 2),
(12, 5, NULL, 1, NULL),
(13, 6, NULL, 1, NULL),
(14, 5, NULL, 2, NULL),
(15, 6, NULL, 2, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `opentime`
--

CREATE TABLE `opentime` (
  `id` int NOT NULL,
  `dayweek_id` int NOT NULL,
  `time_open` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `time_close` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `product_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `opentime`
--

INSERT INTO `opentime` (`id`, `dayweek_id`, `time_open`, `time_close`, `product_id`) VALUES
(1, 1, '08:30', '12:30', 2),
(2, 2, '10:30', '18:30', 2),
(3, 3, '08:30', '18:30', 2),
(4, 4, '18:30', '22:30', 2),
(5, 5, '11:30', '16:30', 2),
(6, 6, '15:30', '19:30', 2),
(7, 7, '13:30', '17:30', 2),
(8, 1, '06:30', '18:00', 3),
(9, 2, '03:30', '22:30', 3),
(10, 3, '16:30', '18:00', 3),
(11, 4, '13:30', '22:00', 3),
(12, 5, '16:30', '20:00', 3),
(13, 6, '19:00', '20:30', 3),
(14, 7, '15:30', '20:45', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `author_id` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `street` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `gpsx` double NOT NULL,
  `gpsy` double NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `title`, `author_id`, `description`, `street`, `phone`, `website`, `gpsx`, `gpsy`, `logo`, `status_id`) VALUES
(2, 'Много мяса', 1, 'Я увидел огромную толпу людей возле магазина и понял, что попробовать стоит. Оказалось, что бутерброд на завтрак был самым популярным блюдом, но я выбрал батон с фисташками Эрл Грей, так как я уже ел в тот день. Это было потрясающе. Я люблю Эрл Грей и фисташковый по отдельности, и никогда не пробовала их вместе. Я не знаю, почему другие пекарни еще не попробовали эту комбинацию. Буханка была не слишком сладкой, что делало ее хорошим угощением в полдень, но не слишком тяжелым. ', 'Грязнова, 36', '+7-912-318-69-63', 'https://newlms.magtu.ru/', 53.397227, 58.98416, '/src/assets/img/img1.jpg', 1),
(3, 'Компания по выпечке', 2, 'Бутерброды на завтрак здесь такие вкусные! Вы должны получить специальный с беконом и авокадо, потому что он действительно добавляет сэндвичу сливочный, соленый и хрустящий вкус. Бутерброды довольно массивные, и моя любимая часть - печенье! Он маслянистый и слоеный и так хорошо сочетается с начинкой! Это простой бутерброд, который по-прежнему вкусен и попадает в точку!', 'Грязнова, 36', '+7-912-318-69-63', 'https://newlms.magtu.ru/', 53.397227, 58.98416, '/src/assets/img/img1.jpg', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `productgrade`
--

CREATE TABLE `productgrade` (
  `id` int NOT NULL,
  `grade_id` int NOT NULL,
  `count` int NOT NULL,
  `product_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `productgrade`
--

INSERT INTO `productgrade` (`id`, `grade_id`, `count`, `product_id`) VALUES
(1, 1, 12, 2),
(2, 2, 3, 2),
(3, 3, 24, 2),
(4, 4, 76, 2),
(5, 5, 45, 2),
(6, 1, 13, 3),
(7, 2, 12, 3),
(8, 3, 35, 3),
(9, 4, 63, 3),
(10, 5, 23, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `productmenu`
--

CREATE TABLE `productmenu` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `product_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `productmenu`
--

INSERT INTO `productmenu` (`id`, `name`, `price`, `product_id`) VALUES
(1, 'Блюдо 1', '300.00', 2),
(2, 'Блюдо 2', '400.00', 2),
(3, 'Блюдо 3', '250.00', 3),
(4, 'Блюдо 4', '150.00', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `producttag`
--

CREATE TABLE `producttag` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `tag_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `producttag`
--

INSERT INTO `producttag` (`id`, `product_id`, `tag_id`) VALUES
(1, 2, 1),
(2, 3, 3),
(3, 2, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `review`
--

CREATE TABLE `review` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `grade_id` int NOT NULL,
  `text` text NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `review`
--

INSERT INTO `review` (`id`, `user_id`, `product_id`, `grade_id`, `text`, `date`) VALUES
(1, 1, 2, 3, 'Было ок', '2023-07-06 10:06:00'),
(2, 2, 3, 4, 'Было супер ок', '2023-07-06 10:06:05');

-- --------------------------------------------------------

--
-- Структура таблицы `role`
--

CREATE TABLE `role` (
  `id` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `role`
--

INSERT INTO `role` (`id`, `description`) VALUES
('Администратор', 'полный доступ'),
('Пользователь', 'Добавление, удаление и редактирование своего контента'),
('Редактор', 'Добавление, удаление и редактирование контента');

-- --------------------------------------------------------

--
-- Структура таблицы `sex`
--

CREATE TABLE `sex` (
  `id` int NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `sex`
--

INSERT INTO `sex` (`id`, `name`) VALUES
(1, 'Мужской'),
(2, 'Женский');

-- --------------------------------------------------------

--
-- Структура таблицы `status`
--

CREATE TABLE `status` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `status`
--

INSERT INTO `status` (`id`, `name`, `description`) VALUES
(1, 'approved', 'Продукт проверен редактором и одобрен для просмотра другими пользователями'),
(2, 'unapproved', 'Продукт проверен редактором и не одобрен для просмотра другими пользователями'),
(3, 'expects', 'Ожидает проверки редактора для получения одобрения просмотра другими пользователями');

-- --------------------------------------------------------

--
-- Структура таблицы `tag`
--

CREATE TABLE `tag` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `tag`
--

INSERT INTO `tag` (`id`, `name`) VALUES
(1, 'Чай'),
(2, 'Кофе'),
(3, 'Суши');

-- --------------------------------------------------------

--
-- Структура таблицы `userrole`
--

CREATE TABLE `userrole` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `role_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `userrole`
--

INSERT INTO `userrole` (`id`, `user_id`, `role_id`) VALUES
(1, 1, 'Администратор'),
(2, 2, 'Пользователь'),
(3, 1, 'Редактор');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name_first` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name_last` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sex` int NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `birthdate` date NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name_first`, `name_last`, `password`, `sex`, `img`, `birthdate`, `email`) VALUES
(1, 'Артём', 'Аверин', '202cb962ac59075b964b07152d234b70', 1, '/src/assets/img/img2.jpg', '2003-01-18', 'artem@mail.ru'),
(2, 'Сергей', 'Пинпун', '202cb962ac59075b964b07152d234b70', 2, '/src/assets/img/img2.jpg', '2004-04-08', 'sergey@gmail.com');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `dayweek`
--
ALTER TABLE `dayweek`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `img`
--
ALTER TABLE `img`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `listimg`
--
ALTER TABLE `listimg`
  ADD PRIMARY KEY (`id`),
  ADD KEY `img_id` (`img_id`),
  ADD KEY `product_menu_id` (`product_menu_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `review_id` (`review_id`);

--
-- Индексы таблицы `opentime`
--
ALTER TABLE `opentime`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dayweek_id` (`dayweek_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authorid` (`author_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Индексы таблицы `productgrade`
--
ALTER TABLE `productgrade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grade_id` (`grade_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `productmenu`
--
ALTER TABLE `productmenu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `producttag`
--
ALTER TABLE `producttag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tagid` (`tag_id`),
  ADD KEY `productid` (`product_id`);

--
-- Индексы таблицы `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `grade_id` (`grade_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sex`
--
ALTER TABLE `sex`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `userrole`
--
ALTER TABLE `userrole`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roleid` (`role_id`),
  ADD KEY `userid` (`user_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_sex` (`sex`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `dayweek`
--
ALTER TABLE `dayweek`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `grade`
--
ALTER TABLE `grade`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `img`
--
ALTER TABLE `img`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `listimg`
--
ALTER TABLE `listimg`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `opentime`
--
ALTER TABLE `opentime`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `productgrade`
--
ALTER TABLE `productgrade`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `productmenu`
--
ALTER TABLE `productmenu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `producttag`
--
ALTER TABLE `producttag`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `review`
--
ALTER TABLE `review`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `sex`
--
ALTER TABLE `sex`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `status`
--
ALTER TABLE `status`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `userrole`
--
ALTER TABLE `userrole`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `listimg`
--
ALTER TABLE `listimg`
  ADD CONSTRAINT `listimg_ibfk_2` FOREIGN KEY (`img_id`) REFERENCES `img` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `listimg_ibfk_3` FOREIGN KEY (`product_menu_id`) REFERENCES `productmenu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `listimg_ibfk_4` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `listimg_ibfk_5` FOREIGN KEY (`review_id`) REFERENCES `review` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `opentime`
--
ALTER TABLE `opentime`
  ADD CONSTRAINT `opentime_ibfk_1` FOREIGN KEY (`dayweek_id`) REFERENCES `dayweek` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `opentime_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `productgrade`
--
ALTER TABLE `productgrade`
  ADD CONSTRAINT `productgrade_ibfk_1` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `productgrade_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `productmenu`
--
ALTER TABLE `productmenu`
  ADD CONSTRAINT `productmenu_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `producttag`
--
ALTER TABLE `producttag`
  ADD CONSTRAINT `producttag_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `producttag_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `review_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `userrole`
--
ALTER TABLE `userrole`
  ADD CONSTRAINT `userrole_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `userrole_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`sex`) REFERENCES `sex` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
