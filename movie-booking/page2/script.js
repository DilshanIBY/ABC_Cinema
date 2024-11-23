const theaters = [
  {
    name: "Liberty By Scope Cinemas - Colpetty",
    address: "37A Srimath Anagarika Dharmapala Mawatha, Colombo 00700",
    image: "theater1.jpg",
    contact: "0112 325 266",
    description: "Two screens make up the Liberty cineplex, Liberty Lite and well, the main Liberty cinema. Conveniently located in the heart of Colombo, the cinema has a car park, which allows for easy access and also equipped with snack bar and cafetaria. Liberty .",
    owner: "Naveed Cader"
  },
  {
    name: "Scope Cinemas Multiplex - CCC",
    address: "City Centre, 137 Sir James Pieris Mawatha, Colombo 00200",
    image: "theater2.jpg",
    contact: "0112 083 064",
    description: "Dedicated toward raising the bar in Sri Lanka’s cinema experience, Scope aims to provide our patrons with all the flare of old-school movie theaters, coupled with state-of-the-art modernity and comfort, consistent with international standards.",
    owner: "Mr. Eranga Jayawansa"
  },
  {
    name: "SkylineRio Cinema",
    address: "WVG2+2M6, Kumaran Ratnam Rd, Colombo 00200",
    image: "theater3.jpg",
    contact: "0112 432 170",
    description: "Rio Cinema Theater is a renowned destination for movie enthusiasts, blending classic charm with modern facilities. Established in the early 1980s, it has been a cornerstone of Colombo's cinematic culture. Equipped with state-of-the-art 4K projection and Dolby Atmos sound, Rio offers an unparalleled viewing experience.",
    owner: "Mr. Suresh Fernando"
  },
  // Add more locations (up to 10)
];

const theaterList = document.querySelector(".theater-list");

theaters.forEach(theater => {
  const card = document.createElement("div");
  card.classList.add("theater-card");

  card.innerHTML = `
    <img src="${theater.image}" alt="${theater.name}">
    <div class="theater-card-content">
      <h3>${theater.name}</h3>
      <p><strong>Address:</strong> ${theater.address}</p>
      <p><strong>Contact:</strong> ${theater.contact}</p>
      <p>${theater.description}</p>
      <p><strong>Owner:</strong> ${theater.owner}</p>
      <a href="#">Reserve Now</a>
    </div>
  `;

  theaterList.appendChild(card);
});
