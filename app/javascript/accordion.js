function accordions() {
  const parents = 'accordion-open-heading-';
	const dtObj = document.getElementsByTagName('dt');
	const dtMatch = new RegExp(parents);

  for(var i = 0; i < dtObj.length; i++) {
		if(dtObj[i].id.match(dtMatch)) {
      dtObj[i].addEventListener("click", () => {
        const children = 'accordion-open-body-';
        const ddObj = document.getElementById('dd');
        const ddMatch = new RegExp(children)

        for(i = 0; i < ddObj.length; i++) {
          if(ddObj[i].id.match(ddMatch)) {
            ddObj[i].classList.toggle("hidden");
          };
        };
      });
		};
	};

  // アコーディオンタイトルを取得
//   const accordionTriggers = document.querySelectorAll(`#accordion-open-heading *`);
//   console.log(accordionTriggers)
//   accordionTriggers.addEventListener('click', () => {
//     // 開閉させる要素を取得
//     const content = document.querySelectorAll(`#accordion-open-body *`);
//     // 'hidden'クラスを付与or削除
//     content.classList.toggle("hidden");
//   });
};

window.addEventListener('load', accordions)