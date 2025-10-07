// ========================================= PRODUCT CLIENT =========================================== ( database phần let)
let PRODUCTS = [
    { idcategory: "2", image: "../Image/1.png", productName: "Áo", price: 100000, code: "P1" },
    { idcategory: "1", image: "../Image/1.png", productName: "Quần", price: 200000, code: "P2" },
    { idcategory: "3", image: "../Image/1.png", productName: "Giày", price: 300000, code: "P3" },
    { idcategory: "2", image: "../Image/1.png", productName: "Áo", price: 100000, code: "P1" },
    { idcategory: "1", image: "../Image/1.png", productName: "Quần", price: 200000, code: "P2" },
    { idcategory: "3", image: "../Image/1.png", productName: "Giày", price: 300000, code: "P3" },
    { idcategory: "4", image: "../Image/1.png", productName: "Mũ", price: 150000, code: "P4" }
];

const formatter = new Intl.NumberFormat('vi-VN', {
    style: 'currency',
    currency: 'VND'
});

const slider = document.getElementById('product-slider');

window.onload = () => {
    loadProducts(PRODUCTS);
    startCarousel();
};

function loadProducts(products) {
    products.forEach(product => {
        let content = `
            <div class="card">
                <img src="images/${product.image}" alt="${product.productName}">
                <div class="card-body">
                    <div class="product-name">
                        <h5 class="card-title">${product.productName}</h5>
                    </div>
                    <div class="price-and-button">
                        <p class="card-text">${formatter.format(product.price)}</p>
                        <button class= "button-buy" data-code="${product.code}">
                            <i class="bi-plus"></i>
                        </button>
                    </div>
                </div>
            </div>`;
        slider.innerHTML += content;
    });
}


function startCarousel() {
    const cards = document.querySelectorAll('.card');
    let index = 0;

    setInterval(() => {
        index++;
        if (index >= cards.length) {
            index = 0;
        }
        const offset = -index * (cards[0].offsetWidth + 20); // 20px gap
        slider.style.transform = `translateX(${offset}px)`;
    }, 4000); // Change product every 4 seconds
}