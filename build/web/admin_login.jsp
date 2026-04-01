<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<style>
body {
    font-family: Arial, sans-serif;
    background: linear-gradient(120deg, #667eea, #764ba2);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.login-container {
    background: white;
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0px 0px 15px rgba(0,0,0,0.3);
    width: 320px;
    text-align: center;
}

h2 {
    margin-bottom: 15px;
    color: #333;
}

.input-box {
    width: 100%;
    padding: 8px;
    margin: 8px 0;
    border: 1px solid #ccc;
    border-radius: 4px;
    outline: none;
}

.input-box:focus {
    border-color: #007bff;
    box-shadow: 0 0 5px #007bff;
}

.btn {
    width: 100%;
    padding: 8px;
    background: #007bff;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-top: 10px;
}

.btn:hover {
    background: #0056b3;
}

.error {
    color: red;
    margin-bottom: 10px;
    font-weight: bold;
    text-align: center;
}
</style>
</head>
<body>

<div class="login-container">
    <h2>Admin Login</h2>

    <form action="Check_admin_login.jsp" method="post">
       <% 
       String error = (String) request.getAttribute("error");
       if(error != null){
       %>
          <div class="error"><%= error %></div>
       <%
       }
       %>

       <input class="input-box" type="text" name="mail" placeholder="Enter Email" required>
       <input class="input-box" type="password" name="pwd" placeholder="Enter Password" required>
       <input class="btn" type="submit" value="Login">
    </form>
</div>

</body>
</html>
