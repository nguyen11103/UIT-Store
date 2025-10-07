<?php
ob_start();
include_once "../layout/header.php";
if ($_SESSION['user']['role'] < 2) {
    $_SESSION['alert']['warning']= "Quản trị tài khoản chỉ dành cho admin!";
    header("location: ../index/index.php");
    die;
}
?>

<?php
$sql = "SELECT * FROM users";
$stmt = $conn->prepare($sql);
$stmt->execute();
$users = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<div class="content" style="padding: 0 30px;">
    <table class="table">
        <thead>
            <tr>
                <th scope="col">ID</th>
                <th scope="col">Tài khoản</th>
                <th scope="col">Email</th>
                <th scope="col">Avatar</th>
                <th scope="col">Role</th>
                <th scope="col">Tác vụ</th>
            </tr>
        </thead>
        <tbody class="tbody">
            <?php foreach ($users as $u) : ?>
                <tr>
                    <td><?= $u['user_id'] ?></td>
                    <td><?= $u['user_name'] ?></td>
                    <td><?= $u['email'] ?></td>
                    <td>
                        <img src="/back-end/img/avatar/<?= $u['avatar'] ?>" style="width: 80px; height: 80px; object-fit: cover;" alt="">
                    </td>
                    <td>
                        <?php if ($u['role'] == 0) : ?>
                            Khách hàng
                        <?php elseif ($u['role'] == 1) : ?>
                            Nhân viên
                        <?php elseif ($u['role'] == 2) : ?>
                            Admin
                        <?php endif; ?>
                    </td>
                    <td>
                        <a href="edit.php?id=<?= $u['user_id'] ?>"><i class="far fa-edit"></i></a>
                        <a onclick="return confirm('Tài khoản: @<?= $u['user_name'] ?> sẽ bị xóa vĩnh viễn. Tiếp tục xóa?')" href="delete.php?id=<?= $u['user_id'] ?>"><i class="far fa-trash-alt"></i></a>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>

    <?php if (isset($_GET['message'])) : ?>
        <div class="alert alert-dark" role="alert">
            <?= $_GET['message'] ?>
        </div>
    <?php endif; ?>
</div>

<?php
include_once "../layout/footer.php";
?>