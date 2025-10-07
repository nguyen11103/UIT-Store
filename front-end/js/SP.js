
// Giả sử dữ liệu này đến từ cơ sở dữ liệu hoặc API (lấy dữ liệu datadata)
const categories = [
    { name: 'Áo', count: 20 },
    { name: 'Dù', count: 3 },
    { name: 'Balo', count: 5 },
    { name: 'Phụ Kiện', count: 10 },
    { name: 'Khoa HTTT', count: 7 },
    { name: 'Khoa Mạng Máy Tính & TT', count: 4 },
    { name: 'Khoa KHMT', count: 5 }, 
];
// Hàm để hiển thị danh sách danh mục
function renderCategories() {
    const categoryList = document.getElementById('category-list');
    categoryList.innerHTML = ''; 

    categories.forEach(category => {
        const listItem = document.createElement('li');
        listItem.innerHTML = `<a href="#">${category.name} (${category.count})</a>`;
        categoryList.appendChild(listItem);
    });
}

// Gọi hàm render khi trang tải
renderCategories();


const PRODUCTS = [
    { idcategory: "2", image: "../Image/1.png", productName: "Áo", price: 100000, code: "P1" },
    { idcategory: "1", image: "../Image/1.png", productName: "Quần", price: 200000, code: "P2" },
    { idcategory: "3", image: "../Image/1.png", productName: "Giày", price: 300000, code: "P3" },
    { idcategory: "2", image: "../Image/1.png", productName: "Áo", price: 100000, code: "P1" },
    { idcategory: "2", image: "../Image/1.png", productName: "Áo", price: 100000, code: "P1" },
    { idcategory: "1", image: "../Image/1.png", productName: "Quần", price: 200000, code: "P2" },
    { idcategory: "3", image: "../Image/1.png", productName: "Giày", price: 300000, code: "P3" },
    { idcategory: "2", image: "../Image/1.png", productName: "Áo", price: 100000, code: "P1" },
    { idcategory: "1", image: "../Image/1.png", productName: "Quần", price: 200000, code: "P2" },
    { idcategory: "3", image: "../Image/1.png", productName: "Giày", price: 300000, code: "P3" },
    { idcategory: "2", image: "../Image/1.png", productName: "Áo", price: 100000, code: "P1" },
    { idcategory: "2", image: "../Image/1.png", productName: "Áo", price: 100000, code: "P1" },
    { idcategory: "1", image: "../Image/1.png", productName: "Quần", price: 200000, code: "P2" },
    { idcategory: "3", image: "../Image/1.png", productName: "Giày", price: 300000, code: "P3" },
    { idcategory: "2", image: "../Image/1.png", productName: "Áo", price: 100000, code: "P1" },
    { idcategory: "1", image: "../Image/1.png", productName: "Quần", price: 200000, code: "P2" },
    { idcategory: "3", image: "../Image/1.png", productName: "Giày", price: 300000, code: "P3" },
    { idcategory: "2", image: "../Image/1.png", productName: "Áo", price: 100000, code: "P1" },
    { idcategory: "2", image: "../Image/1.png", productName: "Áo", price: 100000, code: "P1" },
    { idcategory: "1", image: "../Image/1.png", productName: "Quần", price: 200000, code: "P2" },
    { idcategory: "3", image: "../Image/1.png", productName: "Giày", price: 300000, code: "P3" },
    { idcategory: "2", image: "../Image/1.png", productName: "Áo", price: 100000, code: "P1" },
    { idcategory: "1", image: "../Image/1.png", productName: "Quần", price: 200000, code: "P2" },
    { idcategory: "3", image: "../Image/1.png", productName: "Giày", price: 300000, code: "P3" },
    { idcategory: "2", image: "../Image/1.png", productName: "Áo", price: 100000, code: "P1" },
    { idcategory: "2", image: "../Image/1.png", productName: "Áo", price: 100000, code: "P1" },
    { idcategory: "1", image: "../Image/1.png", productName: "Quần", price: 200000, code: "P2" },
    { idcategory: "3", image: "../Image/1.png", productName: "Giày", price: 300000, code: "P3" },
    { idcategory: "2", image: "../Image/1.png", productName: "Áo", price: 100000, code: "P1" },
    { idcategory: "4", image: "../Image/1.png", productName: "Mũ", price: 150000, code: "P4" }
];

const formatter = new Intl.NumberFormat('vi-VN', {
    style: 'currency',
    currency: 'VND'
});

const slider = document.getElementById('product-slider');
const pageNumbers = document.getElementById('page-numbers');

let currentPage = 1;
const productsPerPage = 9;
const totalPages = Math.ceil(PRODUCTS.length / productsPerPage);

window.onload = () => {
    loadProducts(currentPage);
    renderPageNumbers();
};

function loadProducts(page) {
    const startIndex = (page - 1) * productsPerPage;
    const endIndex = startIndex + productsPerPage;
    const productsToDisplay = PRODUCTS.slice(startIndex, endIndex);

    slider.innerHTML = '';

    productsToDisplay.forEach(product => {
        let content = `
            <div class="card" 
            style="box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); 
                    transition: transform 0.3s ease, box-shadow 0.3s ease;" 
            onmouseover="this.style.transform='scale(1.05)'; this.style.boxShadow='0 8px 16px rgba(0, 0, 0, 0.3)';" 
            onmouseout="this.style.transform='scale(1)'; this.style.boxShadow='0 4px 8px rgba(0, 0, 0, 0.2)';">
            <img src="${product.image}" alt="${product.productName}">
            <div class="card-body">
                <div class="product-name">
                    <h5 class="card-title">${product.productName}</h5>
                </div>
                <div class="price-and-button">
                    <p class="card-text">${formatter.format(product.price)}</p>
                    <button class="button-buy" data-code="${product.code}">
                        <i class="bi-plus"></i>
                    </button>
                </div>
    </div>
</div>`;
        slider.innerHTML += content;
    });
}

function renderPageNumbers() {
    pageNumbers.innerHTML = '';
    for (let i = 1; i <= totalPages; i++) {
        const pageLink = document.createElement('a');
        pageLink.href = '#';
        pageLink.innerText = i;
        if (i === currentPage) {
            pageLink.classList.add('active');
        }

        pageLink.onclick = (event) => {
            event.preventDefault();
            currentPage = i;
            loadProducts(currentPage);
            renderPageNumbers();
        };

        pageNumbers.appendChild(pageLink);
    }
}

// Pagination buttons
const prevButton = document.createElement('button');
const nextButton = document.createElement('button');

prevButton.innerText = 'Previous';
nextButton.innerText = 'Next';

prevButton.onclick = () => {
    if (currentPage > 1) {
        currentPage--;
        loadProducts(currentPage);
        renderPageNumbers();
    }
};

nextButton.onclick = () => {
    if (currentPage < totalPages) {
        currentPage++;
        loadProducts(currentPage);
        renderPageNumbers();
    }
};

// Add buttons to the page
const paginationContainer = document.querySelector('.pagination');
paginationContainer.appendChild(prevButton);
paginationContainer.appendChild(nextButton);

