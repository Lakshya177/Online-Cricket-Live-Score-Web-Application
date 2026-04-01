<%
    HttpSession hs = request.getSession(false);

    if (hs != null && hs.getAttribute("admin") != null) {
        String admin = (String) hs.getAttribute("admin");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin Panel</title>

        <!-- FONT AWESOME -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <style>
            body {
                font-family: "Segoe UI", Arial, sans-serif;
                margin: 0;
                background: #e0e5ec;
            }

            /* ===== TOP BAR ===== */
            .topbar {
                background: white;
                padding: 15px 25px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                box-shadow: 0px 4px 10px rgba(0,0,0,0.1);
            }

            /* BUTTON GROUP */
            .topbar .btn-group {
                display: flex;
                gap: 15px;
            }

            /* BUTTONS */
            .logout-btn {
                padding: 8px 16px;
                background: linear-gradient(135deg, #ff416c, #ff4b2b);
                color: white;
                text-decoration: none;
                border-radius: 8px;
                border: none;
            }

            /* HOME BUTTON */
            .home-btn {
                background: linear-gradient(135deg, #36D1DC, #5B86E5);
            }

            /* CONTAINER */
            .container {
                padding: 20px 40px;
            }

            /* DASHBOARD GRID */
            .dashboard-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
                gap: 20px;
                margin-top: 20px;
            }

            /* CARDS */
            .card {
                background: white;
                padding: 20px;
                border-radius: 12px;
                box-shadow: 8px 8px 15px #babecc, -8px -8px 15px #ffffff;
            }

            /* CARD ICON */
            .card i {
                font-size: 28px;
                color: #2c3e50;
            }

            /* CARD LINK */
            .card a {
                display: inline-block;
                margin-top: 10px;
                color: #1e90ff;
                text-decoration: none;
            }
            .dashboard-grid {
                display: grid;
                grid-template-columns: repeat(3, 1fr);
                gap: 20px;
                margin-top: 20px;
            }

        </style>
    </head>
    <body>

        <div class="topbar">
            <h2>Admin Home</h2>

            <div class="btn-group">
                <a href="admin_home.jsp" class="logout-btn home-btn">Home</a>
                <a href="index.html" class="logout-btn">Logout</a>
            </div>
        </div>

        <div class="container">

            <div class="dashboard-grid">

                <div class="card">
                    <i class="fa-solid fa-calendar"></i>
                    <h3>Add Future Matches</h3>
                    <p>Manage upcoming cricket matches.</p>
                    <a href="FutureMatches.html">Go to Page</a>
                </div>

                <div class="card">
                    <i class="fa-solid fa-eye"></i>
                    <h3>View Future Matches</h3>
                    <p>See all scheduled matches.</p>
                    <a href="Show_Future_Matches.jsp">Go to Page</a>
                </div>

                <div class="card">
                    <i class="fa-solid fa-clock-rotate-left"></i>
                    <h3>Add Match History</h3>
                    <p>View past match records.</p>
                    <a href="History_Match.html">Go to Page</a>
                </div>

                <div class="card">
                    <i class="fa-solid fa-list"></i>
                    <h3>History Matches List</h3>
                    <p>See all previous matches.</p>
                    <a href="ShowHistoryMatches.jsp">View History Matches</a>
                </div>

                <div class="card">
                    <i class="fa-solid fa-bullhorn"></i>
                    <h3>Advertisement</h3>
                    <p>Upload and manage promotional videos for users.</p>
                    <a href="add_advertisement.html">Add Advertisement</a>
                </div>

            </div>

        </div>

    </body>
</html>

<%
    } else {
        out.println("<p style='color:red; text-align:center;'>Please login first</p>");
        request.getRequestDispatcher("LoginError.html").include(request, response);
    }
%>
