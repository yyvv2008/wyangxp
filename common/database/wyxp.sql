-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2017-09-20 17:49:09
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
(1, 'PHP', 1, 4, '/uploads/cover/59c1c4a64ffe9_php-logo.svg', '~~~php \r\n    echo \'hello world\';\r\n~~~ \r\n', 0, 1, 1504861817, 1505883928),
(2, 'PHP7.0后，curl 上传文件', 1, 4, NULL, '~~~php \r\n$url = \'localhost/upload.php\';\r\n\r\n$file = realpath(\'./test.txt\');\r\n\r\n$post_datas = [\r\n    \'title\' => \'picture\',\r\n    \'img\' => new \\CURLFile($file),\r\n];\r\n\r\n$ch = curl_init();\r\n\r\n$options = [\r\n    CURLOPT_URL => $url,\r\n    CURLOPT_RETURNTRANSFER => 1,\r\n    CURLOPT_POST => 1,\r\n    CURLOPT_POSTFIELDS => $post_datas,\r\n    CURLOPT_TIMEOUT => 30,\r\n];\r\ncurl_setopt_array($ch, $options);\r\n\r\n$res = curl_exec($ch);\r\n$error = curl_error($ch);\r\n\r\ncurl_close($ch);\r\n~~~  \r\n\r\nwin环境不支持多线程，要在linux下测试，妈蛋！妈蛋！妈蛋！', 0, 1, 1505095745, 1505895739),
(3, 'Git 使用笔记', 1, 100, NULL, '别名设置：\r\n~~~git \r\n    git config --global alias.st status\r\n    git config --global alias.br branch\r\n    git config --global alias.ci commit\r\n    git config --global alias.co checkout\r\n~~~  \r\n- - -\r\n重设URL：\r\n~~~git \r\n    git remote set-url origin URL\r\n~~~  \r\n- - -\r\n日志查看：\r\n~~~php\r\n    git log --pretty="%h-%an, %ar:%s"\r\n    ## 显示如下：\r\n    $ git log --pretty="%h-%an, %ar:%s"\r\n    2f53086-wyang, 3 hours ago:\'pjax + ueditor + markdown\'\r\n    91e7f18-wyang, 19 hours ago:\'update\'\r\n    ca0bfc8-wyang, 23 hours ago:\'update\'\r\n    c944795-wyang, 2 days ago:\'add markdown\'\r\n    7be4314-wyang, 2 days ago:Merge remote-tracking branch \'origin/master\'\r\n\r\n    ## 查看全部版本号\r\n    git reflog\r\n~~~\r\n- - -\r\n取消add过的内容文件：\r\n~~~php \r\n    git reset HEAD -- test.php\r\n~~~  \r\n- - -\r\n版本回退：\r\n~~~git \r\n    git reset --hard HEAD (^/^^/~100)\r\n    git reset --hard 版本号\r\n~~~  \r\n- - -\r\n撤消合并：\r\n~~~git \r\n    git reset --merge\r\n~~~  \r\n- - -\r\n标签：\r\n~~~git \r\n    ## 给某个提交打标签\r\n    git tag **tagName** commitId\r\n    ## 查看所有标签\r\n    git tag\r\n~~~  \r\n- - -\r\n 指定本地分支dev与远程分支origin/dev链接：\r\n~~~git \r\n    git branch --set-upstream dev origin/dev\r\n~~~  \r\n- - -\r\n重新提交：\r\n~~~git \r\n    git commit --amend\r\n~~~  \r\n- - -\r\n查看工作区：\r\n~~~git \r\n    git stash list\r\n    ## 隐藏当前工作区\r\n    git stash\r\n    ## 恢复并删除stash内容  =>  恢复  +  删除\r\n    git stash pop  =>  git stash apply  +  git stash drop\r\n~~~  \r\n- - -\r\n~~~git \r\n    # 执行命令将db.php加入不提交队列\r\n    git update-index --assume-unchanged include/db.php\r\n    # 执行命令将db.php取消加入不提交队列\r\n    git update-index --no-assume-unchanged include/db.php\r\n~~~  ', 0, 1, 1505896065, 1505897152),
(4, 'OSI七层协议', 1, 100, NULL, '### OSI七层协议： ###\r\n    应用层－－> 定义应用程序传送数据的接口\r\n    表现层－－> 编码数据包\r\n    会谈层－－> 建立网络联机的确认\r\n    传送层－－> 确认封包协议（TCP、UDP）\r\n    网络层－－> 确认封包数据路由（IP）\r\n    链结层－－> 将数据包转换成MAC格式（Media Access Control） \r\n    {\r\n        IEEE 802.3 的标准 CSMA/CD (Carrier Sense Multiple Access with Collision Detection)\r\n        MAC 其实就是我们上面一直讲到的讯框 (frame)[CSMA/CD()传送出去的讯框数据] 啰！\r\n        只是这个讯框上面有两个很重要的数据，就是目标与来源的网卡卡号，因此我们又简称网卡卡号为 MAC 而已只是这个讯框上面有两个很重要的数据，就是目标与来源的网卡卡号，因此我们又简称网卡卡号为 MAC 而已\r\n    }\r\n    物理层－－> 以帧的方式发送MAC格式的数据包\r\n### TCP/IP: ###\r\n![asdfsdf](http://wyangxp_admin/images/TCP&IP.png "enter image title here")\r\n\r\n摘自：[鸟哥的Linux私房菜](http://cn.linux.vbird.org/linux_server/0110network_basic.php)', 0, 1, 1505898260, 1505899446),
(5, 'mysql 学习笔记', 1, 9, NULL, '>  SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,\'ONLY_FULL_GROUP_BY\',\'\'));\r\n\r\n默认值为：ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION\r\n- - -\r\n\r\n~~~mysql \r\n  ## 设置环境变量：\r\n  select @@global.socket;\r\n  show variables like \'socket\';\r\n  ## 设置最大连接时间\r\n  SET GLOBAL max_connections = 1000;\r\n  SET @@global.max_connections = 1000;\r\n  备份：mysqldump -u root -p 库.表 > 路径\r\n  导入：mysql -u root -p 库.表 < 路径\r\n~~~  \r\n\r\nwindows下手动安装MySQL：\r\n\r\n1、先将my.default.ini改名为my.ini放到bin目录\r\n\r\n\r\n2、命令行执行: mysqld --initialize --user=mysql --console\r\n\r\n3、先执行以上命令, 生成库. 注意有个临时密码, 要记下来.\r\n\r\n4、mysql bin目录输入: mysqld --install 安装服务，然后启动服务\r\n\r\n5、命令行:mysql -uroot -p\r\n\r\n6、然后我们就可以修改mysql的root密码了\r\n~~~mysql \r\n  命令行执行命令：mysqladmin -u USER -p password PASSWORD\r\n~~~  \r\n', 0, 1, 1505899837, 1505900387),
(6, 'nginx_reload.bat', 1, 100, NULL, '~~~php \r\n@echo off\r\necho Stopping nginx...\r\ntaskkill /F /IM nginx.exe > nul\r\necho Stopping PHP FastCGI...\r\ntaskkill /F /IM php-cgi.exe > nul\r\necho Starting PHP FastCGI...\r\nC:\\wnmp\\RunHiddenConsole.exe C:\\wnmp\\PHP\\php-cgi.exe -b 127.0.0.1:9000-c C:\\wnmp\\PHP\\php-cli.ini\r\necho Starting nginx...\r\nC:\\wnmp\\RunHiddenConsole.exe C:\\wnmp\\nginx\\nginx.exe -p C:\\wnmp\\nginx\r\nexit\r\n~~~  \r\n', 0, 1, 1505900478, 1505900478),
(7, '几个小知识点', 1, 100, NULL, 'sublime 几个常用插件**Emmet	SublimeLinter  PackageResourceViewer  Git	 Alignment  Snippets  SublimeCodeIntel**\r\n- - -\r\nVim     ` :%s/old/new/g			替换全部的old为new`\r\n- - -\r\nRedis      `config set stop-writes-on-bgsave-error no`\r\n', 0, 1, 1505900769, 1505900880);

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
(1, '南山忆', 1, 6, '/uploads/cover/59c1f5e196545_vae.jpg', '<p style="text-align: center;"><img src="/uploads/ueditor/images/20170920/150588396379592895.jpg" title="150588396379592895.jpg" alt="南山忆.jpg"/></p><p><br/></p><p style="text-align: center;">乘一叶扁舟 入景随风望江畔渔火</p><p style="text-align: center;">转竹林深处 残碑小筑僧侣始复诵</p><p style="text-align: center;">苇岸红亭中 抖抖绿蓑邀南山对酌</p><p style="text-align: center;">纸钱晚风送 谁家又添新痛</p><p style="text-align: center;">独揽月下萤火 照亮一纸寂寞</p><p style="text-align: center;">追忆那些什么 你说的爱我</p><p style="text-align: center;">花开后花又落 轮回也没结果</p><p style="text-align: center;">苔上雪告诉我 你没归来过</p><p style="text-align: center;">遥想多年前 烟花满天 你静静抱着我</p><p style="text-align: center;">丝竹声悠悠 教人忘忧 若南柯一梦</p><p style="text-align: center;">星斗青光透 时无英雄 心猿已深锁</p><p style="text-align: center;">可你辞世后 我再也没笑过</p><p style="text-align: center;">独揽月下萤火 照亮一纸寂寞</p><p style="text-align: center;">追忆那些什么 你说的爱我</p><p style="text-align: center;">花开后花又落 轮回也没结果</p><p style="text-align: center;">苔上雪告诉我 你没归来过独揽月下萤火</p><p style="text-align: center;">照亮一纸寂寞</p><p style="text-align: center;">追忆那些什么 你说的爱我</p><p style="text-align: center;">花开后花又落 轮回也没结果</p><p style="text-align: center;">苔上雪告诉我 你没归来过</p><p style="text-align: center;">花开后花又落 轮回也没结果</p><p style="text-align: center;">苔上雪告诉我 你没归来过.</p><p><br/></p>', 0, 1, 1504777005, 1505883966);

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
(7, 2, 'Movie', 'life/index?c=Movie', '', 0, 1, 1504767076, 1504863361),
(8, 3, 'Js', 'learning/index?c=js', '', 0, 1, 1505095527, 1505095527),
(9, 3, 'SQL', '/learning/index?c=SQL', '', 0, 1, 1505897610, 1505897610),
(100, 3, '其它', '/learning/index?c=其它', '', 0, 1, 1505895932, 1505895932);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `life`
--
ALTER TABLE `life`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
