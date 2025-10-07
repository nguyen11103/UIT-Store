<style>
.footer {
            background-color: #12212d;
            color: white;
            padding: 40px 0;
            font-family: Arial, sans-serif;
        }

        .footer-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 30px;
        }

        .footer-section h2 {
            font-size: 25px;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .footer-section p, 
        .footer-section a {
            font-size: 14px;
            margin: 8px 0;
            color: white;
            text-decoration: none;
            display: block;
        }

        .footer-section a:hover {
            color: #f4b400;
        }

        .social-links {
            display: flex;
            gap: 15px;
            margin-top: 15px;
        }

        .social-links a {
            display: inline-block;
        }

        .social-links img {
            width: 24px;
            height: 24px;
        }

        .map-container {
            width: 100%;
            height: 200px;
            position: relative;
        }

        .map-container iframe {
            width: 100%;
            height: 100%;
            border: none;
        }

        .map-controls {
            position: absolute;
            right: 10px;
            bottom: 10px;
            display: flex;
            gap: 5px;
        }

        .map-control-btn {
            background: white;
            border: none;
            width: 30px;
            height: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            font-size: 20px;
            font-weight: bold;
        }

        /* Responsive Design */
        @media (max-width: 1024px) {
            .footer-container {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 768px) {
            .footer-container {
                grid-template-columns: 1fr;
            }

            .footer-section {
                margin-bottom: 20px;
            }
        }
</style>

<?php
require_once "../back-end/db.php";
if (isset($_SESSION['user'])) {
    $user_id = $_SESSION['user']['user_id'];
    $us = $_SESSION['user']['name'];
    $av = $_SESSION['user']['avatar'];
    $ro = $_SESSION['user']['role'];
}
?>
<?php 

//include "../sendMail.php";
//$send = new Send();
?>


<footer class="footer">
        <div class="footer-container">
            <!-- UIT STORE Section -->
            <div class="footer-section">
                <h2>UIT STORE</h2>
                <p>Địa chỉ: Đường Hàn Thuyên, khu phố 6 P, Thủ Đức, Hồ Chí Minh</p>
                <p>Email: uitstore@uit.edu.vn</p>
                <p>Phone: 0888445544</p>
                <div class="social-links">
                    <a href="https://www.facebook.com/UIT.Fanpage" title="Facebook">
                        <svg width="24" height="24" fill="white" viewBox="0 0 24 24">
                            <path d="M22 12c0-5.523-4.477-10-10-10S2 6.477 2 12c0 4.991 3.657 9.128 8.438 9.878v-6.987h-2.54V12h2.54V9.797c0-2.506 1.492-3.89 3.777-3.89 1.094 0 2.238.195 2.238.195v2.46h-1.26c-1.243 0-1.63.771-1.63 1.562V12h2.773l-.443 2.89h-2.33v6.988C18.343 21.128 22 16.991 22 12z"/>
                        </svg>
                    </a>
                    <a href="https://www.youtube.com/@uitchannel" title="YouTube">
                        <svg width="24" height="24" fill="white" viewBox="0 0 24 24">
                            <path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z"/>
                        </svg>
                    </a>
                </div>
            </div>

            <!-- Chính Sách Section -->
            <div class="footer-section">
                <h2>Chính Sách</h2>
                <a href="/front-end/404.php">Hình Thức Thanh Toán</a>
                <a href="/front-end/404.php">Chính Sách Giao Hàng</a>
                <a href="/front-end/page_size.php">Hướng Dẫn Mua Hàng</a>
                <a href="/front-end/page_2.php">Chính sách đổi sản phẩm khi mua tại cửa hàng</a>
                <a href="/front-end/page_1.php">Chính sách đổi sản phẩm khi mua online</a>
                <a href="/front-end/page_3.php">Chính sách trả sản phẩm</a>
            </div>

            <!-- Hợp Tác & Liên Kết Section -->
            <div class="footer-section">
                <h2>Hợp Tác & Liên Kết</h2>
                <a href="/front-end/intro.php">Giới Thiệu về UIT STORE</a>
            </div>

            <!-- Vị trí Section -->
            <div class="footer-section">
                <h2>Vị trí</h2>
                <div class="map-container">
                    <iframe 
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.296251945716!2d106.8031!3d10.8700!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175282f4b7e60f3%3A0x11a24c235e4a9ab7!2s10.8700%2C%20106.8031!5e0!3m2!1sen!2s!4v1671232348970!5m2!1sen!2s"
                        allowfullscreen=""
                        loading="lazy"
                        referrerpolicy="no-referrer-when-downgrade">
                    </iframe>
                    <div class="map-controls">
                        <button class="map-control-btn" onclick="zoomIn()">+</button>
                        <button class="map-control-btn" onclick="zoomOut()">-</button>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <script>
        // Map zoom controls functionality
        function zoomIn() {
            const iframe = document.querySelector('iframe');
            const src = iframe.src;
            if (src.includes('&z=')) {
                const currentZoom = parseInt(src.split('&z=')[1]);
                iframe.src = src.replace(`&z=${currentZoom}`, `&z=${currentZoom + 1}`);
            } else {
                iframe.src = src + '&z=15';
            }
        }

        function zoomOut() {
            const iframe = document.querySelector('iframe');
            const src = iframe.src;
            if (src.includes('&z=')) {
                const currentZoom = parseInt(src.split('&z=')[1]);
                iframe.src = src.replace(`&z=${currentZoom}`, `&z=${currentZoom - 1}`);
            } else {
                iframe.src = src + '&z=13';
            }
        }
    </script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="https://kenwheeler.github.io/slick/slick/slick.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('.your-class').slick({
            slidesToShow: 6,
            slidesToScroll: 1,
            autoplay: true,
            autoplaySpeed: 2000,
        });
    });
</script>
<script>
    $('.autoplay').slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        dots: true,
        centerMode: true,
        focusOnSelect: true,
        autoplay: true,
        autoplaySpeed: 2000,
    });
</script>
</body>

</html>