const href = location.href;
// ヘッダーの中のaタグを全部取得
var links = document.querySelectorAll(".header > .navbar-nav > .nav-item > .nav-link");

// ループでURLと一致したaタグに current を付ける。
for (var i = 0; i < links.length; i++) {
  if (links[i].href == href) {
    document.querySelectorAll(".header > .navbar-nav > .nav-item")[i].classList.add("current");
  }
}
