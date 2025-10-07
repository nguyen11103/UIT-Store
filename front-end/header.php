<?php
session_start();
require_once "../back-end/db.php";
if (isset($_SESSION['user'])) {
    $user_id = $_SESSION['user']['user_id'];
    $us = $_SESSION['user']['name'];
    $av = $_SESSION['user']['avatar'];
    $ro = $_SESSION['user']['role'];
}
?>

<?php

/**
 *
 * Chuyển đổi chuỗi kí tự thành dạng slug dùng cho việc tạo friendly url.
 *
 * @access    public
 * @param    string
 * @return    string
 */

if (!function_exists('price')) {
    function price($number, $suffix = 'đ')
    {
        if (!empty($number)) {
            return number_format($number, 0, ',', '.') . "{$suffix}";
        }
    }
}
?>

<?php
$sql = "SELECT * FROM categories WHERE cate_pr=0";
$stmt = $conn->prepare($sql);
$stmt->execute();
$cate_pr = $stmt->fetchAll(PDO::FETCH_ASSOC);

/*Đếm số lượng cart*/
if (isset($_SESSION['user'])) {
    if (isset($_SESSION['cart'][$user_id])) {
        $cart = $_SESSION['cart'][$user_id];
        $qty_cart = count($_SESSION['cart'][$user_id]);
    } else {
        $qty_cart = 0;
    }
}
?>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <!-- Me CSS -->
    <link rel="stylesheet" href="/front-end/css/css.css">
    <!-- Font-Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <!-- Font-family -->
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400&display=swap" rel="stylesheet">

    <link rel="shortcut icon" href="user/images/icons/LOGO.png">
    <!--Link Slide SLICK-->
    <link rel="stylesheet" type="text/css" href="https://kenwheeler.github.io/slick/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="https://kenwheeler.github.io/slick/slick/slick-theme.css" />
    <title>UIT STORE</title>

    <link rel="stylesheet" href="/front-end/css/404.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .header {
            width: 100%;
            background-color: #ffffff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .header-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0px;
            max-width: 1200px;
            margin: 0 auto;
            background-color: #ffffff;
        }

        .logo {
            display: flex;
            align-items: center;
            text-decoration: none;
        }

        .logo img {
            height: 50px;
            width: auto;
        }

        .store-name {
            font-size: 24px;
            font-weight: bold;
            color: #1a1e25;
            margin-left: 10px;
            text-decoration: none;
        }

        .header-actions {
            display: flex;
            gap: 20px;
            align-items: center;
        }

        .header-icon {
            font-size: 20px;
            color: #1a1e25;
            text-decoration: none;
        }

        .navigation {
            background-color: #12212d;
            padding: 15px 0;
        }

        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .nav-menu {
            display: flex;
            justify-content: space-around;
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .nav-link {
            color: #ffffff;
            text-decoration: none;
            font-size: 20px;
            font-weight: 600;
            letter-spacing: 0.5px;
            padding: 10px 15px;
            transition: all 0.3s ease;
        }

        .nav-link:hover {
            color: #f4b400;
            transform: translateY(-2px);
        }

        .carousel-inner {
            background-color: #ffffff;
            /* Thêm nền đen hoặc bất kỳ màu nào khác nếu cần */
        }

        .carousel-img {
            object-fit: contain;
            /* Giữ nguyên ảnh mà không cắt xén */
            width: 100%;
            /* Đảm bảo chiều ngang ảnh vừa với container */
            height: 500px;
            /* Chiều cao cố định cho carousel */
        }

        .carousel-control-prev-icon,
        .carousel-control-next-icon {

            background-image: none;
            /* Xóa biểu tượng mũi tên mặc định */
        }

        .carousel-control-prev-icon::after,
        .carousel-control-next-icon::after {
            content: '';
            /* Thay mũi tên mặc định bằng mũi tên tùy chỉnh hoặc để trống */
            display: inline-block;
            border: solid black;
            /* Tạo mũi tên bằng border */
            border-width: 0 3px 3px 0;
            /* Đặt kích thước và vị trí của mũi tên */
            padding: 10px;
            /* Độ dày của mũi tên */
        }

        .carousel-control-prev-icon::after {
            transform: rotate(135deg);
            /* Mũi tên quay trái */
        }

        .carousel-control-next-icon::after {
            transform: rotate(-45deg);
            /* Mũi tên quay phải */
        }

        .slider {
            margin: 20px 0;
            padding: 20px;
            background-color: #f9f9f9;
            /* Nền sáng nhẹ */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .slider h3 {
            font-size: 28px;
            font-family: 'Quicksand', sans-serif;
            font-weight: bold;
            text-transform: uppercase;
            text-align: center;
            margin: 20px 0;
            color: #333;
        }

        .row.autoplay {
            display: flex;
            flex-wrap: wrap;
            /* Đảm bảo các hình ảnh xuống hàng khi không đủ không gian */
            justify-content: center;
            /* Canh giữa các sản phẩm */
            gap: 20px;
            /* Khoảng cách giữa các sản phẩm */
        }

        .col-md-4 {
            flex: 0 0 calc(33.333% - 20px);
            /* Đảm bảo hiển thị 3 sản phẩm mỗi hàng */
            max-width: calc(33.333% - 20px);
            box-sizing: border-box;
        }

        .product-hover {
            overflow: hidden;
            position: relative;
            border-radius: 10px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .product-hover:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }

        .produc-img {
            position: relative;
        }

        .produc-img img {
            width: 100%;
            border-radius: 10px 10px 0 0;
            object-fit: cover;
            /* Đảm bảo ảnh không méo */
            height: 250px;
            /* Chiều cao cố định cho ảnh */
        }

        .produc-img div {
            height: 100px;
            position: absolute;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.6);
            width: 100%;
            display: flex;
            align-items: center;
            padding: 0 20px;
            border-radius: 0 0 10px 10px;
        }

        .produc-img div p {
            margin: 0;
            font-weight: bold;
            color: #fff;
            font-size: 18px;
            letter-spacing: 1px;
        }

        .headbst {
            font-size: 28px;
            font-family: 'Quicksand', sans-serif;
            font-weight: bold;
            text-transform: uppercase;
            color: #fff;
            /* Màu chữ trắng */
            background-color: #333;
            /* Nền tối */
            padding: 5px 15px;
            /* Khoảng cách nội dung và nền */
            border-radius: 5px;
            /* Bo góc nhẹ */
            display: inline-block;
            /* Bao quanh chữ */
            text-align: center;
            /* Căn chữ trong nền */
            margin: 0 auto 20px auto;
            /* Đặt tiêu đề chính giữa container */
            position: relative;
            /* Đảm bảo căn chỉnh */
            left: 50%;
            /* Đẩy phần tử về giữa màn hình */
            transform: translateX(-50%);
            /* Đặt lại chính giữa theo trục ngang */
        }



        /* Responsive Design */
        @media (max-width: 768px) {
            .nav-menu {
                flex-direction: column;
                text-align: center;
                gap: 10px;
            }

            .store-name {
                font-size: 20px;
            }

            .header-actions {
                gap: 15px;
            }
        }
    </style>
</head>

<body>
    <header style="z-index: 999;">
        <div class="header-top container-fluid text-center">



        </div>
        <div class="logo text-center py-3 position-relative">
            <div class="header-top">
                <a href="/front-end/index.php" class="logo">
                    <img src="/front-end/user/images/logostore.png" alt="">
                    <span class="store-name">UIT STORE</span>
                </a>

            </div>


            <div class="position-absolute d-flex icon-cart" style="top: 20%; right: 5%;">
                <?php if (!isset($_SESSION['user'])) : ?>
                    <a href="user/login.php"><i class="fas fa-user mx-2"></i></a>
                <?php endif; ?>
                <?php if (isset($_SESSION['user'])) : ?>
                    <div class="dropdown">
                        <a href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="text mx-2" style="font-size: 16px; font-weight: bold; color: black;">Xin chào: @<?= $us; ?></span>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                            <?php if ($ro > 0) : ?>
                                <a class="dropdown-item" href="../back-end/index/index.php">Vào trang quản trị</a>
                            <?php endif; ?>
                            <a class="dropdown-item" href="user_detail.php">Thông tin cá nhân</a>
                            <a class="dropdown-item" href="order.php">Đơn hàng</a>
                            <a class="dropdown-item" href="user/logout.php">Đăng xuất</a>
                        </div>
                    </div>
                    <a href="cart.php">
                        <i class="fas fa-shopping-cart mx-2 position-relative">
                            <span class="position-absolute text" style="top: 12%; left: 52%; z-index: 2; color:white; font-size: 11px;"><?= $qty_cart ?></span>
                        </i>
                    </a>
                <?php endif; ?>
                <a href="search.php"><i class="fas fa-search mx-2"></i></a>
            </div>
        </div>
        <nav class="navigation">
            <div class="nav-container">
                <ul class="nav-menu">
                    <li><a href="/front-end/index.php" class="nav-link">TRANG CHỦ</a></li>
                    <li><a href="/front-end/product.php" class="nav-link">SẢN PHẨM</a></li>
                    <li><a href="/front-end/intro.php" class="nav-link">GIỚI THIỆU</a></li>
                    <li><a href="#" class="nav-link">TRAO ĐỔI</a></li>
                    <li><a href="#" class="nav-link">TIN TỨC</a></li>
                    <li><a href="https://www.facebook.com/store.uit" class="nav-link">HỖ TRỢ</a></li>
                </ul>
            </div>
        </nav>
    </header>