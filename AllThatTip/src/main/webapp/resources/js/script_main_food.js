const cardWrapper = document.getElementById('cardWrapper');
        let currentSlide = 0;

        function slideLeft() {
            if (currentSlide > 0) {
                currentSlide--;
            } else {
                currentSlide = cardWrapper.children.length - 1;
            }
            updateSlider();
        }

        function slideRight() {
            if (currentSlide < cardWrapper.children.length - 1) {
                currentSlide++;
            } else {
                currentSlide = 0;
            }
            updateSlider();
        }

        function updateSlider() {
            const cardWidth = cardWrapper.children[0].offsetWidth + 20; // 카드 너비 + 간격
            cardWrapper.style.transform = `translateX(${-currentSlide * cardWidth}px)`;
        }