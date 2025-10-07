<?php
ob_start();
require_once "header.php";
?>
<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "db";

// Tạo kết nối
$conn = new mysqli($servername, $username, $password, $dbname);

// Hàm lọc dữ liệu đầu vào
function sanitizeInput($data)
{
    return htmlspecialchars(trim($data));
}

// Lấy các giá trị từ form lọc
$search = isset($_GET['search']) ? sanitizeInput($_GET['search']) : '';
$category = isset($_GET['category']) ? (int) $_GET['category'] : 0;
$price_range = isset($_GET['price_range']) ? (float) $_GET['price_range'] : 1000000;

// Xác định số sản phẩm trên mỗi trang
$products_per_page = 6;
$page = isset($_GET['page']) ? max((int) $_GET['page'], 1) : 1;
$offset = ($page - 1) * $products_per_page;

// Xây dựng truy vấn SQL với Prepared Statements
$sql = "SELECT * FROM products WHERE pro_name LIKE ?";
$params = ["%$search%"];

if ($category) {
    $sql .= " AND cate_id = ?";
    $params[] = $category;
}
if ($price_range > 0) {
    $sql .= " AND pro_price <= ?";
    $params[] = $price_range;
}
$sql .= " LIMIT ?, ?";
$params[] = $offset;
$params[] = $products_per_page;

$stmt = $conn->prepare($sql);
$stmt->bind_param(str_repeat('s', count($params) - 2) . 'ii', ...$params);
$stmt->execute();
$result = $stmt->get_result();

?>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        color: #333;
    }

    

    main {
        padding: 20px;
        max-width: 1200px;
        margin: 0 auto;
        background-color: #fff;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
    }

    form {
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 20px;
        gap: 10px;
    }

    form input,
    form select,
    form button {
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ddd;
        border-radius: 5px;
        box-sizing: border-box;
    }

    form button {
        background-color: #007bff;
        color: white;
        border: none;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    form button:hover {
        background-color: #0056b3;
    }

    .slider-container {
        display: flex;
        align-items: center;
        gap: 10px;
        flex-grow: 1;
    }

    .slider {
        flex-grow: 1;
        accent-color: #007bff;
    }

    #product-list {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
    }

    .product {
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 10px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        padding: 15px;
        flex: 1 1 calc(33.333% - 20px);
        box-sizing: border-box;
        transition: transform 0.3s, box-shadow 0.3s;
    }

    .product:hover {
        transform: translateY(-5px);
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
    }

    .product img {
        max-width: 100%;
        height: auto;
        border-bottom: 1px solid #ddd;
        margin-bottom: 10px;
        border-radius: 10px;
    }

    .product h2 {
        font-size: 18px;
        color: #007bff;
        margin: 10px 0;
        text-align: center;
    }

    .product .price {
        font-size: 16px;
        color: #28a745;
        text-align: center;
        font-weight: bold;
    }

    .product .sale {
        font-size: 14px;
        color: #dc3545;
        text-decoration: line-through;
        text-align: center;
    }

    .product p {
        font-size: 14px;
        line-height: 1.5;
        color: #555;
    }

    #pagination {
        text-align: center;
        margin-top: 20px;
    }

    #pagination a {
        margin: 0 5px;
        padding: 10px 15px;
        background-color: #007bff;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s;
    }

    #pagination a:hover {
        background-color: #0056b3;
    }

    #pagination a[style="font-weight:bold;"] {
        background-color: #333;
    }

    
</style>




<main>
    <!-- Form bộ lọc -->
    <form method="GET" action="">
        <input type="text" name="search" placeholder="Tìm kiếm sản phẩm" value="<?php echo htmlspecialchars($search); ?>">
        <select name="category">
            <option value="">Tất cả danh mục</option>
            <?php
            $sql_categories = "SELECT * FROM categories";
            $result_categories = $conn->query($sql_categories);
            if ($result_categories) {
                while ($row_category = $result_categories->fetch_assoc()) {
                    $selected = $category == $row_category['cate_id'] ? 'selected' : '';
                    echo "<option value='" . $row_category['cate_id'] . "' $selected>" . $row_category['cate_name'] . "</option>";
                }
            } else {
                echo "<option value=''>Lỗi tải danh mục</option>";
            }
            ?>
        </select>
        <div class="slider-container">
            <label for="price_range">Khoảng giá:</label>
            <input type="range" id="price_range" name="price_range" min="0" max="1000000" step="1000" value="<?php echo htmlspecialchars($price_range); ?>" class="slider">
            <span id="price_value"><?php echo htmlspecialchars($price_range); ?></span>
        </div>
        <button type="submit">Lọc</button>
    </form>

    <div id="product-list">
        <?php
        if ($result && $result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                echo "<div class='product'>";
                echo "<a href='detail.php?cate_id=" . $row['cate_id'] . "&pro_id=" . $row['pro_id'] . "'>";
                echo '<img src="../back-end/img/' . $row['pro_image'] . '">';
                echo "<h2>" . $row['pro_name'] . "</h2>";
                echo "</a>";
                echo "<p class='price'>Price: $" . $row['pro_price'] . "</p>";
                echo "<p class='sale'>Sale: $" . $row['pro_sale'] . "</p>";
                echo "<p>" . $row['pro_intro'] . "</p>";
                echo "</div>";
            }
        } else {
            echo "No products found";
        }
        ?>
    </div>

    <!-- Phân trang -->
    <div id="pagination">
        <?php
        $count_sql = "SELECT COUNT(*) AS total FROM products WHERE pro_name LIKE ?";
        $count_params = ["%$search%"];

        if ($category) {
            $count_sql .= " AND cate_id = ?";
            $count_params[] = $category;
        }
        if ($price_range > 0) {
            $count_sql .= " AND pro_price <= ?";
            $count_params[] = $price_range;
        }

        $count_stmt = $conn->prepare($count_sql);
        $count_stmt->bind_param(str_repeat('s', count($count_params)), ...$count_params);
        $count_stmt->execute();
        $count_result = $count_stmt->get_result();
        $total_products = $count_result->fetch_assoc()['total'];

        $total_pages = ceil($total_products / $products_per_page);
        for ($i = 1; $i <= $total_pages; $i++) {
            $active = $i == $page ? 'style="font-weight:bold;"' : '';
            echo "<a href='?page=$i&search=$search&category=$category&price_range=$price_range' $active>$i</a>";
        }
        ?>
    </div>
</main>
<script>
    const priceSlider = document.getElementById('price_range');
    const priceValue = document.getElementById('price_value');

    priceSlider.addEventListener('input', () => {
        priceValue.textContent = priceSlider.value;
    });
</script>


<?php
require_once "footer.php";
?>

<?php
$conn->close();
?>