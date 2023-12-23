// app/javascript/search.js

document.addEventListener("DOMContentLoaded", function () {
    const searchInput = document.getElementById("search-query");
    
    searchInput.addEventListener("input", function () {
      const query = searchInput.value.trim();
      
      if (query.length > 2) {
        // Ako je upit duži od 2 karaktera, šaljemo AJAX zahtev
        sendSearchQuery(query);
      }
    });
  });
  
  function sendSearchQuery(query) {
    // Šaljemo AJAX zahtev serveru
    const xhr = new XMLHttpRequest();
    xhr.open("POST", "/searches/save_query", true);
    xhr.setRequestHeader("Content-Type", "application/json");
  
    xhr.onreadystatechange = function () {
      if (xhr.readyState === XMLHttpRequest.DONE) {
        // Ovde možete dodati dodatnu logiku nakon završetka zahteva
        console.log("Server response:", xhr.responseText);
      }
    };
  
    // Šaljemo upit kao JSON podatke
    xhr.send(JSON.stringify({ query: query }));
  }
  