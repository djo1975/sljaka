// app/javascript/search.js

document.addEventListener("DOMContentLoaded", function () {
    const searchInput = document.getElementById("search-query");
    
    searchInput.addEventListener("input", function () {
      const query = searchInput.value.trim();
      
      if (query.length > 2) {
        sendSearchQuery(query);
      }
    });
  });
  
  function sendSearchQuery(query) {
    const xhr = new XMLHttpRequest();
    xhr.open("POST", "/searches/save_query", true);
    xhr.setRequestHeader("Content-Type", "application/json");
  
    xhr.onreadystatechange = function () {
      if (xhr.readyState === XMLHttpRequest.DONE) {
        console.log("Server response:", xhr.responseText);
      }
    };
  
    xhr.send(JSON.stringify({ query: query }));
  }
  