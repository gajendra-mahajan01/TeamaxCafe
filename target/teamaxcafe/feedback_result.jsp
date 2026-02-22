<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
Boolean isExisting = (Boolean) request.getAttribute("isExisting");
%>
<html>
<head>
<title>TeaMax Cafe Feedback</title>
<script src="https://cdn.tailwindcss.com"></script>
<style>
.modal { backdrop-filter: blur(6px); }
.scratch { cursor:pointer; background:#ccc; padding:20px; border-radius:12px; font-weight:bold;}
</style>
</head>
<body class="min-h-screen flex items-center justify-center px-4 py-8 bg-gradient-to-br from-blue-800 to-blue-500 text-white">

<div class="bg-white/10 backdrop-blur-lg p-8 rounded-2xl shadow-2xl text-center w-full max-w-md">
<h2 class="text-2xl font-bold mb-4">☕ TeaMax Cafe</h2>

<div id="scratchCard" class="scratch mb-4">Scratch Here</div>
<p id="resultMessage" class="hidden text-lg font-bold"></p>

<button onclick="closePopup()" class="mt-4 bg-black text-white px-6 py-2 rounded-lg w-full">Close</button>
</div>

<script>
const scratchCard = document.getElementById("scratchCard");
const resultMessage = document.getElementById("resultMessage");
const isExisting = <%= isExisting %>;

scratchCard.addEventListener("click", function(){
    scratchCard.style.display = "none";
    resultMessage.style.display = "block";

    if(isExisting){
        resultMessage.innerHTML = "🎉 Congratulations! You unlocked 10% OFF Coupon: <span class='text-green-500'>TEA10</span>";
    } else {
        resultMessage.innerHTML = "☕ Welcome to TeaMax Cafe! We're happy to serve you. Enjoy your time!";
    }
});

function closePopup(){
    window.location.href="feedback.jsp";
}
</script>
</body>
</html>
