-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2017-09-08 17:40:35
-- 服务器版本： 5.7.16-log
-- PHP Version: 7.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wyxp`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL COMMENT '名称',
  `auth_key` varchar(32) NOT NULL COMMENT '认证',
  `password_hash` varchar(255) NOT NULL COMMENT '密码',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `status` int(11) NOT NULL DEFAULT '10' COMMENT '状态',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理';

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`id`, `username`, `auth_key`, `password_hash`, `email`, `avatar`, `status`, `created_at`, `updated_at`) VALUES
(1, 'wyang', 'UjZvcS2VX6tpMLB9-SfbN3w9ncTqmuhm', '$2y$13$ZoYZWjSiJzNMxZtd6grLTudrOm4ysAdCTRXFppE.Ang7kXNs3obCe', '591012658@qq.com', NULL, 10, 1504664227, 1504664227);

-- --------------------------------------------------------

--
-- 表的结构 `learning`
--

CREATE TABLE `learning` (
  `id` int(11) NOT NULL,
  `title` varchar(60) NOT NULL COMMENT '标题',
  `uid` int(11) NOT NULL COMMENT '作者',
  `cid` int(11) NOT NULL COMMENT '分类',
  `cover` varchar(255) DEFAULT '' COMMENT '封面',
  `content` text NOT NULL COMMENT '内容',
  `remend` int(11) NOT NULL DEFAULT '0' COMMENT '推荐',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `learning`
--

INSERT INTO `learning` (`id`, `title`, `uid`, `cid`, `cover`, `content`, `remend`, `status`, `created_at`, `updated_at`) VALUES
(1, 'PHP', 1, 4, '/uploads/cover/59b25e9b27d5f_php-logo.svg', '<p style="text-indent: 2em;">PHP is a popular general-purpose scripting language that is especially suited to web development.</p><p style="text-indent: 2em;">Fast, flexible and pragmatic, PHP powers everything from your blog to the most popular websites in the world.</p><p><br/></p><p style="text-indent: 2em;"><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">PHP（外文名:PHP: Hypertext Preprocessor，中文名：“</span><a target="_blank" href="https://baike.baidu.com/item/%E8%B6%85%E6%96%87%E6%9C%AC" style="color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">超文本</a><a target="_blank" href="https://baike.baidu.com/item/%E9%A2%84%E5%A4%84%E7%90%86%E5%99%A8" style="color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">预处理器</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">”）是一种通用</span><a target="_blank" href="https://baike.baidu.com/item/%E5%BC%80%E6%BA%90" style="color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">开源</a><a target="_blank" href="https://baike.baidu.com/item/%E8%84%9A%E6%9C%AC%E8%AF%AD%E8%A8%80" style="color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">脚本语言</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">。</span><a target="_blank" href="https://baike.baidu.com/item/%E8%AF%AD%E6%B3%95" style="color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">语法</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">吸收了</span><a target="_blank" href="https://baike.baidu.com/item/C%E8%AF%AD%E8%A8%80" style="color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">C语言</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">、</span><a target="_blank" href="https://baike.baidu.com/item/Java" style="color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">Java</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">和</span><a target="_blank" href="https://baike.baidu.com/item/Perl" style="color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">Perl</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">的特点，利于学习，使用</span><a target="_blank" href="https://baike.baidu.com/item/%E5%B9%BF%E6%B3%9B" style="color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">广泛</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">，主要适用于</span><a target="_blank" href="https://baike.baidu.com/item/Web" style="color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">Web</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">开发领域。PHP 独特的</span><a target="_blank" href="https://baike.baidu.com/item/%E8%AF%AD%E6%B3%95" style="color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">语法</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">混合了</span><a target="_blank" href="https://baike.baidu.com/item/C" style="color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">C</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">、</span><a target="_blank" href="https://baike.baidu.com/item/Java" style="color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">Java</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">、</span><a target="_blank" href="https://baike.baidu.com/item/Perl" style="color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">Perl</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">以及</span><a target="_blank" href="https://baike.baidu.com/item/PHP" style="color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">PHP</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">自创的语法。它可以比</span><a target="_blank" href="https://baike.baidu.com/item/CGI" style="color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">CGI</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">或者</span><a target="_blank" href="https://baike.baidu.com/item/Perl" style="color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">Perl</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">更快速地执行</span><a target="_blank" href="https://baike.baidu.com/item/%E5%8A%A8%E6%80%81%E7%BD%91%E9%A1%B5" style="color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">动态网页</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">。用PHP做出的</span><a target="_blank" href="https://baike.baidu.com/item/%E5%8A%A8%E6%80%81%E9%A1%B5%E9%9D%A2" style="color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">动态页面</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">与其他的</span><a target="_blank" href="https://baike.baidu.com/item/%E7%BC%96%E7%A8%8B%E8%AF%AD%E8%A8%80" style="color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">编程语言</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">相比，</span><a target="_blank" href="https://baike.baidu.com/item/PHP/9337" data-lemmaid="9337" style="color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">PHP</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">是将</span><a target="_blank" href="https://baike.baidu.com/item/%E7%A8%8B%E5%BA%8F" style="color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">程序</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">嵌入到</span><a target="_blank" href="https://baike.baidu.com/item/HTML" style="color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">HTML</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">（</span><a target="_blank" href="https://baike.baidu.com/item/%E6%A0%87%E5%87%86%E9%80%9A%E7%94%A8%E6%A0%87%E8%AE%B0%E8%AF%AD%E8%A8%80" style="color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">标准通用标记语言</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">下的一个应用）文档中去执行，执行效率比完全生成</span><a target="_blank" href="https://baike.baidu.com/item/HTML" style="color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">HTML</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">标记的</span><a target="_blank" href="https://baike.baidu.com/item/CGI/607810" data-lemmaid="607810" style="color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">CGI</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">要高许多；PHP还可以执行</span><a target="_blank" href="https://baike.baidu.com/item/%E7%BC%96%E8%AF%91" style="color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">编译</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">后代码，编译可以达到</span><a target="_blank" href="https://baike.baidu.com/item/%E5%8A%A0%E5%AF%86" style="color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">加密</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">和</span><a target="_blank" href="https://baike.baidu.com/item/%E4%BC%98%E5%8C%96" style="color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);">优化</a><span style="color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);">代码运行，使代码运行更快。</span></p>', 0, 1, 1504861817, 1504861851);

-- --------------------------------------------------------

--
-- 表的结构 `life`
--

CREATE TABLE `life` (
  `id` int(11) NOT NULL,
  `title` varchar(60) NOT NULL COMMENT '标题',
  `uid` int(11) NOT NULL COMMENT '作者',
  `cid` int(11) NOT NULL COMMENT '分类',
  `cover` varchar(255) DEFAULT NULL COMMENT '封面',
  `content` text NOT NULL COMMENT '内容',
  `remend` int(11) NOT NULL DEFAULT '0' COMMENT '推荐',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='生活';

--
-- 转存表中的数据 `life`
--

INSERT INTO `life` (`id`, `title`, `uid`, `cid`, `cover`, `content`, `remend`, `status`, `created_at`, `updated_at`) VALUES
(1, '南山忆', 1, 6, '/uploads/cover/59b213a856c60_vae.jpg', '<p style="text-align: center;"><img src="https://gss0.bdstatic.com/-4o3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D250/sign=2b9cb7f7d933c895a27e9f7ee1127397/267f9e2f070828383b881c74b899a9014d08f1cd.jpg"/></p><p><br/></p><p style="text-align: center;">乘一叶扁舟 入景随风望江畔渔火</p><p style="text-align: center;">转竹林深处 残碑小筑僧侣始复诵</p><p style="text-align: center;">苇岸红亭中 抖抖绿蓑邀南山对酌</p><p style="text-align: center;">纸钱晚风送 谁家又添新痛</p><p style="text-align: center;">独揽月下萤火 照亮一纸寂寞</p><p style="text-align: center;">追忆那些什么 你说的爱我</p><p style="text-align: center;">花开后花又落 轮回也没结果</p><p style="text-align: center;">苔上雪告诉我 你没归来过</p><p style="text-align: center;">遥想多年前 烟花满天 你静静抱着我</p><p style="text-align: center;">丝竹声悠悠 教人忘忧 若南柯一梦</p><p style="text-align: center;">星斗青光透 时无英雄 心猿已深锁</p><p style="text-align: center;">可你辞世后 我再也没笑过</p><p style="text-align: center;">独揽月下萤火 照亮一纸寂寞</p><p style="text-align: center;">追忆那些什么 你说的爱我</p><p style="text-align: center;">花开后花又落 轮回也没结果</p><p style="text-align: center;">苔上雪告诉我 你没归来过独揽月下萤火</p><p style="text-align: center;">照亮一纸寂寞</p><p style="text-align: center;">追忆那些什么 你说的爱我</p><p style="text-align: center;">花开后花又落 轮回也没结果</p><p style="text-align: center;">苔上雪告诉我 你没归来过</p><p style="text-align: center;">花开后花又落 轮回也没结果</p><p style="text-align: center;">苔上雪告诉我 你没归来过</p><p><br/></p>', 0, 1, 1504777005, 1504862763);

-- --------------------------------------------------------

--
-- 表的结构 `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(45) NOT NULL COMMENT '标题',
  `url` varchar(45) NOT NULL COMMENT '路由',
  `icon` varchar(45) DEFAULT 'fa fa-th-list',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '类型',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  `created_at` int(11) NOT NULL COMMENT '创建时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='菜单';

--
-- 转存表中的数据 `menu`
--

INSERT INTO `menu` (`id`, `parent_id`, `name`, `url`, `icon`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, '菜单', 'menu/index', 'fa fa-th-list', 0, 1, 1504664227, 1504766018),
(2, 0, '生活', 'life/index', 'fa fa-coffee', 0, 1, 1504664227, 1504664227),
(3, 0, '学习', 'learning/index', 'fa fa-book', 0, 1, 1504664227, 1504664227),
(4, 3, 'PHP', 'learning/index?c=PHP', 'fa fa-th-list', 0, 1, 1504664227, 1504747575),
(5, 3, 'Linux', 'learning/index?c=linux', '', 0, 1, 1504694559, 1504747583),
(6, 2, 'Music', 'life/index?c=Music', '', 0, 1, 1504767036, 1504863353),
(7, 2, 'Movie', 'life/index?c=Movie', '', 0, 1, 1504767076, 1504863361);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- Indexes for table `learning`
--
ALTER TABLE `learning`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `life`
--
ALTER TABLE `life`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `learning`
--
ALTER TABLE `learning`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `life`
--
ALTER TABLE `life`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
