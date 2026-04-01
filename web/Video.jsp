<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Advertisement</title>

        <style>

            .ad-container {
                width: 600px;
                margin: 100px auto;
                position: relative; /* IMPORTANT */
            }

            h2 {
                text-align: center;
                margin-bottom: 20px;
            }

            video {
                width: 100%;
                border-radius: 15px;
                display: block;
            }

            /* Countdown (inside video) */
            .countdown {
                position: absolute;
                bottom: 15px;
                right: 15px;
                padding: 6px 14px;
                background: rgba(0,0,0,0.7);
                color: white;
                border-radius: 4px;
                font-size: 13px;
            }

            /* Skip Button (inside video) */
            .skip-btn {
                position: absolute;
                bottom: 15px;
                right: 15px;
                padding: 6px 14px;
                background: rgba(0,0,0,0.7);
                color: white;
                text-decoration: none;
                border-radius: 4px;
                font-size: 13px;
                display: none;
            }

            .skip-btn:hover {
                background: #1abc9c;
            }

        </style>
    </head>

    <body>

        <div class="ad-container">
            <h2>Advertisement</h2>

            <video id="adVideo" autoplay muted  playsinline>
                <source src="UploadedVideos/add.mp4" type="video/mp4">
            </video>

            <div id="countdown" class="countdown">
                Skip in 5s
            </div>

            <a href="Home" id="skipBtn" class="skip-btn">Skip Ad</a>
        </div>

        <script>
            let seconds = 5;
            let countdown = document.getElementById("countdown");
            let skipBtn = document.getElementById("skipBtn");
            let video = document.getElementById("adVideo");

            let timer = setInterval(function () {
                seconds--;
                countdown.innerText = "Skip in " + seconds + "s";

                if (seconds <= 0) {
                    clearInterval(timer);
                    countdown.style.display = "none";
                    skipBtn.style.display = "block";
                }
            }, 1000);

            video.onended = function () {
                window.location.href = "Home";
            };
        </script>

    </body>
</html>
