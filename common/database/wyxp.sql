-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2017-09-08 14:43:52
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
(1, '南山忆', 1, 6, '/uploads/cover/59b213a856c60_vae.jpg', '<p><img src="https://gss0.bdstatic.com/-4o3dSag_xI4khGkpoWK1HF6hhy/baike/s%3D250/sign=2b9cb7f7d933c895a27e9f7ee1127397/267f9e2f070828383b881c74b899a9014d08f1cd.jpg"/></p><p><br/></p><p>乘一叶扁舟 入景随风望江畔渔火</p><p>转竹林深处 残碑小筑僧侣始复诵</p><p>苇岸红亭中 抖抖绿蓑邀南山对酌</p><p>纸钱晚风送 谁家又添新痛</p><p>独揽月下萤火 照亮一纸寂寞</p><p>追忆那些什么 你说的爱我</p><p>花开后花又落 轮回也没结果</p><p>苔上雪告诉我 你没归来过</p><p>遥想多年前 烟花满天 你静静抱着我</p><p>丝竹声悠悠 教人忘忧 若南柯一梦</p><p>星斗青光透 时无英雄 心猿已深锁</p><p>可你辞世后 我再也没笑过</p><p>独揽月下萤火 照亮一纸寂寞</p><p>追忆那些什么 你说的爱我</p><p>花开后花又落 轮回也没结果</p><p>苔上雪告诉我 你没归来过独揽月下萤火</p><p>照亮一纸寂寞</p><p>追忆那些什么 你说的爱我</p><p>花开后花又落 轮回也没结果</p><p>苔上雪告诉我 你没归来过</p><p>花开后花又落 轮回也没结果</p><p>苔上雪告诉我 你没归来过</p><p><br/></p>', 0, 1, 1504777005, 1504851798);

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
(6, 2, 'Music', 'life/index?c=音乐', '', 0, 1, 1504767036, 1504767036),
(7, 2, 'Movie', 'life/index?c=电影', '', 0, 1, 1504767076, 1504767076);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
