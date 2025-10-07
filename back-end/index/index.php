<?php
ob_start();
include_once "../layout/header.php";

/**
 * 
 * Chuyển đổi chuỗi ký tự thành dạng slug dùng cho việc tạo friendly url.
 * 
 * @access public
 * @param string
 * @return string
 */
if (!function_exists('price')) {
    function price($number, $suffix = 'đ')
    {
        if (!empty($number)) {
            return number_format($number, 0, ',', '.') . "$suffix";
        }
        return "0$suffix";
    }
}

// Nhận thông tin bộ lọc từ form
$filter = $_GET['filter'] ?? 'day'; // Lọc mặc định là ngày
$date = $_GET['date'] ?? date('Y-m-d'); // Ngày mặc định là hôm nay
$start_date = '';
$end_date = '';

// Xác định khoảng thời gian dựa trên bộ lọc
switch ($filter) {
    case 'day': // Lọc theo ngày
        $start_date = $date;
        $end_date = $date;
        break;

    case 'week': // Lọc theo tuần
        $start_date = date('Y-m-d', strtotime('monday this week', strtotime($date)));
        $end_date = date('Y-m-d', strtotime('sunday this week', strtotime($date)));
        break;

    case 'month': // Lọc theo tháng
        $start_date = date('Y-m-01', strtotime($date)); // Ngày đầu tháng
        $end_date = date('Y-m-t', strtotime($date));    // Ngày cuối tháng
        break;

    case 'year': // Lọc theo năm
        $start_date = date('Y-01-01', strtotime($date)); // Ngày đầu năm
        $end_date = date('Y-12-31', strtotime($date));   // Ngày cuối năm
        break;

    default: // Mặc định là ngày
        $start_date = $date;
        $end_date = $date;
        break;
}

// Tổng sản phẩm đã bán
$sql = "SELECT COUNT(*) AS total_sold FROM `order` 
        WHERE order_date BETWEEN ? AND ? AND order_stt = 'Giao hàng thành công'";
$stmt = $conn->prepare($sql);
$stmt->execute([$start_date, $end_date]);
$total_sold = $stmt->fetch(PDO::FETCH_ASSOC)['total_sold'] ?? 0;

// Tổng doanh thu
$sql = "SELECT SUM(order_price) AS total_revenue FROM `order` 
        WHERE order_date BETWEEN ? AND ? AND order_stt = 'Giao hàng thành công'";
$stmt = $conn->prepare($sql);
$stmt->execute([$start_date, $end_date]);
$total_revenue = $stmt->fetch(PDO::FETCH_ASSOC)['total_revenue'] ?? 0;

// Số lượng khách hàng duy nhất
$sql = "SELECT COUNT(DISTINCT user_id) AS total_customers FROM `order` 
        WHERE order_date BETWEEN ? AND ? AND order_stt = 'Giao hàng thành công'";
$stmt = $conn->prepare($sql);
$stmt->execute([$start_date, $end_date]);
$total_customers = $stmt->fetch(PDO::FETCH_ASSOC)['total_customers'] ?? 0;
?>

<div class="content" style="padding: 0 30px;">
    <?php if (isset($_SESSION['alert']['warning'])) : ?>
        <div class="alert alert-warning d-flex justify-content-between" role="alert">
            <span><?= $_SESSION['alert']['warning']; ?></span>
            <span><i class="fas fa-exclamation-triangle" style="color: yellow; font-size: 25px;"></i></span>
        </div>
        <?php unset($_SESSION['alert']['warning']); ?>
    <?php endif; ?>
</div>

<form method="GET" action="">
    <label for="filter">Bộ lọc:</label>
    <select name="filter" id="filter">
        <option value="day" <?= $filter == 'day' ? 'selected' : '' ?>>Ngày</option>
        <option value="week" <?= $filter == 'week' ? 'selected' : '' ?>>Tuần</option>
        <option value="month" <?= $filter == 'month' ? 'selected' : '' ?>>Tháng</option>
        <option value="year" <?= $filter == 'year' ? 'selected' : '' ?>>Năm</option>
    </select>
    <label for="date">Ngày:</label>
    <input type="date" name="date" id="date" value="<?= $date; ?>">
    <button type="submit">Lọc</button>
</form>

<div>
    <h4 style="text-align: center;">Thống kê cửa hàng từ <?= $start_date; ?> đến <?= $end_date; ?></h4>
</div>
<div class="row mt-3 prome" style="padding-bottom: 100px; padding: 0 30px 70px 30px;">
    <div class="col-md-4">
        <div class="bg-prome" style="text-align: center; background-color: #ffd900;color: white;">
            <div style="padding: 20px 0;">
                <span style="font-size: 70px;font-weight: bold;">
                    <?= $total_sold; ?>
                </span>
                <p>Sản Phẩm Đã Bán</p>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div style="text-align: center; background-color: #fa8072;color: white;">
            <div style="padding: 20px 0;">
                <span style="font-size: 50px;font-weight: bold;">
                    <?= price($total_revenue); ?>
                </span>
                <p>Doanh Thu</p>
            </div>
        </div>
    </div>
    <div class="col-md-4">
        <div style="text-align: center; background-color: #4abebd;color: white;">
            <div style="padding: 20px 0;">
                <span style="font-size: 70px;font-weight: bold;">
                    <?= $total_customers; ?>
                </span>
                <p>Số Lượng Khách Hàng</p>
            </div>
        </div>
    </div>
</div>

<div class="row mt-4">
    <div class="col-md-4">
        <canvas id="productsChart"></canvas>
    </div>
    <div class="col-md-4">
        <canvas id="revenueChart"></canvas>
    </div>
    <div class="col-md-4">
        <canvas id="customersChart"></canvas>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    const productsData = {
        labels: ['Sản phẩm bán'],
        datasets: [{
            label: 'Sản phẩm bán',
            data: [<?= $total_sold; ?>],
            backgroundColor: 'rgba(255, 99, 132, 0.6)',
            borderColor: 'rgba(255, 99, 132, 1)',
            borderWidth: 1
        }]
    };

    const revenueData = {
        labels: ['Doanh thu (VNĐ)'],
        datasets: [{
            label: 'Doanh thu',
            data: [<?= $total_revenue; ?>],
            backgroundColor: 'rgba(54, 162, 235, 0.6)',
            borderColor: 'rgba(54, 162, 235, 1)',
            borderWidth: 1
        }]
    };

    const customersData = {
        labels: ['Khách hàng'],
        datasets: [{
            label: 'Khách hàng',
            data: [<?= $total_customers; ?>],
            backgroundColor: 'rgba(75, 192, 192, 0.6)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1
        }]
    };

    new Chart(document.getElementById('productsChart'), {
        type: 'bar',
        data: productsData,
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    new Chart(document.getElementById('revenueChart'), {
        type: 'bar',
        data: revenueData,
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    new Chart(document.getElementById('customersChart'), {
        type: 'bar',
        data: customersData,
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>

<?php
include_once "../layout/footer.php";
?>
