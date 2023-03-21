function loadTopicPage(){
	window.location="/public/topics.html";
}
function loadRecipePage(){
	window.location="/public/recipe.html";
}
function loadNoodlePage(){
	window.location="/public/noodles.html";
}
function loadRestaurantPage(){
	window.location="/public/restaurant.html";
}

document.addEventListener('DOMContentLoaded', function() {
	document.getElementById("text-to-copy").addEventListener("click", function() {
		var text = document.getElementById("text-to-copy").innerText;
		var dummy = document.createElement("textarea");
		document.body.appendChild(dummy);
		dummy.value = text;
		dummy.select();
		document.execCommand("copy");
		document.body.removeChild(dummy);
	});
});


//this shit dont work wtf
// var audio = new Audio('/audio/Cariño The Marías  lyrics [sub esp].mp3');
// audio.loop = true;

// // Play the audio when the page is loaded
// document.addEventListener("DOMContentLoaded", function(event) {
// 	audio.volume = 0.1;
// 	audio.play();
// });

// $(document).ready(function() {
// 	// Load the initial content
// 	$('#content').load('home.html');

// 	// Handle clicks on links
// 	$('a').click(function(event) {
// 		event.preventDefault(); // Prevent the link from being followed
// 		var href = $(this).attr('href'); // Get the URL of the new content
// 		$('#content').fadeOut(500, function() {
// 			// Load the new content into the div
// 			$('#content').load(href, function() {
// 				// Fade in the new content
// 				$('#content').fadeIn(500);
// 			});
// 		});
// 	});
// });