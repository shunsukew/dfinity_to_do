import { to_do } from "../../declarations/to_do";

document.getElementById("clickMeBtn").addEventListener("click", async () => {
  const name = document.getElementById("name").value.toString();
  // Interact with to_do actor, calling the greet method
  const greeting = await to_do.greet(name);

  document.getElementById("greeting").innerText = greeting;
});
