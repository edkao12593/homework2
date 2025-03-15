// メニュー開閉
$(".header--btn, .header--nav__btn").on("click", function (e) {
  e.preventDefault();
  $(".header--nav").toggleClass("open");
});

// ボタンスクロール連動
$(window).on("scroll", function () {
  var $toTopButton = $(".header--btn,.common--top");
  var scrollTop = $(this).scrollTop();
  var windowHeight = $(this).height();
  if (scrollTop >= windowHeight - 600) {
    $toTopButton.removeClass("off");
  } else {
    $toTopButton.addClass("off");
  }
});

// カレント表示
$(window).on("load", function () {
  var now_position = $(".header--nav").data("now");
  $(".header--nav__link").each(function (index, element) {
    var link_position = $(this).data("current");
    if (now_position == link_position) {
      $(this).addClass("on");
    }
  });
});

$(window).on("load", function () {
  var now_position = $(".common--header").data("now");
  $(".play--nav__link,.dl--nav__link").each(function (index, element) {
    var link_position = $(this).data("current");
    if (now_position == link_position) {
      $(this).addClass("on");
    }
  });
});

// スムーススクロール
$('a[href^="#"]').click(function () {
  var speed = 500;
  var href = $(this).attr("href");
  var target = $(href == "#" || href == "" ? "html" : href);
  var position = target.offset().top;
  if ($(this).hasClass("smooth")) {
    $("html, body").animate({
      scrollTop: position
    }, speed, "swing");
  }
  return false;
});