function scrollConcept() {
  document.getElementById('scroll-top').addEventListener('click', () => {
    // topの表示位置を取得
    const concept = document.getElementById('concept');
    const conceptObj = concept.getBoundingClientRect();
    // conceptへ移動
    window.scrollTo( 0, conceptObj.top);
  });
}

window.addEventListener('load', scrollConcept)