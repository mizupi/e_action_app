function accordions() {
  // クリックする要素を取得
  const parents = 'accordion-open-heading-';
	const dtObj = document.getElementsByTagName('dt');
  // 'accordion-open-heading-'という文字列を含む正規表現オブジェクト生成
	const dtMatch = new RegExp(parents);
  
  // for文で各要素を分解してイベント付与
  for(let i = 0; i < dtObj.length; i++) {
    if(dtObj[i].id.match(dtMatch)) {
      dtObj[i].addEventListener("click", function() {
        // hiddenにしたい要素を取得
        const children = 'accordion-open-body-';
        const ddObj = document.getElementsByTagName('dd');
        // 'accordion-open-body-'という文字列を含む正規表現オブジェクト生成
        const ddMatch = new RegExp(children)
        // classにhiddenをaddして、toggleで切り替え
        if(ddObj[i].id.match(ddMatch)) {
          ddObj[i].classList.toggle("hidden");
        };
      });
		};
	};
};

window.addEventListener('load', accordions)