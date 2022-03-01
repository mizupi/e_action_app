function pullDown() {
  const pullDownList = document.getElementById("menu-btn");
  pullDownList.addEventListener('click', function(){
    console.log("click OK");
  })
});

window.addEventListener('load', pullDown)