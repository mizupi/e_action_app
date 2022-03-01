function pullDown() {
  const pullDownList = document.getElementById("menu");
  pullDownList.addEventListener('click', () => {
    console.log(pullDownList);
  });
}

window.addEventListener('load', pullDown)