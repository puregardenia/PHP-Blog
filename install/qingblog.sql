-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2016 年 10 月 04 日 22:12
-- 服务器版本: 5.5.40
-- PHP 版本: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `qingblog`
--

-- --------------------------------------------------------

--
-- 表的结构 `board`
--

CREATE TABLE IF NOT EXISTS `board` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` char(16) NOT NULL,
  `content` text NOT NULL,
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `board`
--

INSERT INTO `board` (`id`, `nickname`, `content`, `createtime`) VALUES
(27, '大群', '强哥开公司，赚大钱。', 1441006046),
(26, 'puregardneia', '安静地等待城市的喧嚣褪去，你会不会听见我心里的那句想你', 1440662580),
(24, '安沐', '万水千山走遍，可是到底有多远？', 1440661800),
(22, '马强', '“你若喜欢自己的价值，就必须为世界创造价值”，这句话说得真好！', 1440658020);

-- --------------------------------------------------------

--
-- 表的结构 `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `cid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id` mediumint(8) NOT NULL,
  `NickName` char(64) NOT NULL,
  `email` varchar(60) NOT NULL,
  `comments` text NOT NULL,
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `reply` text,
  `replytime` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`cid`),
  FULLTEXT KEY `comments` (`comments`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- 转存表中的数据 `comments`
--

INSERT INTO `comments` (`cid`, `id`, `NickName`, `email`, `comments`, `createtime`, `reply`, `replytime`) VALUES
(31, 74, 'puregardenia', 'puregardenia@qq.com', 'Kindle 太专业了，使用起来很舒服，有利于培养读书的好习惯！', 1436936640, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `letter`
--

CREATE TABLE IF NOT EXISTS `letter` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `email` char(64) NOT NULL,
  `letter` text NOT NULL,
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `isread` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- 转存表中的数据 `letter`
--

INSERT INTO `letter` (`id`, `email`, `letter`, `createtime`, `isread`) VALUES
(23, 'puregardenia@qq.com', '@轻博客:你好吗？', 1440742380, 1),
(24, 'Admin@qq.com', '@轻博客:晚上一起聚餐吧！', 1440742500, 0);

-- --------------------------------------------------------

--
-- 表的结构 `qingblog`
--

CREATE TABLE IF NOT EXISTS `qingblog` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ArticleTitle` char(64) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `ReadTimes` mediumint(9) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `ArticleTitle` (`ArticleTitle`),
  FULLTEXT KEY `content` (`content`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=120 ;

--
-- 转存表中的数据 `qingblog`
--

INSERT INTO `qingblog` (`id`, `ArticleTitle`, `content`, `createtime`, `ReadTimes`) VALUES
(3, '浪潮之巅 2015-07-15 10:31', '从技术上讲，IBM 是一个极富创新的公司。几十年来，如果说在工业界哪个实验室有资格和贝尔实验室相提并论，恐怕只有 IBM 实验室了。1945 年，IBM 在纽约开设了第一个实验室，这就是后来的华生（T.J. Watson）实验室，几年后，它在硅谷开设了第二个实验室。今天，它在全球有十一个实验室。五十年代，IBM 发明了计算机的硬盘和 FORTRAN 编程语言。\r\n2012-09-06 19:46:26\r\n在硅谷，可能没有人比史蒂夫·乔布斯更具有传奇色彩了。乔布斯可能是美国工程院唯一一个没有在大学读完一年书的院士。比尔·盖茨虽然没有大学毕业，毕竟正儿八经地上了两年。乔布斯只读了半年大学，又旁听了一段时间，然后就彻底离开了学校。他入选院士的原因是“开创和发展个人电脑工业”（For contributions to creation and development of the personal computer industry)。\r\n\r\n\r\n多看笔记 来自多看阅读 for Kindle', 1436927520, 21),
(74, 'kindle+多看=完美的阅读生活？', '　　今天给kindle安装了多看，发现多看就是很专业，好多很实用的功能就是kindle原生系统也是从来没有过的。当我第一次看到多看2013的界面时就被它深深地吸引住了。简洁的外观，优雅的字体，还有深黑色的字迹，无不令我感动。作为专业致力于阅读方面的软件--多看，从专门为kindle量身打造，到今天可以跨越多平台满足用户需求，相信多看走过了一段不寻常的路，才能在网络发展如此迅猛的今天独霸e-ink电子书之地。\r\n　　多看的界面有点win 8的风格，文件夹图标和deepin linux很像，整体的视觉感受不错。在多看下你可以选择按目录排列，这样，文件夹的结构就非常清楚的展现在我们的面前。还可以选择文件与文件夹的显示方式，通过在列表和方格图标之间的切换，可以获得不同的视觉感受。还有一点就是在kindle原生系统下无法将背光完全关掉，那么在白天看的话很多时候这点背光是没有必要的，从续航的角度上讲，这是很不利的。但是在多看下，我们可以将背光完全关闭掉，这样我们的kindle就能一次用更长的时间，这个功能还是挺实用的。\r\n　　如果多看只着重在UI设计风格上的软实力的话，那也就没什么大不了的。一个好的产品不仅要有软实力，更重要的是要在硬实力上具有自己的核心竞争力，不然的话，这一切都将只是浮云而已。如果软实力是软件的躯壳的话，那么硬实力就是软件的灵魂，是软件得以生存与发展并占有一席之地所必须的条件。那么多看的硬实力就是智能重排。这是个很强大的东西，通过对页面的分析，然后将文字重新组合到一块。我们可以用它来使得看pdf扫描版的书籍轻松无压力，效果不明显的话我们还可以先将书本进行切边处理，然后转屏将kindle侧着看，同时我们还可以设置字体的粗细来调整显示效果。哈哈，很不错的功能！\r\n　　借着kindle在硬件技术方面的成就，多看在软件方面发挥了很不错的作用。这样互赢互利的局面，最大的受益者就是消费者。”kindle+多看“是最完美的组合了！', 1436936520, 22),
(22, '《乔布斯传》圈点', '那些疯狂到以为自己能够改变世界的人，才能正在改变世界。【题记】\r\n\r\n        时下很多人喜欢从一瞥而过的潮流时尚中获取垃圾信息；而我依然保存着学生时代的传统：喜欢那些伴我渡过童年时光的四书五经、唐诗宋词、元曲清联，喜好在那些暗黄工整的文句里品味古朴的韵律，喜欢在那些墨香浮动的字里行间捕获智慧的火光。\r\n\r\n        沃尔特·艾萨克森先生的《乔布斯传》，是蓝星际语音平台之父Bluesen推荐给我的，如果没有他的力荐，像我这种老古董，很少会去看这样的畅销书。然而，沃尔特·艾萨克森笔下的《乔布斯传》同样遍布着文学的幽美、映射着睿智的星光，令我惊叹、折服。\r\n\r\n        乔布斯圈点，是我在15天阅览过程中对书中个人喜好的所谓精华内容的标注，以日记的方式整辑成篇。\r\n\r\n《前言》\r\n\r\n        一个具有强烈个性的人身上集合了人文和科学的天赋后所能产生的那种创造力，我相信这种创造力也是在21世纪创新型经济的关键因素。\r\n        乔布斯成了创造力、想象力和持续创新的终极标志。他深知21世纪创造价值的最佳途径就是将创造力与科技结合起来。他们开发的并非是针对目标人群的普通的产品改进，而是消费者还没有意识到其需求的全新设备和服务。\r\n\r\n第一章、童年\r\n\r\n        被遗弃、被选择。\r\n        他曾经被遗弃过，但后来他也遗弃了别人。\r\n        摩尔在1965年绘制的一张图表显示，集成电路每个芯片所能容纳的晶体管数目大约每两年就会翻一番，性能也会提升一倍。【著名的摩尔定律】\r\n        摩尔定律直至今日依然基本准确，它对产品性价比的可靠预测让包括史蒂夫.乔布什和比尔.盖茨在内的两代年轻企业家可以对自己的未来产品作出成本推测。\r\n        当我意识到自己比父母更聪明时，我为自己有这样的念头感到异常羞愧。我永远忘不了那一瞬间。\r\n        宗教应该更对地强调精神体验，而不是一味遵守教条。\r\n\r\n第二章、奇特的一对\r\n        沃兹尼亚克就是个文雅的天才，创造出一项很酷的发明，然后就算送给别人他也很高兴；而乔布斯会想出怎样让这个发明方便易用的方法，然后把它包装起来，推向市场，赚上一笔。\r\n\r\n\r\n第三章、出离\r\n\r\n        耐心这个词，从来就与乔布斯沾不上边儿。\r\n        对佛教的兴趣让他那花童一般的行为显得更加柔和。精神上的探索让他不再追求物质享受。\r\n        佛教对直觉的强调也深深影响了乔布斯。他开始意识到，基于直觉的理解和意识，比抽象思维和逻辑分析更为重要。然而，他的激情让他很难实现真正的涅槃；内在的平静、内心的平和或者说为人的             圆润，这些修行者的特质，并未在他身上有所体现。\r\n        素食主义与佛教禅宗，冥想与灵性，迷幻药与摇滚乐，那个时代寻求自我启迪的校园文化中，这几样标志性的行为，被乔布斯以一种近乎疯狂的方式集于一身。\r\n        让我感到震撼的是他的激情。他只要对一样东西感兴趣，就会把这种兴趣发挥到非理性的极致状态。乔布斯熟练地掌握了利用凝视和沉默来征服别人的技巧。\r\n        我不知道自己想要干什么，也不知道大学能如何帮我搞清楚自己的人生目标。但我却在花着父母的毕生积蓄。所以我决定退学，我也相信，一切都会顺利。\r\n        他拒绝不懂脑筋地接受事实，任何事情他都要亲自检验。这其中所蕴涵的美、历史意味和艺术精妙之处是科学无法捕捉的，这让我陶醉。\r\n        乔布斯总是有意识地将自己置身于艺术与科技的交汇点。\r\n        创造伟大的发明，而不是赚钱。应该尽我所能，将此生放回历史和人类思想的长河。\r\n那些疯狂到以为自己能够改变世界的人，才能正在改变世界。\r\n\r\n第四章、雅达利与印度\r\n        乔布斯能将个人魅力转化为说服力，通过个性的力量进行劝诱、胁迫以及扭曲事实。\r\n        就好像你看到一匹漂亮的马，你欣赏它，但你不想和它上床。你只是纯粹欣赏它的美。\r\n        乔布斯已经不是在寻找传授智慧的导师了，而是在通过苦行体验、感官剥离和返璞归真寻求启蒙。因为他做不到内心的平和。\r\n        他追寻并遵循着东方宗教的许多基本戒律，比如对“般若”的强调--通过精神的集中而直观体验到的智慧和认知。\r\n        西方的理性思维并不是人类先天具有的，而是通过学习获得的，它是西方文明的一项伟大成就。而在印度的村子里，人们从未学习过理性思维。他们学习的是其他东西，在某些方面与理性思维同样有价值，那就是直观和经验智慧的力量。\r\n        从禅宗学到的真理就是：如果你愿意跋山涉水去见一个导师的话，往往你的身边就会出现一位。\r\n        如果他认为某件事应该发生，那他就会尽力让它发生。\r\n        乔布斯是个复杂的人，善于耍手段只是展现了那些助他成功的诸多特性中的阴暗面。\r\n        如果你表现得好像你能做某件事，那他就起作用。装得好像你掌控了一切，别人就会以为你真的掌控了一切。\r\n \r\n第五章、Apple I\r\n \r\n        求知若饥、虚心若愚。\r\n        黑客伦理的一种体现：信息应该是免费的，也不能迷信权威。\r\n        比尔.盖茨给家酿俱乐部写了那封著名的信：“请大多数业务爱好者们意识到，你们的软件都是偷来的。这公平吗？……你们这样做只会让别人不再愿意编写好的软件。谁能承受得起无偿进行专业的工作？……如果谁愿意付钱的话，给我来信，我会很感激。”\r\n        一个伟大的工程师，只有和一个伟大的营销人员合作，才有可能被世人所铭记。乔布斯敬畏沃兹在技术设计方面的才华，沃兹则佩服乔布斯的商业能力，这样相得益彰。\r\n        一个灵魂，永远孤独地航行在陌生的思想海洋中。\r\n \r\n第六章、Apple II\r\n \r\n        乔布斯认为计算机内部的风扇有悖于禅意，它们的噪音会让人无法集中精神。\r\n        罗德（AppleII电脑开关电源设计师）并没有因此而得到太多的赞誉，但他应该名垂青史。现在所有电脑都使用开关电源，而这都是盗用了罗德的设计。\r\n        追求完美意味着：即便是别人看不到的地方，对其工艺也必须尽心尽力。\r\n        迈克.马库拉说，你永远不该怀着赚钱的目的去创办一家公司，你的目标应该是做出让你自己深信不疑的产品，创办一家生命力很强的公司。\r\n        马库拉的营销哲学：共鸣、专注和灌输。共鸣，就是紧密结合顾客的感受，我们要比其他任何公司都更好地理解使用者的需求。专注，为了做好我们决定做的事情，我们必须拒绝所有不重要的机会。灌输，人们确实会以貌取物。我们也许有最好的产品、最高的质量、最实用的软件等等，如果我们以一种潦草马虎的方式来展示，顾客就会认为我们的产品也是潦草马虎的；而如果我们以创新的、专业的方式展示产品，那么优质的形象也就被灌输到顾客的思想中。\r\n        至繁归于至简。\r\n        乔布斯喜欢控制别人、但不喜欢被人控制。\r\n        他的执着是一种对产品的激情，对于完美产品的激情。第七章、克里斯安和丽萨\r\n        当乔布斯不想被一件事分散注意力的时候，他就会完全忽略它，就好像此事完全不存在一样。有时候，他不仅能对别人扭曲现实，甚至也能对自己扭曲现实。\r\n\r\n第八章、施乐和丽萨\r\n        有位叫艾伦.凯的科学家，他的两句格言深得乔布斯认同：“预见未来的最好方式就是亲手创造未来”以及“对待软件严肃认真的人，应该制造自己专属的硬件”。\r\n        乔布斯认为世界上只有两类人：天才和白痴。\r\n        乔布斯说：“毕加索不是说过么：‘好的艺术家只是照抄，而伟大的艺术家窃取灵魂。’在窃取伟大的灵感这方面，我们一直都是厚颜无耻的。”\r\n        在创新的过程中，新颖的想法只是一部分，具体执行也同样重要。\r\n\r\n第九章、上市\r\n        乔布斯对这些一直陪伴在自己身边的人是否冷漠。“史蒂夫就是忠诚的反义词”，苹果公司早期工程师安迪.赫茨菲尔德说，“他完成处在忠诚的对立面，他总是抛弃那些和自己亲近的人”。\r\n        他是一个反物质主义的嬉皮士，但他把朋友准备免费送出的发明转化成了获利的工具；他是佛教禅宗的狂热信徒，但之后又认定创业才是自己的使命。这些特性在他身上并没有彼此矛盾，而是完美地交织在了一起。\r\n        他不允许对利润的追求凌驾于他对制造伟大产品的狂热之上。\r\n        乔布斯并不是一个特别乐善好施的人。他最大的一次个人赠与是送给自己的父母：保罗.乔布斯和克拉拉.乔布斯，他送出了价值75万美元的股票。\r\n\r\n第十章、Mac诞生了\r\n        尽管乔布斯有喜怒无常的毛病，但他非凡的魅力和团队影响力都足以引领大家改变世界。\r\n\r\n第十一章、现实扭曲力场\r\n        陷入史蒂夫的扭曲力场中是一件很危险的事情，但也正是这种力场让他可以真正地改变现实。\r\n        现实扭曲力场是几种因素的混合物，其中包含了极富魅力的措辞风格、不屈的意志和让现实屈从于自己意图的热切渴望。\r\n        如果他的一个论点没能说服别人，他会娴熟地切换到另一个论点。有时候，他会突然把你的观点占为己有，甚至都不承认自己曾经有过不同的想法，这会让人猝不及防。\r\n        在某种程度上，称之为现实扭曲力场只是换了种好听的说法来描述乔布斯喜欢说谎的特性。\r\n        他会死死地盯着你，眼睛一眨都不眨。哪怕他端给你一杯毒药，我也会乖乖地喝下去。你完成了不可能完成的任务，因为你并没有意识到那时不可能完成的。\r\n        现实扭曲力场的根源在于乔布斯内心深处不可动摇的信念：世界上的规则都不适合于他。这也源于深深根植于他性格中的叛逆和固执。\r\n        他的情感理解能力是超强的。他有着不可思议的阅人能力，可以看出他人心理上的优势、弱点以及不安全感。他能再别人毫无防备的情况下，直击对方心理深处。他凭直觉就能看出一个人是在说谎还是真的知道一些事情。这让他成为了哄骗、安抚、劝说、奉承、威胁他人的大师。\r\n        当你拥有真正优秀的人才时，你不必对他们太纵容；你期望他们做出好成绩，你就能让他们做出好成绩。\r\n第十二章、设计\r\n        大道至简。\r\n        形式追随情感。\r\n\r\n第十三章、制造Mac\r\n        乔布斯把制造伟大产品的激情摆在比迎合消费者的欲望更为重要的位置上。\r\n        过程就是奖励。\r\n        未来的某一天，他们会回顾这段共同度过的时光，对于那些痛苦的时刻，只是过眼云烟，或者付之一笑，他们会把这段时光看做人生中奇妙的巅峰时刻。\r\n        随着时间的流逝，这里的50个人所做的工作将会对整个世界产生深远影响。\r\n\r\n第十四章、斯卡利来了\r\n        乔布斯突然用一种传道士的口吻说：“我们想要改变人们使用计算机的方式”。\r\n\r\n第十五章、麦金塔电脑的发布\r\n        人类一直都在从超前的知识进步中获益，并且在使用超前者所研发出来的东西。\r\n\r\n第十六章、盖茨与乔布斯\r\n        在题为“软件人体工程学”的演讲中，他说计算机图形将“超级重要”，界面将更加友好，鼠标将成为所有电脑的标配。\r\n        乔布斯反驳说：“我们都有一个有钱的邻居，叫施乐，我闯进他们家准备偷电视机的时候，发现你已经把它盗走了。”\r\n        苹果核微软的共生关系就如两只蝎子跳舞，双方都小心翼翼地周旋，他们知道无论谁出刺都会给对方造成问题。\r\n        虽然一开始微软只做出了一系列粗制滥造的复制品，它最终还是赢得了操作系统之争。这一事实说明世界并非完美：最好最创新的产品并非总是赢家。\r\n\r\n第十七章、伊卡洛斯\r\n        在乔布斯的天性里，控制权不能共享。\r\n        有句古老的印度谚语：“在人生的头30年里，你培养习惯；在后30年，习惯塑造你。”\r\n        如果你想有创造性地过自己的生活，像艺术家一样，就不能常常回顾过去，不管你做什么，以前是怎么样，你都必须心甘情愿地接受一切，并将一切抛诸脑后。\r\n        沃兹尼亚克低调地在Apple II部门做中级工程师，作为公司谦卑的招牌人物而存在，并尽可能低远离管理和公司政治。\r\n        斯卡利苦苦渴求乔布斯的喜爱，而乔布斯则渴望在斯卡利身上获得父亲和良师益友的感觉。\r\n\r\n第十八章、NeXT\r\n        乔布斯后来的巨大成功，并非因为在苹果的下台，而是下台后华丽的失败。\r\n        企业标志设计大师保罗.兰德，曾经设计出商界知名的一些标识：《君子》杂志、IBM、西屋电器、美国广播公司、联合包裹服务公司(UPS)。\r\n        一个好的标识意味着NeXT正在以世界级的感觉和身份起步。马库拉曾教过他，你可以根据封面去评价一本书，而一家伟大的公司必须从给人的第一印象就映射出自己的价值观。\r\n        乔布斯的一部分责任就是成为一个质量标杆，很多人并不知道如何适应那种追求卓越的环境。\r\n        佩罗后来表示，自己人生中最大的憾事之一就是，1979年，当年轻的比尔.盖茨前来达拉斯拜访时，自己没有收购微软，或者买下大量股票。乔布斯与比尔盖茨\r\n \r\n        在天文学中，当两颗星体轨迹交织，由于引力作用，就会出现双星系统，在计算机业发展的初期，也出现过类似的“双星人物”：史蒂夫.乔布斯、比尔.盖茨。\r\n \r\n        史蒂夫.乔布斯和比尔.盖茨，虽然两人对技术和商业的融合都天生拥有众多相似之处：直觉、远见、雄心、睿智与坚持。但两颗巨星之间的差异也是显而易见的。从《乔布斯传》整理出以下几点，以供参阅。\r\n\r\n        【家庭背景】\r\n        比尔.盖茨的父亲是西雅图一位杰出的律师，母亲是一名民众领袖，并担任众多著名机构的董事。\r\n        史蒂夫.乔布斯的父亲是一名退役的海岸警卫员，以机械师、设备维护员等工程师身份任职于美国当地的普通工厂或公司，其母亲是一名普通的家庭主妇。第十九章、皮克斯\r\n        硅谷的人并不尊重好莱坞的创意特质，而好莱坞的人则认为技术人员是那些只需雇用而无需见面的人。\r\n        对于艺术和科技融合所能做出的成就，乔布斯却倾注了浪漫之爱。\r\n        乔布斯后来回忆说，如果自己能知道得更多，就会更早地专注于动画，而不会费心去推动皮克斯的硬件和软件应用。命运似乎诱骗我去做这件事，而这也许是为了将来给我更好的东西。\r\n\r\n第二十章、凡人\r\n        乔布斯后来说，我不希望做父亲，所以我就不做。\r\n        丽萨意识到乔布斯的饮食癖好反应了一种人生哲学：苦行和极简将会让人更加敏锐。匮乏即时富足、自律产生喜悦。\r\n        乔布斯与伊根常常争执不休的话题之一是他源于佛就修行的一个信条：要避免对物质的执着。他认为伊根的消费欲望是不健康的，要过一种不执著、非物质的生活以达到觉醒。\r\n        莱德斯回忆说，我们都生错了地方，正因如此我们才属于对方。莱德斯曾在通向他们卧室的走廊墙壁上写道：忽视是一种虐待。她后来回忆说，爱上一个如此以自我为中心的人，那种痛苦令人难以置信，深深地关心一个似乎没有能力关心别人的人，那是某种地狱般的感觉，她不愿意去任何人去体验。\r\n        在从残忍到仁慈的坐标轴上，乔布斯和莱德斯分别接近相反的两极。莱德斯说，在他们相处时，我受不了他的不仁慈。我不想伤害她，但我也别想站在一边看着他伤害别人。那很痛苦、很累。\r\n        直言不讳的乔安娜.霍夫曼曾说，乔布斯会把柔弱和多愁善感当做一种气质。\r\n\r\n第二十一章、玩具总动员\r\n        挑战不可能完成的任务，其乐无穷。沃尔特.迪斯尼曾说。\r\n        约翰.拉赛特的创意称为“玩具总动员”，灵感来自他和乔布斯共有的一个信念：产品是有灵魂的，是为了一个使命才被生产出来的。如果一个物体是有感情的，它的感情应该是基于它想实现自己价值的渴望。\r\n        在职业生涯中，乔布斯因创造伟大的产品而闻名于世。然而，他创造伟大的公司和品牌价值的能力同样非凡。他创造了他的时代中最好的两个品牌，苹果和皮克斯。\r\n\r\n        【学生时代】\r\n        盖茨中学时代就读于当地最好的私立学校：湖滨中学，并从此走上技术极客道路。中学期间开始为学校编写排课软件系统，以便有机会与自己心仪的女孩上同样的课程；还曾为当地一家交通管理部门编写车辆计数程序而小有名气。进入哈佛大学之后不久，盖茨决定退学，去创立自己的软件公司。\r\n        乔布斯启蒙与离家仅4条街的蒙塔.洛马小学，在完成三年级学业之前曾被校方【劝其退学】三次；中学时代沉溺于迷幻药和反主流文化，热衷于电子技术和时髦科技，但出发点往往是基于恶搞和出风头，因为自己痴迷鲍勃.迪伦而录制并兜售盗版音乐磁带，研制【蓝盒子】以盗打美国电话电报公司(AT&amp;T)的电话；大学时曾经坚持要上当时全美最贵的私立文理大学：里德学院，而不顾家庭的经济收入水平；后来乔布斯却决定从里德学院退学，去印度朝拜心中的佛教圣人。\r\n        两人的孩童时代就有着截然不同的过往经历。与乔布斯相比，盖茨更像一个出身名门的贵族后裔，在一个优越的美国中产阶级家庭环境中接受着正统的西方传统教育。与盖茨相比，乔布斯更像美国拓荒时代不守规矩并被放逐的西部牛仔，一个美国60年代的典型嬉皮士，一个不务学业的问题少年。\r\n\r\n        【职业素养】\r\n        与乔布斯相比，盖茨更懂计算机技术，甚至自己亲手编写Basic语言的编译器和初期开发工具、开发早期操作系统的总体架构和核心代码、掌控整个微软帝国的技术走向；盖茨更务实、更有原则，且拥有很强的分析处理能力。\r\n        与盖茨相比，乔布斯则更相信直觉、更浪漫，并且在技术实用化、设计愉悦感和界面友好性等方面有着更高的天分。\r\n\r\n        【管理之道】\r\n        在乔布斯执掌苹果公司的日子里，一直狂热地追求完美，以致他为人非常苛刻，甚至能做出在会议开始之后才把他认为不相干的人赶出会议室，在员工大会上把首席设计师骂成狗屎、白痴和脑残；他的管理主要依靠自身的领导魅力和四溢的激情。\r\n        在企业管理方面，盖茨更严谨、更规范、更有条理，他会频繁召开产品评估会议，并在会上精准地切入问题核心。在早期的职业生涯中，盖茨似乎有着典型极客的气质，有些阿斯伯格综合征的倾向，后来他能较好的管住自己对技术的过分执着，更多的融合商用因素参与企业的经验管理工作。\r\n        乔布斯和盖茨都可能做出粗鲁无礼的举动，但是盖茨的无礼刻薄通常并不针对个人，更多的是出于对技术的深刻理解或对问题的不同见解，而非情感上的麻木不仁；乔布斯则擅长以咄咄逼人的剑气，直刺人们心中最薄弱的痛处，精准打击他想谩骂的任何人。乔布斯会用灼伤人心的眼神盯着对方，直至其缴械投降；而盖茨有时会无法与人进行眼神接触，但他也会很富人情味儿地看着你，等待你的答复，就比如在说服Delphi之父再创辉煌的那一刻。\r\n\r\n        【巅峰对决】\r\n        从两人结识起，盖茨就被乔布斯所吸引，并有些嫉妒他蛊惑人心的能力，但同时，他也认为乔布斯“极其古怪”，而且，“作为一个人，有着奇特的缺陷。”盖茨反感乔布斯的无礼，以及他的那种倾向：“不是觉得你狗屁不如，就是觉得你是天才，并试图引诱、怂恿你。”\r\n        而在乔布斯看来，盖茨太狭隘。乔布斯曾说：“如果他年轻的时候服过迷幻药或是进行一下修禅，那整个人的心胸就会更开阔。”\r\n        两人相识30年后，两人对对方的看法都略有改变。盖茨对乔布斯产生了有所保留的敬意。盖茨曾经说：“他真的对技术了解不多，但他有一种惊人的天赋，知道什么东西能成功。”\r\n        反过来，乔布斯从来没有充分肯定过盖茨的长处。乔布斯曾经说：“比尔基本上缺乏想象力，也从没创造过什么东西，这就是为什么我觉得他更适合像现在这样做慈善，而不是留在技术领域，他只是无耻地盗用别人的想法。”\r\n\r\n        【一家之言】\r\n       乔布斯和比尔盖茨，他们各自不同的家庭背景、学生生活，为各自以后截然不同的创业经历埋下很好的伏笔。他们个性与性格的差异，也最终驱使他们走上了对立面并引发了数字时代的根本分立。\r\n        乔布斯是个完美主义者，渴望掌控一切，并且很享受艺术家这种不妥协、不退让的性情；他和苹果公司将硬件、软件和内容无缝整合，铸成一体，这种数字化战略堪称典范。\r\n        盖茨则是商业和技术领域里精明务实、深谋远虑的分析师；他愿意将微软的操作系统和软件，授权给各种不同的硬件制造商使用。第二十二章、再度降临\r\n        盖茨这样咆哮了两三分钟，“难道你不明白乔布斯根本不懂技术吗？他只是一个超级销售员。我真无法相信你会做出这样愚蠢的决定……他根本不懂工程，他说的、想的里面99%都是错误的。你们买下那堆垃圾到底为了什么？”\r\n \r\n第二十三章、复出\r\n        “你很少见到一个艺术家在三四十岁时还能有令人惊叹的作品”。乔布斯即将30岁时曾这样说。\r\n\r\n        乔布斯既没有埃利森那种惹人注目的消费需求，也没有比尔.盖茨那种投身慈善事业的内在冲动，亦没有那种想看看自己在《福布斯》排行榜上能爬多高的竞争意识。在他那种自负和个人动力的驱使下，他要通过创造足以令世人敬畏的传奇来获得满足。这实际上包括两个方面：制造不断革新不断变化的伟大产品，以及建立一家有持久生命力的公司。\r\n\r\n        乔布斯可以随心所欲地引诱和迷惑别人，而且他喜欢这样做。乔布斯可以轻易吸引他讨厌的人，而他伤害他喜欢的人也同样驾轻就熟。\r\n\r\n        乔布斯苛求完美，并不太善于退而求其次或适应可行的方案。并且，他一直倾向于认为所有事情都是非黑即白的。一个人不是英雄就是蠢材，一个产品不是奇迹就是垃圾。那些疯狂到以为自己能够改变世界的人，才能正在改变世界。【题记】\r\n第二十四章、非同凡响\r\n        人们会因为拥有某个品牌的汽车而骄傲：保时捷、法拉利、普锐斯；因为我开什么车能一定程度上说明我是什么样的人。人们对苹果的产品有同样的感受。拉里.埃里森说。\r\n        一家妥善经营的公司能够大量催生创新，远胜于任何一个有创造性的人。\r\n        乔布斯喜欢控制产品的所有方面。因此乔布什时代的苹果善于制造全套设备、全方面负责用户体验。\r\n        乔布斯的一个过人之处是知道如何做到专注。决定不做什么跟决定做什么同样重要。\r\n\r\n第二十五章、设计原则\r\n        截止2011年初，乔布斯已成为美国212项专利的发明人之一。\r\n        无论是iPod Mini，还是MacBook Pro，苹果用户都享受着这样的感觉：打开精致的盒子，产品总是以迷人的方式躺在里面。乔布斯和他的团队，花大量的时间用于产品包装的设计。让用户去享受打开产品包装的过程。他们笃信，一旦拆包被设计成一种仪式般的程序，产品就变得特殊起来；包装就像一座剧场，它能够制造故事。\r\n第二十六章、iMac\r\n        要向着冰球运动的方向滑，而不是它现在的位置。\r\n        面对iMac的产品发布盛会，乔布斯有两个希望：一是使苹果公司起死回生；二是再次颠覆计算机的形象。\r\n第二十七章、CEO\r\n        乔布斯的管理准则是“专注”。他取消了多余的生产线，，去除了正在开发的操作系统中无关紧要的功能。还放下对产品制造过程的控制欲，把从电路板到成品计算机的制造全部外包出去。\r\n        乔布斯最为重视舞台上那戏剧性的揭幕，因此对所有产品发布会的事前保密的要求十分严格。\r\n        乔布斯是一个队商业航班和航站楼毫无好感和耐心的人，即便是被美国运输安全管理局接管之前也是一样。\r\n第二十八章、苹果零售店\r\n         乔布斯不喜欢失去对任何失去的控制，尤其是关系到顾客体验的事情。\r\n        迈克.马库拉的一句名言：好的公司要学会“灌输”。它必须竭尽所能传递它的价值和重要性，从产品包装到市场营销。\r\n        那个时期大多数人不了解苹果产品。他们认为苹果是异类。如果想要转变形象，从异类变成炫酷有趣，那么建立一个能给人们提供试用空间的商店会很有帮助。\r\n        苹果零售店的风格也将沿袭苹果产品的特点：有趣、简单、时髦、有创意，在时尚与令人生畏之间拿捏得恰到好处。\r\n        GAP前CEO米勒德.米基.德雷克斯勒，是这个世界上极少数的在设计、形象和消费者需求方面与乔布斯同样成功和精明的人。他强调端到端的营销控制模式：GAP商店只出售GAP品牌的产品，而且GAP产品几乎只能够在GAP商店里独家销售。\r\n        苹果零售店的装修设计原则：简约、减少分心的因素。这是一家商店成功的关键，对于产品来说也是一样。\r\n        苹果位于曼哈顿第五大道上的零售店在2006年开业，这家新开张的店面把乔布斯的很多创意激情集结到了一起：立方体、标志性楼梯、玻璃，把简约主义发挥到极致。\r\n        乔布斯在2010年自豪地说：“这家店每平方英尺带来的平均收入比世界上任何一家店都多，而且总收入比纽约的任何一家店要多。”充分证明了当初乔布斯坚持选址在繁华地段的策略是正确的。\r\n        2011年，第一批苹果零售店开业10年之后，全世界已经有317家苹果零售店。最大的店在伦敦的柯芬园，最高的店在东京的银座。\r\n        对乔布斯来说，“少”永远意味着“多”，越简单越好。第二十九章、数字中枢\r\n        2001年互联网经济的泡沫破裂。乔布斯宣布了一项重大战略。他认为：个人计算机不会成为边缘化的副线产品，而将成为一个“数字中枢”，整合各个数字设备，包括音乐播放器、录像机以及相机。\r\n        一家创新型的公司不仅仅要做到推陈除新，而且还要在落后时知道如何迎头赶上。\r\n        关于演讲，乔布斯有句名言：如果你一定要用幻灯片来讲，那说明你不知道自己要讲什么。\r\n        所有的“简洁”中最为玄妙的是乔布斯让同事们大吃一惊的一个决定：iPod上不能有开关键。\r\n        iPod包含着一些非常有意义且不易被丢弃的元素，但是也有一些非常安静和内敛的部分。白色并不仅仅是一种中性的色彩。它既纯净有安静，醒目、出挑但又不张扬。\r\n        iPod代表了苹果品牌的核心价值：诗意与工程紧密相连，艺术、创意和科技完美结合，设计风格既醒目又简洁。简便的操作得益于整合的端到端一体化的系统--从计算机到火线、设备、软件，再到内容管理。第三十章、iTunes商店\r\n        本来，乔布斯完全可以放任盗版的存在。免费音乐意味着能卖掉更多的iPad。但是，因为他真的热爱音乐，也热爱创作音乐的艺术家。\r\n        乔布斯后来说：从苹果公司创立之初，我就意识到，我们的成功来自知识产权。如果人们可以任意复制或盗取我们的软件，我们早就破产了。如果知识产权不受保护，我们也没有动力再去制作新软件或设计新产品了。如果没有了对知识产权的保护，那么很多创意公司就会消失，或者根本不会出现。\r\n        乔布斯告诉《君子》杂志的安迪.兰格时说：“我们相信，有80%下载盗版的人都是不得已的，只是没有给他们提供合法的选择而已。”苹果公司通过提供一种合法的、更好的授权音乐下载服务，而是音乐公司赢利、艺术家赢利、苹果公司赢利。\r\n        我从来不会花太多时间去说服人们做对自己有利的事。\r\n        问题的核心是热爱科技的人和热爱艺术的人之间的分歧。乔布斯两个都爱。\r\n        盗版颠覆了所有人的认知。而能够与之抗衡的就是把iTunes做成一种端到端的一体化服务。\r\n        音乐集团企业公司IGA终止于索尼的合作，加入苹果阵营。约维内说：“索尼错过这个好机会的原因简单得让我不敢相信，这真是个可以记入史册的大错。如果部门之间合作不力，史蒂夫会解雇有关人员，但是索尼内部一直搞得一团糟却没人出面解决。”\r\n        比尔.盖茨在当晚10点46分发表评论，标题是“还是苹果的乔布斯”。他说：史蒂夫.乔布斯有种惊人的能力：把关注点放在真正有价值的地方，能找来会做用户界面的人，以及革命性的营销手段。\r\n        乔布斯一直希望苹果公司能建立起独立统一的乌托邦，在这个神奇的围墙花园里，硬件、软件和外围设备完美结合，创造一种绝妙的体验，某一个产品的成功也能促进所有关联产品的销售。\r\n        乔布斯从来都不是谦虚保守的人。他对着正在欢呼的人群宣布：“Windows版的iTunes很可能是Windows系统里最棒的应用程序！”\r\n        乔布斯没有把苹果公司分割成多个自主的分支，他紧紧地控制着他所有的团队，并促使他们作为一个团结而灵活的整体一起工作，全公司只有一条“损益底线”。\r\n        乔布斯的一个商业原则就是：永远不要害怕内部相残。他说：“与其被别人取代，别人自己取代自己。”\r\n        乔布斯对iPod Shuffle提出了一个疯狂的建议：干脆把屏幕去掉！他的观点是，用户根本不需要找歌曲，歌曲可以随机播放。iPod Shuffle上市时的广告词就是：“拥抱不确定性。”第三十一章、爱音乐的人\r\n        从音乐的角度来说，你就一丝不挂了。暴露的不仅仅是你的喜好--而是你是一个怎样的人。\r\n        乔布斯2004年的音乐收藏并不是最新的，但却是他生命中的音乐轨迹，20实际50年代出生的人会与之产生共鸣，甚至非常欣赏的那些音乐。\r\n\r\n第三十二章、皮克斯的朋友\r\n        领导者的性格奠定了整个公司的风格，就如同苹果带着乔布斯的影子，而皮克斯也深受拉赛特的影响。\r\n        乔布斯陶醉于电影制作过程的趣味性，并深深着迷于魔法般的计算机特技，比如计算机模拟制作雨滴折射出阳光，或青草叶在微风吹拂下晃动。同时他也克制自己不要去控制创意过程。在皮克斯，，他懂得了要给创意人员天马行空的自由空间。\r\n        在商业界有个很经典的理论，第二产品综合征。症结在于对第一个产品的成果缺乏理解。\r\n        迪斯尼的首席运营官鲍勃.艾格举止大方合宜，善于灵活处理事件；同时也懂得慧眼识人，具有幽默感，善解人意；为人低调不多言。\r\n        一直以来，我的目标不仅仅是制作杰出的产品，还要建立卓越的公司，乔布斯回忆说。', 1436927640, 11),
(36, '《程序员分成几种不同的境界》', '《程序员》杂志上有一篇文章写的非常好，这里节选一段。文章一标题是《程序员分成几种不同的境界》。对比了一下，我觉得自己看来只能属于第五流的程序员。把这篇文章引在这儿，是准备时时刻刻激励自己，往更高层次努力，或者追求更高人生境界。　　五流程序员比技术和工具\r\n　　五流程序员关心的是用什么工具可以产生什么结果，追逐他听过最新、最好、最时髦的技术，沉浸于一些小练习，却很少走出象牙塔和客户或市场进行真正的沟通，甚至完成大型的真实案例。\r\n　　四流程序员比整合和管理\r\n　　四流程序员比前者更关心在什么地方使用什么，他的心里放着集成各种技术的地图，而不偏向单一工具和技术，他在乎运作一场战役的风险，还有资金成本的考量，包含开发时间、维护难易、用户培训或是市场推广……\r\n　　三流程序员比创意和设计\r\n　　三流程序员不仅要求把事情“做完”，同时要求自己把事情“做好”，他的作品里充满着感动和生命，即使好几年以后重新来过，你依然会觉得那些创意和设计，突破了时空限制，只能模仿无法取代。\r\n　　二流程序员比沟通和性格\r\n　　二流程序员跳脱工具，比人际沟通，他知道怎样和老板沟通，怎样和同事沟通，也知道怎样和客户沟通。他有一个成熟并且稳定的性格，让任何人跟他在一起做事都有安全感，并且感到快乐。\r\n　　一流程序员比态度和方法\r\n　　一流程序员比的是学习的态度和方法，包括号对自我控制的能力，也就是纪律，我们不看他做出来什么事，而是看他准备怎么去做，包含解决问题需要的时间，还是学习新事物的方法。\r\n　　只要他掌握了适合他自己的学习态度和方法，那么他可以从任何时刻开始新的学习，并且展现最好的结果，至于现在会不会，懂不懂都不重要，因为只要他想要，他就随时可以要，也能要得到。\r\n　　超级程序员比思想和素质\r\n　　程序只是语言的表述，而语言则是思想的淬炼。\r\n　　超级程序员不仅改变我们的行为，也企图改变我们的思想。你不需要从超级程序员的代码判断他的素质，而是从他写的字、他说的话去感受他，因为没有那个思想到不了那个境界。', 1436929380, 11),
(40, '当迷茫在大学里泛滥成灾 | 李开复', '“不要说上课听不懂，不要说教师不关心，不要说专业不感兴趣，不要说学校太烂，堕落不需要理由，只需要借口。”-\r\n\r\n你们经历了高三，但是它对于你们来说并不是黑色的，只是一种比平时紧张的感觉而已，在内心深处你们还没有真正-\r\n\r\n意义上体会到了为了自己的目标拼命的含义，在这一次比较苍白的过程中，你们已经丧失了一次铸炼自己的机会。-\r\n\r\n一个人失去一次机会并不算什么，可是就是在这一次一次的失去中，有许多人就失去了成功的人生。-\r\n\r\n那么，我的同学们，你们失去了什么？-\r\n\r\n黑色是压抑和沉闷的，但是在它的背后，却代表成熟与大气。-\r\n\r\n在你经历的大学生活中，你是不是有许多时间都不知所措，有许多时间都在宿舍里床上度过，有许多时间都用在QQ上的-\r\n\r\n闲聊，有许多时间都在网络游戏里厮杀。-\r\n\r\n一学期、一年、两年过去了……突然发现自己没有认真听过几节课，虽然给你们上课都是讲师以上级别的；突然发现自己没有认真读过几本书，虽然你们大学里的图书馆有很多的藏书；突然发现自己没有学到东西，虽然大学里有很多的可以学习东西。-\r\n\r\n你现在是不是正在为期末考试过关，而不是达到优秀而发愁，正在盘算不会被亮红点的各种方法：突击学习，考试作弊，请酒送礼，独自祷告……-\r\n\r\n一、读大学是享受生活还是塑造自我？-\r\n\r\n在你们经历的大学生活中，有许多同学都反映到了这样一个问题：不知道自己一天到底要做什么，或是做什么都不起劲。-\r\n\r\n这在刚进入大学的学生当中是一个非常普遍的现像，因为你们丧失了目标。-\r\n\r\n对于许多同学而言，大学是你们最后的求学阶段。读完大学就要找工作，可是这对于已经做了十二年学生你们而言仍然显得那么的遥不可及。-\r\n\r\n在大学里面没有任何一个教师会围绕你们转，学不学完全是自己的事。没有了以前做不完的作业你们觉得上课对自己空荡荡的，学了又怎么样，不学又怎么样？与其让自己学得这样辛苦，还不如让自己过得洒脱一点。-\r\n\r\n没有任何人给你讲你应该去做什么，让你们觉得茫然不知所措。你们大多数人却乏精神的独立与良好的自控，你们根本无法去把握这些显得过多的自由。-\r\n\r\n到底要做怎样的人，到底要干什么样的事业，这些对于你们而言是毫无概念。-\r\n\r\n从小学时代我的理想，到初中时代我的将来，到高中时代我的大学，到大学时代我的迷茫，你们在这一过程中完成了人生目标的蜕变，最后剩下的是死掉的虫皮。-\r\n\r\n正是因为你们丧失了目标，没有方向的船，什么风都不是顺风。-\r\n\r\n我相信，如果每一个同学都有一个目标，你们会过得很充实，会过得很忙碌，并且会得到很多。-\r\n\r\n所以，请每一个同学都给自己定下一个目标吧。-\r\n\r\n生活就像巧克力盒，你永远都不知道下一颗会是什么样的滋味！-\r\n\r\n也许有的人会这样问：为什么别人可以潇洒地生活，而我却要痛苦的拼搏。我把它换成另外一个问题：读大学到底是享受生活还是塑造自我。-\r\n\r\n有许多同学在刚进大学的时候都去尝试过竞选学生会、各种社团的干事与干部。事后，有许多同学都发出了这样的叹：不公平，做什么都要凭关系。我到想请问，学校尚且如此，社会又怎样呢？社会上对权术、关系、金钱不是玩得更彻底吗？以后你到底凭什么在社会上立足？要权力没权力，要关系没关系，要钞票没钞票，那到底还有什么呢？-\r\n\r\n当你们大学毕业以后，却突然发现自己除了拿到了一个大学毕业证之外，除了能说一点好像很深奥的话题之外，并没有学到真正过硬的本事时，你们做的工作也许只是名称好听点而已，也许是任何人都可以做的而已。-\r\n\r\n到那时你们是不是还要怨天尤人？-\r\n\r\n我们每一个人都想过上高质量的生活，都想让自己的至亲过上无忧的生活，都想在世上留下自己价值的痕迹，但这些不是在享受中就可以实现的。-\r\n\r\n上天给了我们每个人一双手和一个大脑，就是要让我们去创造与思考。-\r\n\r\n大学这段时间是你们最佳的学习时间，所以请你们放弃享受，努力地重塑自我，为以后的腾飞积聚力量。-\r\n\r\n二、感情泛滥得只是被当成了一种需要！-\r\n\r\n既然是谈大学生活，那么爱情是一定要谈的。大学里面的正是青春期的少男与少女，爱情在这里不可避免地发生了。但不知何时起，这正常的不能再正常的事情却遭遇从来没有过的质疑：现在的大学生感情泛滥。-\r\n\r\n现在大学生的情感里面夹杂了大多的功利、欲望、放纵在里面。-\r\n\r\n每年毕业时，情侣们最后一顿饭，最后一次拥抱，最后一次亲吻，然后转身离开，踏上各自的旅途，从此把这段感情遗忘，就像从来没有发生一样。爱情只是被当成了一种需要。-\r\n\r\n有许多人要抓住爱情或是被爱情抓住。-\r\n\r\n但是我希望你们的爱情是真诚的，是认真的，是纯洁的，是本色的。-\r\n\r\n如果你觉得他很帅，想去和他谈恋爱，请三思；-\r\n\r\n如果你觉得她很美，想去和她谈恋爱，请三思；-\r\n\r\n如果你觉得很孤单，想去找一个人谈恋爱，请三思；-\r\n\r\n如果你只是因为听了朋友的几句言语，就去和某个人谈恋爱，请放弃。-\r\n\r\n“爱”字实际上已经清楚的表明它的对象：-\r\n\r\n下面的“友”字说明你应该很了解他（她），他（她）应该是你的朋友；-\r\n\r\n“ㄇ”说明你要在这些朋友之间认真选择；-\r\n\r\n“ノ”说明你只能在精挑细选中选出一个作为你的爱人，其它的只能作为你的朋友。-\r\n\r\n请珍惜自己的情感，否则它会变得很廉价。-\r\n\r\n爱情是什么？-\r\n\r\n这个你们心里面应该清楚。我觉得：因为优秀而被吸引，因为吸引而被爱，因为被爱而学会爱，这才是爱的过程。-\r\n\r\n三、责任，是成熟的思想内定的！-\r\n\r\n你们现在是在大学里求学，是在接受一种高额费用的教育，可是你们的父母高额的投入，在你们的身上得到了多少出？-\r\n\r\n你们没有多少人家里有万贯家财，你们现在用的每一分钱都是父母挣来的血汗钱，甚至是到处借来的钱，其间蕴含着无比的艰辛与对你们的爱。-\r\n\r\n在他们被岁月留下创痕的老脸上，还有一双对你们充满希望的眼睛，那一双浑浊甚至有一点模糊的眼睛。-\r\n\r\n责任，并不是别人给你的，而是自己成熟的思想内定的。-\r\n\r\n你们都说自己长大了，都说自己成熟了，但我觉得，20岁的你们只是一种表向的成熟。-\r\n\r\n你对自己父母具有永远都无法推卸的责任，但是你们却在无为与堕落当中放弃了承担的使命。-\r\n\r\n一学期结束后，回到家里过年时，你的父母仍旧对你宠爱有加，仍旧对你充满希望，仍旧对你叮咛嘱咐……-\r\n\r\n建造一个事物很难，摧毁一个事物却很容易-\r\n\r\n同学们，请牢记并承担起你们对父母的责任。-\r\n\r\n在你们的身边有太多的混日子的大学生，他们过着同龄人向往的潇洒生活；但是成功与伟大的人都是孤独与寂寞-\r\n\r\n的，他们忍耐的过程中培养了他们超强的毅力与过人的智慧-\r\n\r\n或许我就需要这些。-', 1436929440, 13);
INSERT INTO `qingblog` (`id`, `ArticleTitle`, `content`, `createtime`, `ReadTimes`) VALUES
(47, '气质的养成', '一：沉稳 （1）不要随便显露你的情绪。 （2）不要逢人就诉说你的困难和遭遇。 （3）在征询别人的意见之前，自己先思 考，但不要先讲。 （4）不要一有机会就唠叨你的不满。 （5）重要的决定尽量有别人商量，最好隔 一天再发布。 （6）讲话不要有任何的慌张，走路也是。\n\n二：细心 （1）对身边发生的事情，常思考它们的因 果关系。 （2）对做不到位的执行问题，要发掘它们 的根本症结。 （3）对习以为常的做事方法，要有改进或 优化的建议。 （4）做什么事情都要养成有条不紊和井然 有序的习惯。 （5）经常去找几个别人看不出来的毛病或 弊端。 （6）自己要随时随地对有所不足的地方补 位。 三：胆识 （1）不要常用缺乏自信的词句 （2）不要常常反悔，轻易推翻已经决定的 事。 （3）在众人争执不休时，不要没有主见。 （4）整体氛围低落时，你要乐观、阳光。 （5）做任何事情都要用心，因为有人在看 着你。 （6）事情不顺的时候，歇口气，重新寻找 突破口，就结束也要干净利落。\n\n四：大度 （1）不要刻意把有可能是伙伴的人变成对 手。 （2）对别人的小过失、小错误不要斤斤计 较。 （3）在金钱上要大方，学习三施（财施、 法施、无畏施） （4）不要有权力的傲慢和知识的偏见。 （5）任何成果和成就都应和别人分享。 （6）必须有人牺牲或奉献的时候，自己走 在前面。\n\n五：诚信 （1）做不到的事情不要说，说了就努力做 到。 （2）虚的口号或标语不要常挂嘴上。 （3）针对客户提出的“不诚信”问题，拿出 改善的方法。 （4）停止一切“不道德”的手段。 （5）耍弄小聪明，要不得！ （6）计算一下产品或服务的诚信代价，那 就是品牌成本。\n\n六：担当 （1）检讨任何过失的时候，先从自身或自 己人开始反省。 （2）事项结束后，先审查过错，再列述功 劳。 （3）认错从上级开始，表功从下级启动 （4）着手一个计划，先将权责界定清楚， 而且分配得当。 （5）对“怕事”的人或组织要挑明了说。', 1436929680, 2),
(54, '轻格言', '做自己喜欢做的事，做自己擅长的事！--巴菲特\r\n\r\n漫漫人生路，诸多小利无时无刻不在诱惑着我们一颗世俗的心，如果能及时漏掉那些小利，就可舀到更费美的鱼儿 \r\n\r\n山中也有千年树，世上难逢百岁人。\r\n\r\n学习任何领域的知识必须达到一定的“深度”，否则你的知识就是常识。而常识怎么可能带来你个人的竞争优势呢？\r\n\r\n难，在于长久的坚持。易，在于法门极其简单\r\n\r\nPKM有5个核心的环节：学习-保存-共享-使用-创新\r\n\r\n我们要知道，我们生来到这个世上是要干一些，除了我们其它人无法办到的事情。\r\n\r\n程序员是值得尊敬的，程序员的双手是魔术师的双手。他们把枯燥无味的代码变成了丰富多彩的软件\r\n\r\n黑夜给了我一双黑色的眼睛，而我却用它来寻找光明\r\n\r\n一个能对平凡的事做出不平凡举动的人，一定会有所成就的\r\n\r\n将思考成为习惯还有一个很大的好处--避免焦虑。--刘未鹏 \r\n\r\n追求完美意味着：即便是别人看不到的地方，对其工艺也必须尽心尽力。\r\n\r\n人不风流只为贫，人不风流只为情\r\n\r\n勤以修身，俭以养德\r\n\r\n你若要喜爱你自己的价值，你就得给世界创造价值。　　　　　 --歌  德\r\n\r\n勇者直面刀锋，智者避其锋芒。\r\n\r\n浮躁源于目标的迷失，痛苦源于过多的要求。\r\n\r\n一心一意做事，三心二意生活。\r\n\r\n真的，要想撬起世界，它的最佳支点不是整个地球，不是一个国家、一个民族，也不是别人，它的最佳支点只能是自己的心灵。\r\n\r\n如果你只是当个普通的人，那么为什么要做这些？如果你仅仅在复制你的竞争者，那你就没有存在的意思。就算你以失败高总也比一直模仿他人要好  --《重来》\r\n\r\n“解决社会上多数人共同面临的问题，是设计的本质。在问题解决的过程--也是设计过程中产生的那种人来共同感受到得价值观或精神，以及由此引发的感动，这就是设计最有魅力的地方”', 1436930400, 13);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
