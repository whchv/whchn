var isAd2 = /android\s*2\./i.test(navigator.userAgent);
var mi2a = /mi 2a/i.test(navigator.userAgent);
function $(o) {
    return document.querySelector(o);
}

function $$(o) {
    return document.querySelectorAll(o);
}
//触屏事件
var touchSlider = {
    init: function() {
        this.touchInitPosX = 0; //手指初始位置
        this.touchEndPosX = 0; //手指初始位置
        this.touchInitPos = 0; //手指初始位置
        this.startPos = 0; //移动开始的位置
        this.totalDist = 0, //移动的总距离
        this.deltaX1 = 0; //每次移动的正负
        this.deltaX2 = 0; //每次移动的正负
        var self = this;
        $('body').addEventListener('touchstart', function(e) {
            self.touchstart(e);
        }, false);
        $('body').addEventListener('touchmove', function(e) {
            self.touchmove(e);
        }, false);
        $('body').addEventListener('touchend', function(e) {
            self.touchend(e);
        }, false);
        $('body').addEventListener('touchcancel', function(e) {
            itemReset();
        }, false);
    },
    touchstart: function(e) {
        if (e.touches.length !== 1) {
            return;
        } //如果大于1个手指，则不处理
        this.touchEndPosX = this.touchInitPosX = e.touches[0].pageX; // 每次move的触点位置
        this.touchInitPos = e.touches[0].pageY; // 每次move的触点位置
        this.deltaX1 = this.touchInitPos; //touchstart的时候的原始位置
        this.startPos = 0;
        this.startPosPrev = -displayHeight;
        this.startPosNext = displayHeight;
        this.hasPrev = !! $('#prev');
        this.hasNext = !! $('#next');
        //手指滑动的时候禁用掉动画
        if (this.hasNext) {
            $('#next').className += ' touchmove';
        }
        $('#current').className += ' touchmove';
        if (this.hasPrev) {
            $('#prev').className += ' touchmove';
        }
    },
    touchmove: function(e) {
        if (e.touches.length !== 1) {
            return;
        }
        this.touchEndPosX = e.touches[0].pageX;
        var currentX = e.touches[0].pageY;
        this.deltaX2 = currentX - this.deltaX1; //记录当次移动的偏移量
        this.totalDist = this.startPos + currentX - this.touchInitPos;
        var pos = '0,' + this.totalDist + 'px';
        $('#current').style.WebkitTransform = 'translate3d(' + pos + ', 0)';
        this.startPos = this.totalDist;
        //处理上一张和下一张
        if (this.totalDist < 0) { //露出下一张
            if (this.hasNext) {
                this.totalDist2 = this.startPosNext + currentX - this.touchInitPos;
                var pos2 = '0,' + this.totalDist2 + 'px';
                $('#next').style.WebkitTransform = 'translate3d(' + pos2 + ', 0)';
                this.startPosNext = this.totalDist2;
            }
        } else { //露出上一张
            if (this.hasPrev) {
                this.totalDist2 = this.startPosPrev + currentX - this.touchInitPos;
                var pos2 = '0,' + this.totalDist2 + 'px';
                $('#prev').style.WebkitTransform = 'translate3d(' + pos2 + ', 0)';
                this.startPosPrev = this.totalDist2;
            }
        }
        this.touchInitPos = currentX;
    },
    touchend: function(e) {
        if (this.hasPrev) {
            $('#prev').className = $('#prev').className.replace(/\s*\btouchmove\b/g, '');
        }
        $('#current').className = $('#current').className.replace(/\s*\btouchmove\b/g, '');
        if (this.hasNext) {
            $('#next').className = $('#next').className.replace(/\s*\btouchmove\b/g, '');
        }
        if (this.deltaX2 < -25) {
            nextImg();
        } else if (this.deltaX2 > 25) {
            prevImg();
        } else {
            this.restore();
            if (currentIndex == 7) {
                var ncom = comCur;
                if (this.touchEndPosX - this.touchInitPosX > 10) {
                    if (ncom > 0) {
                        ncom--;
                    } else {
                        ncom = comdata.length - 1;
                    }
                } else if (this.touchInitPosX - this.touchEndPosX > 10) {
                    if (ncom < comdata.length - 1) {
                        ncom++;
                    } else {
                        ncom = 0;
                    }
                } else {
                    ncom++;
                    if (ncom >= comdata.length) {
                        ncom = 0;
                    }
                };
                ncom != comCur && switchCom(ncom);
            };
        }
        this.deltaX2 = 0;
    },
    restore: function() { //touch未遂 复位
        itemReset();
    }
}
//3个大图复位
    function itemReset() {
        $('#current').style.WebkitTransform = 'translate3d(0,0, 0)';
        if ($('#prev')) {
            $('#prev').style.WebkitTransform = 'translate3d(0,-' + displayHeight + 'px, 0)';
        }
        if ($('#next')) {
            $('#next').style.WebkitTransform = 'translate3d(0,' + displayHeight + 'px, 0)';
        }
    }

    function prevImg() {
        if (currentIndex > 0) {
            currentIndex--;
        } else {
            itemReset();
            return false;
        }
        var nextIndex = currentIndex + 1 > allItems - 1 ? 0 : currentIndex + 1;
        $('#current').style.WebkitTransform = 'translate3d(0,' + displayHeight + 'px,0)';
        if ($('#next')) {
            $('#wrap').removeChild($('#next'));
        }
        $('#current').id = 'next';
        $('#prev').style.WebkitTransform = 'translate3d(0,0,0)';
        $('#prev').id = 'current';
        setTimeout(function() {
            // $('#current').innerHTML=data[currentIndex];
            if ($('.play')) {
                $('.play').className = $('.play').className.replace(/\s*\bplay\b/g, '');
            }
            $('#current').className += ' play';
        }, 400)
        if (typeof(slideCallback) == 'function') {
            slideCallback(currentIndex)
        }
        var prevIndex = currentIndex - 1;
        if (prevIndex < 0) {
            prevIndex = allItems - 1;
            return false;
        } else if (nextIndex == allItems - 1) {
            $('#arr').style.display = '';
            $('#yunlaiad').style.display = 'none';
        }
        addFrame(prevIndex, 'prev');
    }

    function nextImg() {
        if (currentIndex < allItems - 1) {
            currentIndex++;
        } else {
            itemReset();
            return false;
        }
        var prevIndex = currentIndex === 0 ? allItems - 1 : currentIndex - 1;
        $('#current').style.WebkitTransform = 'translate3d(0,-' + displayHeight + 'px,0)';
        if ($('#prev')) {
            $('#wrap').removeChild($('#prev'));
        }
        $('#current').id = 'prev';
        $('#next').style.WebkitTransform = 'translate3d(0,0,0)';
        $('#next').id = 'current';
        setTimeout(function() {
            //$('#current').innerHTML=data[currentIndex];
            if ($('.play')) {
                $('.play').className = $('.play').className.replace(/\s*\bplay\b/g, '');
            }
            $('#current').className += ' play';
        }, 400)
        if (typeof(slideCallback) == 'function') {
            slideCallback(currentIndex)
        }
        var nextIndex = currentIndex + 1;
        if (nextIndex >= allItems) {
            $('#yunlaiad').style.display = 'block';
            $('#arr').style.display = 'none';
            return false;
        } else {
            $('#yunlaiad').style.display = 'none';
        }
        addFrame(nextIndex, 'next');
    }

    function addFrame(index, pos) {
        var addItem = document.createElement('div');
        addItem.className = 'item item-' + index;
        addItem.id = pos;
        addItem.style.WebkitTransform = 'translate3d(0,' + (pos == 'prev' ? '-' : '') + displayHeight + 'px,0)';
        addItem.innerHTML = data[index];
        if (pos == 'prev') {
            $('#wrap').insertBefore(addItem, $('#current'));
        } else {
            $('#wrap').appendChild(addItem);
        }
        if (index == 8) {
            switchCom();
        } else if (index == 0) {
            $('.item-0 .bg').style.opacity = 1;
        }
    }
    // 切换评论内容
var comCur = 0,
    comtimer1 = 0,
    comtimer2 = 0;

function switchCom(i) {
    if (i == null) {
        // 初始化评论区
        comCur = 0;
        $('.bg_fans_title').innerHTML = comdata[0][0];
        // $('.bg_fans_from').innerHTML = comdata[0][1];
        $('.bg_fans_content').innerHTML = comdata[0][2];
        $('#fans_com_dot li').className = 'current';
    } else if (comCur != i) {
        if (mi2a) {
            comCur = i;
            var com = comdata[comCur];
            $('.bg_fans_title').innerHTML = com[0];
            $('.bg_fans_from').innerHTML = com[1];
            $('.bg_fans_content').innerHTML = com[2];
            $('#fans_com_dot .current').className = '';
            $$('#fans_com_dot li')[comCur].className = 'current';
        } else if (comtimer2 == 0) {
            comCur = i;
            $('#fans_com').className = 'fade_out_in';
            comtimer1 = setTimeout(function() {
                var com = comdata[comCur];
                $('.bg_fans_title').innerHTML = com[0];
                $('.bg_fans_from').innerHTML = com[1];
                $('.bg_fans_content').innerHTML = com[2];
                $('#fans_com_dot .current').className = '';
                $$('#fans_com_dot li')[comCur].className = 'current';
            }, 300);
            comtimer2 = setTimeout(function() {
                $('#fans_com').className = '';
                comtimer1 = comtimer2 = 0;
            }, 600);
        }
    };
}
//界面尺寸发生变化重置
function initDisplay(e) {
    if ($('#wrap').offsetWidth != displayWidth) { //ios
        displayWidth = $('#wrap').offsetWidth;
        displayHeight = $('#wrap').offsetHeight;
        if ((/iPhone/).test(navigator.userAgent)) {
            if (window.orientation == 90 || window.orientation == -90) {
                displayHeight = window.screen.width - 51;
            } else {
                displayHeight = window.screen.height - 64;
            }
            $('#wrap').style.height = displayHeight + 'px';
            if ($('#current img').offsetHeight / $('#current img').offsetWidth >= displayHeight / displayWidth) {
                $('#current img').style.height = displayHeight + 'px';
            } else {
                $('#current img').style.width = displayWidth + 'px';
            }
            setTimeout(function() {
                window.scrollTo(0, 1);
            }, 1);
        }
        itemReset();
    } else { //android
        setTimeout(function() {
            if ($('#wrap').offsetWidth != displayWidth) {
                displayWidth = $('#wrap').offsetWidth;
                displayHeight = $('#wrap').offsetHeight;
                itemReset();
            } else {
                setTimeout(function() {
                    displayWidth = $('#wrap').offsetWidth;
                    displayHeight = $('#wrap').offsetHeight;
                    itemReset();
                }, 500)
            }
        }, 300)
    }
}
var currentIndex = 0;
var allItems = 0; //总图片数据
var ppp = document.documentElement.clientWidth
var displayWidth = document.documentElement.clientWidth; //图片区域最大宽度
var displayHeight = document.documentElement.clientHeight; //图片区域最大高度
window.addEventListener('orientationchange resize', initDisplay, false);
document.addEventListener('touchmove', function(e) {
    e.preventDefault();
}, false);

//模板
var data = [
    // 0
    '<div class="box ">' + '<h2>啄木鸟教育</h2>' + '</div>' + '<div class="bg "><div class="slide_l "></div><div class="slide_r "></div></div>',
    // 1
    '<div class="box ">' + '<div class="vert_box ">' + '<div class="mod_title ">' + '<img src="nuc/images/im_top.png" />' + '</div>' + '<div class="">' + '<a href="javascript:;"><img src="nuc/images/im_video.jpg" /></a>' + '</div>' + '<div class="mod_intro">' + '<img src="nuc/images/im_face.png" />' + '<p class="per_info">精英计划：针对13-18岁的初高中学生量身定制的赴美国名校读本科的一站式留学解决方案。<br/>面向人群：初一、初二、初三、高一、高二学生<br/><br/>三大服务模块：留学考试培训、活动规划、留学申请。直达美国前30前50名校...</p>' + ' </div>' + '</div>' + '</div>',
    // 2
    '<div class="box">' + '<div class="mod_title">' + '<img src="nuc/images/im_top.png" />' + '</div>' + '<div class="mod_year">' + '<div class="year_photo"><img src="nuc/images/im_year1.jpg" /></div>' + '<div class="year_t1"><a href="javascript:;"><h2>精英计划</h2></a><p class="yt_info">精英计划针对美国TOP30名校申请提供5大服务，分别是学习规划、留学考试培训、活动策划、留学申请和精英独享。</p></div>' + '<div class="year_t2"><p class="yt_info">初高中签约保录美国前30前50名校。</p></div>'  + '<a class="year_music" href="javascript:;" onclick=""><span class="hide">精英计划</span> </a>' + '</div>' + '</div>',
    // 3
    '<div class="box">' + '<div class="mod_title">' + '<img src="nuc/images/im_top.png" />' + '</div>' + '<div class="mod_year">' + '<div class="year_photo"><img src="nuc/images/im_year2.jpg" /></div>' + '<div class="year_t1"><a href="javascript:;"><h2>录取标准</h2></a><p class="yt_info">单纯的高分已不能被美国名校顺利录取，活动背景在申请中的重要作用已经凸显出来，活动是否有特色完全可以左右招生官对一个申请者的录取态度。</p></div>' + '<div class="year_t2"><p class="yt_info">GPA、托福/SAT语言成绩、课外活动背景、申请/选校/文书三者缺一不可。</p></div>' + '<a class="year_music" href="javascript:;"><span class="hide">美国名校录取标准</span> </a>' + '</div>' + '</div>',
    // 4
    '<div class="box">' + '<div class="mod_title">' + '<img src="nuc/images/im_top.png" />' + '</div>' + '<div class="mod_year">' + '<div class="year_photo"><img src="nuc/images/im_year3.jpg" /></div>' + '<div class="year_t1"><a href="javascript:;"><h2>录取白皮书</h2></a><p class="yt_info">2014美国大学（本科）录取白皮书是国内第一本基于中国学子录取数据的分析报告。汇总了近7年美国大学录取数据分析结果，是报考美国大学的最佳参考。</p></div>' + '<div class="year_t2"><p class="yt_info">专业、全面、深入的了解2014年美国大学的录取及录取规律；2015年美国大学的录取趋势...</p></div>' + '<span class="hide">美国名校录取标准</span> </a>' + '</div>' + '</div>',
    // 5
    '<div class="box">' + '<div class="mod_title">' + '<img src="nuc/images/im_top.png" />' + '</div>' + '<div class="mod_year">' + '<div class="year_photo"><img src="nuc/images/im_year4.jpg" /></div>' + '<div class="year_t1"><a href="javascript:;"><h2>托福保分班</h2></a><p class="yt_info">听力，词汇，阅读，语法与翻译多个模块学习，全面提高学员听说读写能力。啄木鸟国际教育内部教材，所选文章与托福考试话题相吻合，具有高度针对性。</p></div>' + '<div class="year_t2"><p class="yt_info">60天跨越美国名校托福门槛，横扫阻碍托福得分疑难杂症。</p></div>' + '<a class="year_music" href="http://y.qq.com/w/album.html?albumid=190179"><span class="hide">花又开好了</span> </a>' + '</div>' + '</div>',
    // 6
    '<div class="box">' + '<div class="mod_title">' + '<img src="nuc/images/im_top.png" />' + '</div>' + '<div class="mod_year">' + '<div class="year_photo"><img src="nuc/images/im_year5.jpg" /></div>' + '<div class="year_t1"><a href="javascript:;"><h2>SAT强化精品班</h2></a><p class="yt_info">设立授课班主任负责制，严格监督学生单词以及课程作业的完成。强化授课，让学生把握SAT考试出题思路和答题技巧，进一步提高SAT各科成绩。</p></div>' + '<div class="year_t2"><p class="yt_info">60天跨越美国名校SAT门槛，横扫阻碍 SAT 得分疑难杂症。</p></div>' + '<a class="year_music" href="http://y.qq.com/w/album.html?albumid=79022"><span class="hide">My Love</span> </a>' + '</div>' + '</div>',
    // 7
    '<div class="box">' + '<div class="mod_title">' + '<img src="nuc/images/im_top.png">' + '</div>' + '<div class="bitem_wrap">' + '<div class="box_item current_box_item">' + '<div class="bg_fans_book"><img src="nuc/images/bg_fans_book.jpg" alt=""></div>' + '<ul id="fans_com_dot" class="mod_tag tag_x"><li><span>1</span></li><li><span>2</span></li><li><span>3</span></li><li><span>4</span></li><li><span>5</span></li></ul>' + '<div id="fans_com">' + '<h3>金牌名师</h3></div>' + '<div class="bg_fans_title"></div>' + '<div class="bg_fans_from"></div>' + '<div class="bg_fans_content"></div>' + '</div>' + '</div>',
    // 8
    '<div class="box">' + '<div class="mod_title">' + '<img src="nuc/images/im_top.png" />' + '</div>' + '<div class="fans_photo"><img src="nuc/images/im_fans.jpg" /></div>' + '<div class="fans_t"><p>啄木鸟教育在中国首家提出留学规划的理念，并针对初二至高二学生推出啄木鸟精英计划，其突出特点就是能够为学员量身定制一整套美国留学的完美解决方案。啄木鸟教育成立至今，专注于美国名校申请，旨在为中国留学生提供整套...</p></div>' + '</div>',
    // 9
    '<div class="box">' + '<div class="mod_title">' + '<img src="nuc/images/im_top.png" />' + '</div>' + '<div class="mod_old">' + '<h3 class="old_tit">精英学员</h3>' + '<div class="old_list">' + '<div class="old_list_part">' + '<div class="old_item old_1">' + '<a href="http://www.zmnedu.com/fangtan/12326.html" class="old_photo">' + '<div class="old_box">' + '<img src="nuc/images/im_old_1.jpg" />' + '</div>' + '<p class="ol_time">精英学员 Angela<br/>托福110分备考心得</p>'  + '<p class="ol_time"></p>' + '</a>' + '</div>' + '<div class="old_item old_2">' + '<a href="http://www.zmnedu.com/fangtan/12325.html" class="old_photo">' + '<div class="old_box">' + '<img src="nuc/images/im_old_2.jpg" />' + '</div>' + '<p class="ol_time">精英学员 Alice<br/>谈 TOEFL 备考心得</p>' + '</a>' + '</div>' + '</div>' + '<div class="old_list_part">' + '<div class="old_item old_3">' + '<a href="http://www.zmnedu.com/fangtan/12328.html" class="old_photo">' + '<div class="old_box">' + '<img src="nuc/images/im_old_3.jpg" />' + '</div>' + '<p class="ol_time">精英学员雷同学<br/>TOEFL 备考心得</p>' + '</a>' + '</div>' + '<div class="old_item old_4">' + '<a href="http://www.zmnedu.com/fangtan/12323.html" class="old_photo">' + '<div class="old_box">' + '<img src="nuc/images/im_old_4.jpg" />' + '</div>' + '<p class="ol_time">精英学员 Cherry<br/>谈 TOEFL/SAT 备考</p>' + '</a>' + '</div>' + '</div>' + '</div>' + '</div>' + '</div>'
];
var comdata = [
    ['<p>程来川（猴哥）介绍</p>', '<p></p>', '<p>啄木鸟教育执行总裁及满分网创始人，SAT、托福、GRE 备考、学习规划及备考心理专家；擅长学习规划、留学活动规划和专业规划；幸福背词法创始人。出版《猴哥SAT词汇蓝宝书》、《猴哥SAT语法蓝宝书》、《猴哥SAT阅读蓝宝书》、《猴哥SAT写作蓝宝书》、《猴哥SAT数学蓝宝书》、《猴哥SAT填空词频蓝宝书》...</p>'],
    ['<p>陈起永</p>', '<p></p>', '<p>啄木鸟教育创始人及总裁，资深海外升学顾问。本科毕业于北大，之后全奖留学美国。归国进入教育界，帮助众多中国优秀学子成功踏入美国名校。著有《留学去美国》、《2013美国大学(本科)录取白皮书》等，现为美国西北大学及哈佛大学校友。</p>'],
    ['<p>Samantha</p>', '<p></p>', '<p>近10年专业从事美国留学咨询行业期间曾指导数百名学子选校、申请、签证，让其梦想成真。送达前30位学校的学生多达数百人，其中包括斯坦福大学，宾大，芝加哥大学，哥伦比亚大学，杜克大学，西北大学，康奈尔大学，布朗大学等，对于美国大学名校申请具有专业独特的见解和经验。</p>'],
    ['<p>Qubalia</p>', '<p></p>', '<p>7年申请第一线的行业经验；擅于发现学生的亮点及与众不同；200余个成功案例；对全局的实时掌控和始终如一的责任心 。(本科)录取白皮书》等，现为美国西北大学及哈佛大学校友。</p>'],
    ['<p>Lucy</p>', '<p></p>', '<p>美国本科留学资深顾问、Summer School顾问，从事一线的本科留学咨询和申请工作有近7年的实战经验，同时熟悉名校Summer School的申请，签证辅导专业细致，帮助过有拒签史和移民记录的学生顺利获得本科录取且签证一次通过！近两百位学子在其指导下成功通往美国名校，近千份学校实战案例...</p>']
];
//初始化
var items = '<div id="current" class="item item-0" style="-webkit-transform:translate3d(0,0,0)">' + data[0] + '</div><div id="next" class="item item-1" style="-webkit-transform:translate3d(0,100%,0)">' + data[1] + '</div>';
allItems = data.length;
/*逻辑部分*/
//预加载
function preloading() {
    var imgurls = ['nuc/images/im_face.png', 'nuc/images/line_bg.png', 'nuc/images/im_top.png', 'nuc/images/im_video.jpg', 'nuc/images/im_year1.jpg', 'nuc/images/im_year2.jpg', 'nuc/images/im_year3.jpg', 'nuc/images/im_year4.jpg', 'nuc/images/im_year5.jpg', 'nuc/images/bg_fans_book.jpg', 'nuc/images/im_fans.jpg', 'nuc/images/im_old_1.jpg', 'nuc/images/im_old_2.jpg', 'nuc/images/im_old_3.jpg', 'nuc/images/im_old_4.jpg'];
    var imgs = [];
    var loaded = 0;
    for (var i = 0; i < imgurls.length; i++) {
        imgs[i] = new Image();
        imgs[i].src = imgurls[i];
    }
}

function pageinit() {
    $('#wrap').innerHTML = items;
    $('#arr').style.display = 'block';
    $('.item-0 .bg').style.opacity = 1;
    setTimeout(function() {
        $('#current').className += ' play';
    }, 100)
    touchSlider.init();
}
//万一进度条卡那了 20秒后直接显示
var fallback = setTimeout(pageinit, 20 * 1000);
//进入页面loading
function loading() {
    var imgurls = ['nuc/images/cover.jpg', 'nuc/images/page1.jpg', 'nuc/images/index@2x.png'];
    if (isAd2) {
        document.body.removeChild($('#cover'));
        document.body.removeChild($('#audio_filter'));
    };
    var imgs = [],
        loaded = 0,
        img_cover, img_bg;
    for (var i = 0; i < imgurls.length; i++) {
        imgs[i] = new Image();
        imgs[i].src = imgurls[i];
        imgs[i].onload = imgs[i].onerror = imgs[i].onabort = function(e) {
            loaded++;
            if (!isAd2) {
                if (this.src.indexOf(imgurls[0]) > -1) {
                    if (e.type === 'load') {
                        img_cover = this;
                    } else {
                        img_cover = -1;
                    }
                } else if (this.src.indexOf(imgurls[1]) > -1) {
                    if (e.type === 'load') {
                        img_bg = this;
                    } else {
                        img_bg = -1;
                    }
                }
                if (this.src.indexOf(imgurls[1]) > -1 && e.type === 'load') {
                    img_bg = this;
                }
                if (img_cover && img_bg) {
                    clearTimeout(fallback)
                    ct_cover.init('百叶窗', img_cover.src, img_bg.src, function(cover) {
                        cover.parentElement.removeChild(cover);
                        // $('#audio_filter').pause();
                        // document.body.removeChild($('#audio_filter'));
                    });
                    img_cover = img_bg = null;
                };
            }
            checkloaded();
        }
    }
    var timer = setTimeout(function() {
        $('#loading').style.opacity = 1;
    }, 500);

    function checkloaded() {
        $('#loading div').style.width = loaded / imgurls.length * 100 + '%';
        if (loaded == imgurls.length) {
            if (timer) {
                clearTimeout(timer)
            }
            if (fallback) {
                clearTimeout(fallback)
            }
            pageinit();
            imgs = null;
            preloading();
        }
    }
}

function slideCallback(index) {
    if (index == 0) {
        $('.mod_control').className += ' firstScr'
    } else {
        $('.mod_control').className = 'mod_control'
    }
    if ($('.mod_control .current')) {
        $('.mod_control .current').className = '';
    }
    $$('.mod_control .mod_tag li')[index].className = 'current';
}
var M = M || {};

$('#arr').onclick = function() {
    nextImg()
}
var g_coder = (function() {
    var _this = this;
    var Base64 = {
        _keyStr: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",
        encode: function(input) {
            var output = "";
            var chr1, chr2, chr3, enc1, enc2, enc3, enc4;
            var i = 0;
            input = Base64._utf8_encode(input);
            while (i < input.length) {
                chr1 = input.charCodeAt(i++);
                chr2 = input.charCodeAt(i++);
                chr3 = input.charCodeAt(i++);
                enc1 = chr1 >> 2;
                enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
                enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
                enc4 = chr3 & 63;
                if (isNaN(chr2)) {
                    enc3 = enc4 = 64;
                } else if (isNaN(chr3)) {
                    enc4 = 64;
                }
                output = output + Base64._keyStr.charAt(enc1) + Base64._keyStr.charAt(enc2) + Base64._keyStr.charAt(enc3) + Base64._keyStr.charAt(enc4);
            }
            return output;
        },
        decode: function(input) {
            var output = "";
            var chr1, chr2, chr3;
            var enc1, enc2, enc3, enc4;
            var i = 0;
            input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "");
            while (i < input.length) {
                enc1 = Base64._keyStr.indexOf(input.charAt(i++));
                enc2 = Base64._keyStr.indexOf(input.charAt(i++));
                enc3 = Base64._keyStr.indexOf(input.charAt(i++));
                enc4 = Base64._keyStr.indexOf(input.charAt(i++));
                chr1 = (enc1 << 2) | (enc2 >> 4);
                chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
                chr3 = ((enc3 & 3) << 6) | enc4;
                output = output + String.fromCharCode(chr1);
                if (enc3 != 64) {
                    output = output + String.fromCharCode(chr2);
                }
                if (enc4 != 64) {
                    output = output + String.fromCharCode(chr3);
                }
            }
            output = Base64._utf8_decode(output);
            return output;
        },
        _utf8_encode: function(string) {
            string = string.replace(/\r\n/g, "\n");
            var utftext = "";
            for (var n = 0; n < string.length; n++) {
                var c = string.charCodeAt(n);
                if (c < 128) {
                    utftext += String.fromCharCode(c);
                } else if ((c > 127) && (c < 2048)) {
                    utftext += String.fromCharCode((c >> 6) | 192);
                    utftext += String.fromCharCode((c & 63) | 128);
                } else {
                    utftext += String.fromCharCode((c >> 12) | 224);
                    utftext += String.fromCharCode(((c >> 6) & 63) | 128);
                    utftext += String.fromCharCode((c & 63) | 128);
                }
            }
            return utftext;
        },
        _utf8_decode: function(utftext) {
            var string = "";
            var i = 0;
            var c = c1 = c2 = 0;
            while (i < utftext.length) {
                c = utftext.charCodeAt(i);
                if (c < 128) {
                    string += String.fromCharCode(c);
                    i++;
                } else if ((c > 191) && (c < 224)) {
                    c2 = utftext.charCodeAt(i + 1);
                    string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
                    i += 2;
                } else {
                    c2 = utftext.charCodeAt(i + 1);
                    c3 = utftext.charCodeAt(i + 2);
                    string += String.fromCharCode(((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));
                    i += 3;
                }
            }
            return string;
        }
    };
    return {
        Base64: Base64
    };
})();
// 封面动画
var ct_cover = (function() {
    'use strict';
    // 工具函数
    function $(s, p) {
        return p && p.querySelector ? p.querySelector(s) : document.querySelector(s)
    };

    function $$(s, p) {
        return p && p.querySelector ? p.querySelectorAll(s) : document.querySelectorAll(s)
    };

    function removeClass(e, c) {
        e.classList ? e.classList.remove(c) : (e.className = e.className.replace(new RegExp('\\s*\\b' + c + '\\b\\s*', 'g'), ' '))
    };

    function preventEvent(e) {
        return e.preventDefault(), e.stopPropagation(), false
    };

    function getX(e) {
        return e.touches ? e.touches[0].pageX : e.pageX
    };

    function getY(e) {
        return e.touches ? e.touches[0].pageY : e.pageY
    };
    var vw = 0,
        vh = 0,
        wrap = null,
        isInited = 0,
        _start = 'mousedown',
        _move = 'mousemove',
        _end = 'mouseup',
        filter, img, img_bg,
        isOpen = 0,
        isAd2 = /android\s+2/i.test(navigator.userAgent);
    // 百叶窗
    var f_shutters = {
        count: 12, // 数量
        time: 800, // 翻转一片所需的时间
        distance: 400, // 20^2 判断翻转的滑动距离
        perspective: 1200 // 视点距离
    };
    f_shutters.onstart = function(e) {
        if (!isOpen) {
            f_shutters.x = getX(e);
            f_shutters.y = getY(e);
        }
        //f_shutters.bg_sound.play();
        return preventEvent(e);
    };
    f_shutters.onmove = function(e) {
        if (!isOpen) {
            var x = getX(e) - f_shutters.x,
                y = getY(e) - f_shutters.y;
            if (x * x + y * y > f_shutters.distance) {
                f_shutters.flip(Math.abs(x) > Math.abs(y) ? (x > 0 ? 'r' : 'l') : (y > 0 ? 'b' : 't'));
            }
        }
        return preventEvent(e);
    };
    f_shutters.onend = function(e) {
        if (!isOpen) {
            f_shutters.flip('b');
        }
        return preventEvent(e);
    };
    f_shutters.flip = function(direction) {
        if (isOpen) {
            return false;
        }
        isOpen = 1;
        // 切割封面图
        var pre_ts = 'transition' in document.body.style ? '' : '-webkit-',
            pre_tf = 'transform' in document.body.style ? '' : '-webkit-',
            pre_p = 'perspective' in document.body.style ? '' : '-webkit-',
            pre_bs = 'backgroundSize' in document.body.style ? '' : '-webkit-';
        var v = /l|r/i.test(direction), // 翻转方向
            iv = /t|r/i.test(direction), // 反方向
            d = Math.ceil((v ? vw : vh) / this.count),
            dw = d / 2,
            dh = (v ? vh : vw) / 2,
            dc = dw / Math.sqrt(3),
            w = v ? d : vw,
            h = v ? vh : d,
            size = 'width:' + w + 'px;height:' + h + 'px;',
            origin = v ? ((iv ? '100%' : '0') + ' 50%') : ('50% ' + (iv ? '0' : '100%')),
            rd = '' + ~~!v + ', ' + ~~v + ',0';
        var h = '',
            tf = pre_tf + 'transform';
        h += '<style>.ct-st-chip{position:absolute;' + pre_tf + 'transform-style:preserve-3d;}.ct-st-side{margin:0;display:block;position:absolute;' + pre_tf + 'transform-style:preserve-3d;}</style>';
        h += '<div style="position:relative;width:' + vw + 'px; height:' + vh + 'px;' + pre_p + 'perspective:' + this.perspective + 'px;">';
        // 调整背景图尺寸
        var w_bg = img_bg.width,
            h_bg = img_bg.height,
            sw_bg = w_bg / vw,
            sh_bg = h_bg / vh,
            p_w_bg = 0;
        if (sw_bg < sh_bg) {
            w_bg = vw;
            h_bg /= sw_bg;
        } else {
            w_bg /= sh_bg;
            h_bg = vh;
            p_w_bg = Math.ceil((w_bg - vw) / 2);
        }
        var s1 = pre_ts + 'transition:' + tf + ' ' + this.time + 'ms ease;z-index:100;' + size + tf + ':translate3d(0,0,-' + dc + 'px);',
            s2 = size + tf + ':translate3d(0,0,' + dc + 'px);background:#222 url(' + img.src + ');' + pre_bs + 'background-size:' + img.width + 'px ' + img.height + 'px;',
            s3 = size + pre_tf + 'transform-origin:' + origin + ';' + tf + ':translate3d(' + (v ? '' : '0,') + (v ^ iv ? '' : '-') + d + 'px,' + (v ? '0,' : '') + dc + 'px) rotate3d(' + rd + ',' + (iv ? '-' : '') + '120deg);background:#222 url(' + img_bg.src + ');' + pre_bs + 'background-size:' + w_bg + 'px ' + h_bg + 'px;';
        for (var i = 0; i < this.count; ++i) {
            var position = '-' + (v ? i * d : 0) + 'px -' + (v ? 0 : i * d) + 'px',
                position_bg = '-' + (v ? i * d + p_w_bg : p_w_bg) + 'px -' + (v ? 0 : i * d) + 'px';
            h += '<div class="ct-st-chip" style="' + s1 + 'left:' + (v ? i * d : 0) + 'px;top:' + (v ? 0 : i * d) + 'px;">'
            // 正面
            + '<div class="ct-st-side" style="' + s2 + 'background-position:' + position + ';"></div>'
            // 翻转面
            + '<div class="ct-st-side" style="' + s3 + 'background-position:' + position_bg + '"></div>' + '</div>';
        }
        h += '</div>';
        var df = document.createElement('div');
        df.innerHTML = h;
        wrap.appendChild(df);
        // 翻转
        setTimeout(function() {
            var chips = $$('.ct-st-chip', wrap);
            // 计算翻转顺序
            var n = Math.floor((v ? f_shutters.x : f_shutters.y) / d),
                isI = /l|t/i.test(direction);
            if (n < 0 || n >= chips.length) {
                n = 0;
            }
            var list = [];
            for (var i = 0, l = chips.length; i < l; i++) {
                var p = n + (isI ? -i : i);
                if (p < 0) {
                    p += l;
                } else if (p >= l) {
                    p -= l;
                }
                list.push(chips[p]);
            }
            chips = list;
            // 翻转
            tf = pre_tf ? 'webkitTransform' : 'transform';
            h = 'translate3d(0,0,-' + dc + 'px) rotate3d(' + rd + ', ' + (iv ? '' : '-') + '120deg)';

            function _flip() {
                var chip = chips.shift();
                chip.style[tf] = h;
                if (chips.length) {
                    setTimeout(function() {
                        _flip()
                    }, 100);
                } else if (f_shutters.onopen) {
                    setTimeout(function() {
                        f_shutters.onopen(wrap);
                    }, f_shutters.time);
                }
            };
            wrap.removeChild(img);
            _flip();
        }, 300);
    };
    f_shutters.init = function() {
        var w = img.width,
            h = img.height,
            sw = w / vw,
            sh = h / vh;
        if (sw < sh) {
            w = vw;
            h /= sw;
        } else {
            w /= sh;
            h = vh;
        }
        img.width = w;
        img.height = h;
        if (!isInited) {
            wrap.innerHTML = '';
            wrap.appendChild(img);
            setTimeout(function() {
                wrap.addEventListener(_start, f_shutters.onstart, true);
                wrap.addEventListener(_move, f_shutters.onmove, true);
                wrap.addEventListener(_end, f_shutters.onend, true);
            }, 0);
            this.bg_sound = $('#audio_filter');
        }
        isInited = 1;
    };
    // 渐隐(默认)
    var f_fadeout = {
        init: function() {
            img.width = vw;
            img.height = vh;
            if (!isInited) {
                wrap.innerHTML = '';
                wrap.appendChild(img);
                setTimeout(function() {
                    wrap.addEventListener(_start, function() {
                        if (isOpen) {
                            return false;
                        }
                        isOpen = 1;
                        img.style.webkitTransition = img.style.transition = 'opacity 1s';
                        setTimeout(function() {
                            img.style.opacity = 0;
                        }, 0);
                        if (f_fadeout.onopen) {
                            setTimeout(function() {
                                f_fadeout.onopen(wrap);
                            }, 500);
                        }
                    }, true);
                }, 0);
            }
            isInited = 1;
        }
    };
    // 初始化
    function _init() {
        filter.init();
        wrap.style.opacity = 1;
        setTimeout(function() {
            removeClass(wrap, 'ct-fadeIn')
        }, 1000);
    };
    return {
        init: function(type, url_cover, url_bg, cb) {
            if (!isAd2 && type === '百叶窗') {
                filter = f_shutters;
            } else {
                filter = f_fadeout;
            }
            filter.onopen = cb;
            if ('ontouchstart' in document) {
                _start = 'touchstart';
                _move = 'touchmove';
                _end = 'touchend';
            }
            wrap || (wrap = $('#cover'));
            img = new Image(), img_bg = new Image();
            img.onload = function() {
                img.isLoaded = 1;
                vw = document.documentElement.clientWidth;
                vh = document.documentElement.clientHeight;
                _init();
                var timer = setInterval(function() {
                    var w = document.documentElement.clientWidth,
                        h = document.documentElement.clientHeight;
                    if (vw != w || vh != h) {
                        clearInterval(timer);
                        vw = w;
                        vh = h;
                        _init();
                    }
                }, 100);
                setTimeout(function() {
                    clearInterval(timer)
                }, 2000);
            };
            img.src = url_cover;
            img_bg.src = url_bg;
        }
    }
})();
document.addEventListener('DOMContentLoaded', function() {
    loading();
}, false);
