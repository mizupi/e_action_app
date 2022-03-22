function pullDown() {
  const pullDownList = document.getElementById("menu-btn");
  pullDownList.addEventListener('click', function() {
    const contents = document.getElementById("menu");
    contents.classList.toggle("hidden");
  })
};

window.addEventListener('load', pullDown)