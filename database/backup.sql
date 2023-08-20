-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 20-08-2023 a las 18:21:54
-- Versión del servidor: 5.7.35-0ubuntu0.18.04.2
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `parking-challenge`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `id` varchar(36) COLLATE utf8_spanish_ci NOT NULL,
  `name` varchar(80) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`id`, `name`) VALUES
('4d76f676-60b0-495a-bb54-0bf47aa8cae9', 'Saturn'),
('55fc0810-ffe1-476c-82ff-669c2c0a40aa', 'Acura'),
('7ef364fa-d615-4149-9355-c75b62e2ad54', 'Ford'),
('83e73741-7232-4a5f-97dc-2a47a40e0597', '812 GTS'),
('8b6ad591-ec67-4c6f-8550-87aae0492e52', 'Honda'),
('b51d0605-5806-4a07-a170-53ab680559d3', 'Dodge'),
('bddbbdc8-c47a-478b-868f-2653e329b63c', 'Pontiac'),
('c1e508ed-ce38-4709-9cba-2f46f9a37e1c', 'Chevrolet'),
('c87e93fe-7070-49c4-a561-10a55ada6d63', 'GMC'),
('d1bdbc60-79f5-419e-92ff-293082bf5b1b', 'Pontiac'),
('da2ed27f-1797-44f3-b9a0-86682aca80a3', 'Ferrary'),
('f066cfdc-eca5-4a4c-96ed-404b170fa0d5', 'Lexus'),
('f9d5de20-4c38-4f61-afec-85b76aef3759', 'Plymouth');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cars`
--

CREATE TABLE `cars` (
  `id` varchar(36) COLLATE utf8_spanish_ci NOT NULL,
  `registration` varchar(7) COLLATE utf8_spanish_ci NOT NULL,
  `description` varchar(256) COLLATE utf8_spanish_ci NOT NULL,
  `model_id` varchar(36) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cars`
--

INSERT INTO `cars` (`id`, `registration`, `description`, `model_id`) VALUES
('3d393a23-eec4-475c-a250-eacdc4789243', 'AMB2018', 'carro nuevo', '11d9afad-b1c6-4bc4-9b4d-36e7a7b89c96'),
('6fceb56c-53be-4036-9f1f-49b294908d03', 'TYR1991', 'carro', '0148127b-3efb-49d6-a4d9-c4bd0415f0c9'),
('b23dd848-64f3-4285-a0da-d423945283bc', 'SWI5110', 'caroooo', '81ae7a56-257d-47ce-809d-e9a9e63557c3'),
('da7fb186-d4f7-467a-bc6b-9a47cd81aa04', 'PLA9938', 'carro', 'b3440cd4-ed44-40ba-959b-a0fb6651cfe8');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colors`
--

CREATE TABLE `colors` (
  `id` varchar(36) COLLATE utf8_spanish_ci NOT NULL,
  `name` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `car_id` varchar(36) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `colors`
--

INSERT INTO `colors` (`id`, `name`, `car_id`) VALUES
('22805299-78b3-493b-8ae4-f56e849a14dd', 'amarillo', '3d393a23-eec4-475c-a250-eacdc4789243'),
('2f728ff0-b678-4fba-a6fe-aa1b86875598', 'red', 'da7fb186-d4f7-467a-bc6b-9a47cd81aa04'),
('6aa93266-b1c4-4537-9989-755482c82335', 'rojo ferrari', '3d393a23-eec4-475c-a250-eacdc4789243'),
('98b3c229-ec52-4e8b-9ea6-8352722ff033', 'azul electrico', '3d393a23-eec4-475c-a250-eacdc4789243'),
('ba2d10c6-8bc2-4783-b406-c5a13ea90238', 'plata', 'b23dd848-64f3-4285-a0da-d423945283bc'),
('d871a510-0489-45d8-9528-0693b5a6afab', 'blue', '6fceb56c-53be-4036-9f1f-49b294908d03'),
('eac5a0c3-99c8-4c69-b2fc-f915fe19cd37', 'oro', 'b23dd848-64f3-4285-a0da-d423945283bc');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `models`
--

CREATE TABLE `models` (
  `id` varchar(36) COLLATE utf8_spanish_ci NOT NULL,
  `name` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `brand_id` varchar(36) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `models`
--

INSERT INTO `models` (`id`, `name`, `brand_id`) VALUES
('0148127b-3efb-49d6-a4d9-c4bd0415f0c9', 'Boxster', '4d76f676-60b0-495a-bb54-0bf47aa8cae9'),
('01a27ef8-0754-4a06-8dbb-1ff023206908', 'cavalier', 'b51d0605-5806-4a07-a170-53ab680559d3'),
('0725668a-3a18-45e5-9f9d-05474b23431d', 'Continental', 'f066cfdc-eca5-4a4c-96ed-404b170fa0d5'),
('105ec3a0-7255-4f8e-a79c-58417b7bdc75', 'G8', 'b51d0605-5806-4a07-a170-53ab680559d3'),
('119fa5dc-ec4f-49de-bcb9-421af7684452', 'Q7', 'bddbbdc8-c47a-478b-868f-2653e329b63c'),
('11d9afad-b1c6-4bc4-9b4d-36e7a7b89c96', 'F150', 'b51d0605-5806-4a07-a170-53ab680559d3'),
('14d9b72c-d0cc-4c83-83ee-a1afcc4c6968', 'LR3', '4d76f676-60b0-495a-bb54-0bf47aa8cae9'),
('1c2f0061-b560-43af-86b0-c8777a9f482b', 'Escort', 'd1bdbc60-79f5-419e-92ff-293082bf5b1b'),
('1c697058-4ee1-4164-a85a-c0f61f8caed9', 'M', '4d76f676-60b0-495a-bb54-0bf47aa8cae9'),
('1e0a6755-5102-48c5-8145-b42bde8ee3c9', 'Fox', '4d76f676-60b0-495a-bb54-0bf47aa8cae9'),
('23a0eeea-b1ba-45f8-841d-d1046227ed49', 'Avenger', 'd1bdbc60-79f5-419e-92ff-293082bf5b1b'),
('345029af-6d2c-48ec-96f2-4c7f8d75a24f', 'Sebring', 'b51d0605-5806-4a07-a170-53ab680559d3'),
('357a9dbc-b95b-4fad-8102-c6c40e510558', 'Escort', 'b51d0605-5806-4a07-a170-53ab680559d3'),
('36f3840a-30e3-4f10-99fb-28d31a68113c', 'Caravan', 'bddbbdc8-c47a-478b-868f-2653e329b63c'),
('37af397d-e19e-400d-8dd3-754edfc068af', 'Monaro', 'f066cfdc-eca5-4a4c-96ed-404b170fa0d5'),
('3beb9d46-24eb-4c6a-9406-831d74d947c8', 'Elise', 'f066cfdc-eca5-4a4c-96ed-404b170fa0d5'),
('431bd06e-dee1-4267-82ad-4517b10da0cc', 'Sky', 'f9d5de20-4c38-4f61-afec-85b76aef3759'),
('44bdf031-3ba7-48c4-8ef6-cd890e4c811d', '626', 'c87e93fe-7070-49c4-a561-10a55ada6d63'),
('44c4258c-9d8d-4919-87e5-4b710d24045c', 'Torrent', 'b51d0605-5806-4a07-a170-53ab680559d3'),
('45839634-63d8-40e2-94d7-c5cdb5d356cb', 'Montero', '55fc0810-ffe1-476c-82ff-669c2c0a40aa'),
('49b25c75-28af-467f-921a-59492d8df6e5', 'Town & Country', 'b51d0605-5806-4a07-a170-53ab680559d3'),
('4d21af8e-19c8-4c3a-9427-95f24cec9494', 'Explorer Sport Trac', '55fc0810-ffe1-476c-82ff-669c2c0a40aa'),
('4ef41a3d-5e78-4f35-880d-88ced5a7c2a7', 'Pathfinder', 'bddbbdc8-c47a-478b-868f-2653e329b63c'),
('56feea4a-158f-4ab8-bef8-693debe3e3e3', 'Escape', '4d76f676-60b0-495a-bb54-0bf47aa8cae9'),
('57121016-f5ee-4bf4-8a08-8c422c4eef6b', 'Prius', 'f066cfdc-eca5-4a4c-96ed-404b170fa0d5'),
('57ff1fa6-7ba6-4f74-abe2-631d89617fbf', 'Z3', 'f9d5de20-4c38-4f61-afec-85b76aef3759'),
('59a45b6e-13cd-4d1a-b05a-08efed7d18a1', 'Mariner', 'f9d5de20-4c38-4f61-afec-85b76aef3759'),
('5a724595-4a2b-42d0-9f32-037417bd92f4', 'Tracer', 'c1e508ed-ce38-4709-9cba-2f46f9a37e1c'),
('5b5838f7-139f-430e-8236-4dd39dd16c53', 'DTS', '55fc0810-ffe1-476c-82ff-669c2c0a40aa'),
('606e6ab2-32c1-4853-923a-38891c505a6d', 'Q', 'b51d0605-5806-4a07-a170-53ab680559d3'),
('62b851dd-dcb3-460f-88e2-fc287f230027', 'Discovery', 'f9d5de20-4c38-4f61-afec-85b76aef3759'),
('62d02ca8-08d9-4c34-8901-5acadd4521ad', '626', 'c87e93fe-7070-49c4-a561-10a55ada6d63'),
('64c15707-b802-4bdd-9723-93cda96930bb', 'Outback Sport', 'c87e93fe-7070-49c4-a561-10a55ada6d63'),
('6c57e6d5-d7c7-4710-8fc1-ffa286aeb88b', 'Quattroporte', 'c87e93fe-7070-49c4-a561-10a55ada6d63'),
('6cea39eb-5669-479b-839a-2fecbc1b4a7c', 'Sorento', '4d76f676-60b0-495a-bb54-0bf47aa8cae9'),
('71a7fa77-2dca-4c6f-bb59-098365c27f80', 'Viper', 'c1e508ed-ce38-4709-9cba-2f46f9a37e1c'),
('737bba50-cde2-4459-99ed-c6377561b8df', 'MX-5', 'f9d5de20-4c38-4f61-afec-85b76aef3759'),
('79289e1b-b581-44e3-9f0c-b8c1e01fb79d', 'Regal', 'f066cfdc-eca5-4a4c-96ed-404b170fa0d5'),
('7a1c855d-862f-4766-acce-1c138e58e2b7', 'S-Series', 'c1e508ed-ce38-4709-9cba-2f46f9a37e1c'),
('7aee1f8b-0af8-4eca-b60a-ab903df757ca', 'Cavalier', 'f066cfdc-eca5-4a4c-96ed-404b170fa0d5'),
('7f0017ff-3799-4ee8-a434-e7240b84cd34', 'X5', 'f9d5de20-4c38-4f61-afec-85b76aef3759'),
('81ae7a56-257d-47ce-809d-e9a9e63557c3', 'MR2', 'f066cfdc-eca5-4a4c-96ed-404b170fa0d5'),
('821568ac-3ab7-4b91-a7f3-59b148ae34b9', 'Altima', 'c1e508ed-ce38-4709-9cba-2f46f9a37e1c'),
('82a14f4b-290a-4257-b683-30adee1f1b20', 'Silverado 1500', 'bddbbdc8-c47a-478b-868f-2653e329b63c'),
('832101fc-318c-4651-a4e1-33517f9b58ad', 'Grand Marquis', '4d76f676-60b0-495a-bb54-0bf47aa8cae9'),
('83d1688e-210d-4fc8-a1a2-3ee80b53eaf6', 'LeMans', '4d76f676-60b0-495a-bb54-0bf47aa8cae9'),
('83f8720d-273c-4a88-9fef-b41d93b41123', 'Scoupe', '55fc0810-ffe1-476c-82ff-669c2c0a40aa'),
('85ec25a0-ac6b-421b-95d5-8737bb2520b8', 'SLK-Class', 'f9d5de20-4c38-4f61-afec-85b76aef3759'),
('8a8f9f74-f180-4ce0-acca-c5a3a550a11d', 'Navigator', '8b6ad591-ec67-4c6f-8550-87aae0492e52'),
('902d2f96-6a7d-4253-ad5c-b7a9497eca2e', 'Tacoma', '55fc0810-ffe1-476c-82ff-669c2c0a40aa'),
('94cda631-6833-4295-a71f-3da97dea9a5d', '200', 'b51d0605-5806-4a07-a170-53ab680559d3'),
('98ff3aba-d282-4b0b-91b5-02f803ea06ae', 'Solara', 'c1e508ed-ce38-4709-9cba-2f46f9a37e1c'),
('997c73e2-ffd5-46d9-8a51-c3e4f3432528', 'Jimmy', '8b6ad591-ec67-4c6f-8550-87aae0492e52'),
('9ad824dc-338c-4fdf-9f8b-c689ed5ee005', 'Grand Cherokee', '4d76f676-60b0-495a-bb54-0bf47aa8cae9'),
('9e386518-f36c-4c24-91ca-0866ce2d23ed', 'Aries', '4d76f676-60b0-495a-bb54-0bf47aa8cae9'),
('9f3704cb-b764-467c-bb88-69792dbf9e82', 'Durango', 'f066cfdc-eca5-4a4c-96ed-404b170fa0d5'),
('a548e16d-0b7b-419e-88cc-4c99fbeea98d', 'Express 2500', '55fc0810-ffe1-476c-82ff-669c2c0a40aa'),
('ab3d04cb-a757-4f17-aaf1-299ed3302643', 'C70', 'b51d0605-5806-4a07-a170-53ab680559d3'),
('ad7b40b5-dece-4936-a44d-f18824b68efd', 'Grand Cherokee', 'd1bdbc60-79f5-419e-92ff-293082bf5b1b'),
('b1617f7a-8de5-4974-a97a-431b6d4d5dbc', 'LS Hybrid', 'bddbbdc8-c47a-478b-868f-2653e329b63c'),
('b3440cd4-ed44-40ba-959b-a0fb6651cfe8', 'X5', 'c1e508ed-ce38-4709-9cba-2f46f9a37e1c'),
('b4483c16-4237-45b7-a0ef-7824e632e18b', 'Escalade ESV', 'b51d0605-5806-4a07-a170-53ab680559d3'),
('ba248541-389c-4a95-b095-2ce252efb788', 'Sportvan G30', 'bddbbdc8-c47a-478b-868f-2653e329b63c'),
('ba9989cc-5929-4f5b-8a45-a3c142ee97b5', 'del Sol', '55fc0810-ffe1-476c-82ff-669c2c0a40aa'),
('baf7794f-52fd-40ad-8c6f-7a22ba7b6510', '2CV', 'c87e93fe-7070-49c4-a561-10a55ada6d63'),
('bc008652-ce7f-41d5-a0f9-b1fd4f2098e1', 'Defender 90', 'f9d5de20-4c38-4f61-afec-85b76aef3759'),
('bc30d45f-760a-4b01-b487-1465ac1eb195', 'G', '8b6ad591-ec67-4c6f-8550-87aae0492e52'),
('bd3d0195-0b80-41c7-aabe-5dd9953a6576', 'DB9 Volante', 'b51d0605-5806-4a07-a170-53ab680559d3'),
('bdab1df3-dadd-46cb-9aa6-e4f931739626', 'Sportage', '8b6ad591-ec67-4c6f-8550-87aae0492e52'),
('c057b957-0700-4102-8ed8-700f8bb87f09', 'Land Cruiser', '55fc0810-ffe1-476c-82ff-669c2c0a40aa'),
('c11284e2-1240-442f-939b-c10818e96f5f', 'LS', 'f9d5de20-4c38-4f61-afec-85b76aef3759'),
('c1ed96af-a431-4b79-8e5c-02ac487da9ec', 'Caravan', '55fc0810-ffe1-476c-82ff-669c2c0a40aa'),
('c39a93d2-1632-4fbc-9668-aaa62eca0869', '924 S', 'c87e93fe-7070-49c4-a561-10a55ada6d63'),
('c41d92e1-b373-464f-aaa1-8d468151512d', 'Cougar', '55fc0810-ffe1-476c-82ff-669c2c0a40aa'),
('c4dc577e-46f4-4e0c-b50a-da363cfbab5d', 'Accord', '8b6ad591-ec67-4c6f-8550-87aae0492e52'),
('c4e95549-d01e-4ed9-94e5-6b9f5a1a3c72', 'Rio', 'b51d0605-5806-4a07-a170-53ab680559d3'),
('c5a3f392-d183-4027-a653-c95b5f627cac', 'Terraza', '55fc0810-ffe1-476c-82ff-669c2c0a40aa'),
('c6a155b4-f1da-4eba-848e-90e370991f8f', 'M3', 'c87e93fe-7070-49c4-a561-10a55ada6d63'),
('c70bec16-be94-407d-9890-e6b12df2617a', 'Seville', 'c1e508ed-ce38-4709-9cba-2f46f9a37e1c'),
('c885d064-62ea-4d19-8fcf-4917661cd70f', 'Endeavor', '8b6ad591-ec67-4c6f-8550-87aae0492e52'),
('c8979116-22bd-4308-ac64-7227c3152b79', '57', 'f066cfdc-eca5-4a4c-96ed-404b170fa0d5'),
('ca3eee91-ff40-4f89-9613-4ff8c4a85bd8', 'Grand Prix', 'c87e93fe-7070-49c4-a561-10a55ada6d63'),
('cddb6e67-10ed-4d3c-a8a4-8a4293715b2f', 'Cutlass Supreme', 'f066cfdc-eca5-4a4c-96ed-404b170fa0d5'),
('cea7149c-aa72-48fc-9ff3-8fe3fb617471', '350Z', 'f9d5de20-4c38-4f61-afec-85b76aef3759'),
('d5019efe-698b-41bf-b7be-b941146b9d64', 'Thunderbird', 'd1bdbc60-79f5-419e-92ff-293082bf5b1b'),
('d79d379f-6587-4d83-abad-94615be4464e', 'Elantra', '4d76f676-60b0-495a-bb54-0bf47aa8cae9'),
('d958c738-2c2a-47c4-bd00-2920c3a54016', 'SC', '55fc0810-ffe1-476c-82ff-669c2c0a40aa'),
('d9d7bb63-0912-4acd-89d5-6fd9bd829dac', 'Roadmaster', '55fc0810-ffe1-476c-82ff-669c2c0a40aa'),
('dbcdd767-6d19-43c3-986f-4251c2701670', 'Riviera', 'd1bdbc60-79f5-419e-92ff-293082bf5b1b'),
('de1c4f4d-6afc-4d8a-b8bd-4bbdee875f21', 'Montana', 'c1e508ed-ce38-4709-9cba-2f46f9a37e1c'),
('de847599-8b33-4cb2-be93-f616bb87a606', 'Mark VIII', 'f9d5de20-4c38-4f61-afec-85b76aef3759'),
('e6bebd49-8699-4108-b2ec-87b8cd730635', 'F350', '8b6ad591-ec67-4c6f-8550-87aae0492e52'),
('e808caef-c84d-4322-8f04-e293262ed32b', 'Elantra', 'f9d5de20-4c38-4f61-afec-85b76aef3759'),
('ed1bb81a-b2d8-4e77-bf41-8e0a5da36d59', 'Sonoma', 'bddbbdc8-c47a-478b-868f-2653e329b63c'),
('ed333b6e-cd57-4557-bd72-fc619ef89248', 'Yukon XL 1500', 'c1e508ed-ce38-4709-9cba-2f46f9a37e1c'),
('eef76e3d-5760-42b5-aecd-a6d84855db15', 'Insight', '8b6ad591-ec67-4c6f-8550-87aae0492e52'),
('efb40873-41d5-4dd5-a233-5605f163e4b4', 'Cutlass Supreme', 'c87e93fe-7070-49c4-a561-10a55ada6d63'),
('f2434338-c015-41f5-8e19-fd88d4b87851', 'Grand Prix', 'f9d5de20-4c38-4f61-afec-85b76aef3759'),
('f27c4b83-cdc5-44ba-bb1e-b5ac60097a23', 'E250', 'bddbbdc8-c47a-478b-868f-2653e329b63c'),
('f3709309-1df5-49cb-9eda-3a42ccc0b1a4', 'GLK-Class', '4d76f676-60b0-495a-bb54-0bf47aa8cae9'),
('f3f43525-7529-4a33-9040-96e4e702b37c', 'Thunderbird', '55fc0810-ffe1-476c-82ff-669c2c0a40aa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parking`
--

CREATE TABLE `parking` (
  `id` varchar(36) COLLATE utf8_spanish_ci NOT NULL,
  `floor` int(11) NOT NULL,
  `place` int(11) NOT NULL,
  `occupied` int(11) NOT NULL,
  `input` datetime NOT NULL,
  `output` datetime DEFAULT NULL,
  `car_id` varchar(36) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `parking`
--

INSERT INTO `parking` (`id`, `floor`, `place`, `occupied`, `input`, `output`, `car_id`) VALUES
('1cb7a858-e4f6-4e86-b337-72ba720a528b', 1, 1, 1, '2023-08-18 03:02:33', NULL, 'da7fb186-d4f7-467a-bc6b-9a47cd81aa04'),
('9277e1b3-e920-4adc-b996-80c198162642', 4, 8, 1, '2023-08-18 04:04:41', NULL, 'b23dd848-64f3-4285-a0da-d423945283bc'),
('92a36737-3b1e-4932-b010-500f3d69f4bc', 5, 10, 1, '2023-08-18 03:03:23', NULL, '6fceb56c-53be-4036-9f1f-49b294908d03'),
('a40736a0-1f7e-40fd-92e7-ffb8ddf505bd', 2, 1, 0, '2023-08-17 04:43:55', '2023-08-18 03:43:28', '3d393a23-eec4-475c-a250-eacdc4789243'),
('dccafc5d-df0f-4a66-bc0d-1b661e08ee0d', 3, 7, 0, '2023-08-18 03:43:51', '2023-08-18 03:44:49', 'da7fb186-d4f7-467a-bc6b-9a47cd81aa04'),
('f4948173-47fd-4f86-b916-ff43a4446abb', 1, 1, 0, '2023-08-17 02:45:52', '2023-08-17 03:41:19', '3d393a23-eec4-475c-a250-eacdc4789243'),
('fb9d2495-6a74-4f2f-b5cf-b00bf5503f1d', 3, 4, 1, '2023-08-18 03:45:06', NULL, 'da7fb186-d4f7-467a-bc6b-9a47cd81aa04');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `registration` (`registration`),
  ADD KEY `car_model_id` (`model_id`);

--
-- Indices de la tabla `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `color_car_id` (`car_id`);

--
-- Indices de la tabla `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`id`),
  ADD KEY `model_brand_id` (`brand_id`);

--
-- Indices de la tabla `parking`
--
ALTER TABLE `parking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parking_car_id` (`car_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `car_model_id` FOREIGN KEY (`model_id`) REFERENCES `models` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `colors`
--
ALTER TABLE `colors`
  ADD CONSTRAINT `color_car_id` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `models`
--
ALTER TABLE `models`
  ADD CONSTRAINT `model_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `parking`
--
ALTER TABLE `parking`
  ADD CONSTRAINT `parking_car_id` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
