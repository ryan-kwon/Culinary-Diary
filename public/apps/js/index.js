function loadTopicPage(){
	window.location="/public/topics.html";
}
function loadRecipePage(){
	window.location="/public/recipe.html"
}
function loadNoodlePage(){
	window.location="/public/noodles.html"
}

const carousel = document.querySelector('.carousel');
const dots = document.querySelector('.carousel-dots');

for (let i = 0; i < carousel.children.length; i++) {
	const dot = document.createElement('span');
	dot.classList.add('dot');
	dots.appendChild(dot);

	dot.addEventListener('click', () => {
		carousel.scrollLeft = i * carousel.children[0].offsetWidth;
		setActiveDot(i);
	});
}

function setActiveDot(index) {
	const activeDot = document.querySelector('.dot.active');
	if (activeDot) activeDot.classList.remove('active');
	dots.children[index].classList.add('active');
}

carousel.addEventListener('scroll', () => {
	const index = Math.round(carousel.scrollLeft / carousel.children[0].offsetWidth);
	setActiveDot(index);
});