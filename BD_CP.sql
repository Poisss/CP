-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3307
-- Время создания: Июн 30 2023 г., 13:28
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

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
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `product_id` int NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `authorid` int NOT NULL,
  `product_description` text NOT NULL,
  `product_logo` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `gpsx` point NOT NULL,
  `gpsy` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `producttag`
--

CREATE TABLE `producttag` (
  `productid` int NOT NULL,
  `tagid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `userid` int NOT NULL,
  `roleid` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `userrole`
--

INSERT INTO `userrole` (`userid`, `roleid`) VALUES
(1, 'Администратор'),
(2, 'Пользователь');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_name_last` varchar(50) NOT NULL,
  `user_password` char(32) NOT NULL,
  `user_sex` int NOT NULL,
  `user_img` varchar(255) NOT NULL,
  `user_birthdate` date NOT NULL,
  `user_email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_name_last`, `user_password`, `user_sex`, `user_img`, `user_birthdate`, `user_email`) VALUES
(1, 'Артём', 'Аверин', '123', 1, '/src/assets/img/img2.jpg', '2003-01-18', 'artem@mail.ru'),
(2, 'Сергей', 'Пинпун', '123', 2, '/src/assets/img/img2.jpg', '2004-04-08', 'sergey@gmail.com');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Индексы таблицы `producttag`
--
ALTER TABLE `producttag`
  ADD KEY `tagid` (`tagid`);

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
-- Индексы таблицы `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `userrole`
--
ALTER TABLE `userrole`
  ADD KEY `roleid` (`roleid`),
  ADD KEY `userid` (`userid`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_sex` (`user_sex`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sex`
--
ALTER TABLE `sex`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `producttag`
--
ALTER TABLE `producttag`
  ADD CONSTRAINT `producttag_ibfk_1` FOREIGN KEY (`tagid`) REFERENCES `tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `userrole`
--
ALTER TABLE `userrole`
  ADD CONSTRAINT `userrole_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `userrole_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_sex`) REFERENCES `sex` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
