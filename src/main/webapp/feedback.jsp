<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TeaMax Cafe Feedback</title>
<script src="https://cdn.tailwindcss.com"></script>
<style>
body { background: linear-gradient(135deg, #1e3c72, #2a5298); }
.star { font-size: 24px; cursor: pointer; color: #d1d5db; transition: 0.2s; }
.star.active { color: #facc15; }
</style>
</head>

<body class="min-h-screen flex items-center justify-center px-4 py-8">

<div class="w-full max-w-2xl bg-white/10 backdrop-blur-lg rounded-2xl shadow-2xl p-6 sm:p-8 text-white">
<h2 class="text-2xl sm:text-3xl font-bold text-center mb-2">☕ TeaMax Cafe</h2>
<p class="text-center text-sm mb-6 opacity-80">We value your feedback ❤️</p>

<!-- ✅ IMPORTANT CHANGE HERE -->
<form id="feedbackForm" 
      action="<%= request.getContextPath() %>/FeedbackServlet" 
      method="post" 
      class="space-y-6">

    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
        <input type="text" name="name" placeholder="Full Name"
               class="p-3 rounded-lg bg-white/20 focus:outline-none" required>

        <input type="tel" name="mobile" id="mobile"
               placeholder="Mobile Number"
               class="p-3 rounded-lg bg-white/20 focus:outline-none" required>
    </div>

    <input type="email" name="email"
           placeholder="Email Address"
           class="w-full p-3 rounded-lg bg-white/20 focus:outline-none" required>

    <div>
        <label class="block mb-2 font-semibold">Rate Your Experience</label>
        <div id="ratingStars" class="flex gap-2"></div>
        <input type="hidden" id="ratingValue" name="rating" required>
    </div>

    <textarea name="feedback"
              placeholder="Your Feedback..."
              class="w-full p-3 rounded-lg bg-white/20 focus:outline-none"></textarea>

    <button type="submit"
            class="w-full bg-yellow-400 text-black font-bold py-3 rounded-lg hover:bg-yellow-300 transition">
        Submit Feedback
    </button>
</form>
</div>

<script>
const ratingContainer = document.getElementById("ratingStars");
const ratingInput = document.getElementById("ratingValue");

for(let i=1;i<=5;i++){
    let star = document.createElement("span");
    star.innerHTML = "★";
    star.classList.add("star");

    star.addEventListener("click",()=>{
        document.querySelectorAll(".star").forEach((s,index)=>{
            s.classList.toggle("active", index<i);
        });
        ratingInput.value = i;
    });

    ratingContainer.appendChild(star);
}
</script>

</body>
</html>

