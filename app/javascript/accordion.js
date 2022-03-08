function accordions() {
  // // // アコーディオンタイトルを取得
  // const accordionList = document.getElementsByClassName("accordion-open-heading");
  // const accordionTriggersArr = Array.prototype.slice.call(accordionTriggers);
  
  // // アコーディオン内容にクラス付与（削除）
  // function toggle() {
  //     const accordionContent = document.getElementsByClassName("accordion-open-body");
  //     accordionContent.classList.toggle("hidden");
  // };
  
  // // クリックで開閉
  // Array.prototype.forEach.call(accordionList, x => {
  //   x.addEventListener('click', toggle);
  // });
  
  // アコーディオンを全て取得
  const accordions = document.getElementsByClassName(".accordion-open");
  // 取得したアコーディオンをArrayに変換(IE対策)
  const accordionsArr = Array.prototype.slice.call(accordions);
  
  accordionsArr.forEach((accordion) => {
    // Triggerを全て取得
    const accordionTriggers = accordion.getElementsByClassName(".accordion-open-heading");
    // TriggerをArrayに変換(IE対策)
    const accordionTriggersArr = Array.prototype.slice.call(accordionTriggers);
    
    accordionTriggersArr.forEach((trigger) => {
      // Triggerにクリックイベントを付与
      trigger.addEventListener("click", () => {
        // アコーディオン内容にクラス付与（削除）
        const accordionContent = trigger.getElementsByClassName("accordion-open-body");
        accordionContent.classList("hidden");
      });
    });
  });
};

window.addEventListener('load', accordions)