document.addEventListener("DOMContentLoaded", () => {
  const userNameInput = document.querySelector("#search-user");
    if (userNameInput){
      const inputElement = document.getElementById("search-user");
      inputElement.addEventListener("input", () => {
        const keyword = document.getElementById("search-user").value;
        const XHR = new XMLHttpRequest();
        XHR.open("GET", `/users/search/?keyword=${keyword}`, true);
        XHR.responseType = "json";
        XHR.send();
        XHR.onload = () => {
          const searchResult = document.getElementById("search-result");
          searchResult.innerHTML = "";
          if (XHR.response) {
            const userName = XHR.response.keyword;
            userName.forEach((user) => {
              const childElement = document.createElement("div");
              childElement.setAttribute("class", "child");
              childElement.setAttribute("id", user.id);
              childElement.innerHTML = user.user_name;
              searchResult.appendChild(childElement);
              const clickElement = document.getElementById(user.id);
              clickElement.addEventListener("click", () => {
                document.getElementById("search-user").value = clickElement.textContent;
                clickElement.remove();
              });
            });
          };
        };
      });
    };
  });