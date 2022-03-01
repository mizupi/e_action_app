function pullDown() {
  const pullDownList = document.getElementById("menu-btn");
  pullDownList.addEventListener('click', function(){
    console.log("OK")
  })
};

window.addEventListener('load', pullDown)