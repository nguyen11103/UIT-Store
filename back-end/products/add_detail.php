<?php
ob_start();
include_once "../layout/header.php";

// Kết nối cơ sở dữ liệu (đảm bảo $conn đã được khởi tạo và sử dụng đúng cách)
// Lấy danh sách các kích cỡ từ bảng products_detail chỉ liên quan đến sản phẩm đã chọn
$sizes = [];
$pro_id = $_GET['pro_id']; // Lấy pro_id từ URL
$sql_sizes = "SELECT DISTINCT size FROM products_detail WHERE pro_id = :pro_id";
$stmt_sizes = $conn->prepare($sql_sizes);
$stmt_sizes->bindParam(':pro_id', $pro_id);
if ($stmt_sizes->execute()) {
    $sizes = $stmt_sizes->fetchAll(PDO::FETCH_COLUMN);
}

if (isset($_POST['btnLuu'])) {
    // Lấy dữ liệu từ biểu mẫu
    $size = !empty($_POST['size_new']) ? $_POST['size_new'] : $_POST['size'];
    $quantity = $_POST['quantity'];

    // Kiểm tra xem kích cỡ đã tồn tại trong bảng chưa
    $sql_check = "SELECT quantity FROM products_detail WHERE pro_id = :pro_id AND size = :size";
    $stmt_check = $conn->prepare($sql_check);
    $stmt_check->bindParam(':pro_id', $pro_id);
    $stmt_check->bindParam(':size', $size);
    $stmt_check->execute();
    $existing = $stmt_check->fetch(PDO::FETCH_ASSOC);

    if ($existing) {
        // Nếu tồn tại, cập nhật số lượng
        $new_quantity = $existing['quantity'] + $quantity;
        $sql_update = "UPDATE products_detail SET quantity = :quantity WHERE pro_id = :pro_id AND size = :size";
        $stmt_update = $conn->prepare($sql_update);
        $stmt_update->bindParam(':quantity', $new_quantity);
        $stmt_update->bindParam(':pro_id', $pro_id);
        $stmt_update->bindParam(':size', $size);

        if ($stmt_update->execute()) {
            header("location: list_detail.php?pro_id=$pro_id&message=Cập Nhật Thành Công");
        } else {
            header("location: list_detail.php?pro_id=$pro_id&message=Cập Nhật Thất Bại");
        }
    } else {
        // Nếu không tồn tại, thêm mới
        $sql_insert = "INSERT INTO products_detail (pro_id, size, quantity, sold) VALUES (:pro_id, :size, :quantity, 0)";
        $stmt_insert = $conn->prepare($sql_insert);
        $stmt_insert->bindParam(':pro_id', $pro_id);
        $stmt_insert->bindParam(':size', $size);
        $stmt_insert->bindParam(':quantity', $quantity);

        if ($stmt_insert->execute()) {
            header("location: list_detail.php?pro_id=$pro_id&message=Thêm Dữ Liệu Thành Công");
        } else {
            header("location: list_detail.php?pro_id=$pro_id&message=Thêm Dữ Liệu Thất Bại");
        }
    }
}
?>

<div class="content" style="padding: 0 30px;">
    <form action="" method="post" enctype="multipart/form-data">
        <input type="hidden" name="pro_id" value="<?php echo $pro_id ?>">

        <label for="">Size</label>
        <br>
        <select class="form-control" name="size" id="size_select">
            <option value="" disabled selected>Chọn kích cỡ</option>
            <?php foreach ($sizes as $size) : ?>
                <option value="<?= htmlspecialchars($size) ?>"><?= htmlspecialchars($size) ?></option>
            <?php endforeach; ?>
        </select>
        <br>

        <label for="">Hoặc nhập kích cỡ mới</label>
        <br>
        <input class="form-control" type="text" name="size_new" id="size_new">
        <br>

        <label for="">Số Lượng</label>
        <br>
        <input class="form-control" type="number" name="quantity" id="" required>
        <br>

        <button class="btn-dark btn mt-3" type="submit" name="btnLuu">Lưu</button>
    </form>
    <br>

    <?php if (isset($_GET['message'])) : ?>
        <div class="alert alert-dark" role="alert">
            <?= $_GET['message'] ?>
        </div>
    <?php endif; ?>
</div>

<script>
    // Tự động điền kích cỡ mới nếu người dùng chọn từ danh sách
    document.getElementById('size_select').addEventListener('change', function() {
        document.getElementById('size_new').value = this.value;
    });
</script>

<?php
include_once "../layout/footer.php";
?>
