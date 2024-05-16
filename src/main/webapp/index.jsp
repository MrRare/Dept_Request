<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Page</title>
  <%@ include file="CDN.jsp"  %>
  <script src="Script.js"></script>
  <link rel="stylesheet" href="Style.css"> 
  <style>
    /* Your CSS styles here */
  </style>
</head>
<body>
  <div class="container">
    <div class="row">
      <div class="col-lg-3 col-md-2"></div>
      <div class="col-lg-6 col-md-8 login-box">
        <div class="col-lg-12 login-title" id="login">
          Sign in
        </div>
        <div class="col-lg-12 login-form">
          <form id="myform" action="sign_in.jsp">
            <div class="form-group">
              <label class="form-control-label">USERNAME</label>
              <input type="text" class="form-control" name="name">
            </div>
            <div class="form-group">
              <label class="form-control-label">PASSWORD</label>
              <input type="password" class="form-control" name="pass">
            </div>
            <div class="form-group" id="department">
              <label class="form-control-label">DEPARTMENT</label>
              <input type="text" class="form-control" name="department">
            </div>
            <div class="col-lg-12 loginbttm">
              <div class="col-lg-12 login-btm login-button">
                <button type="submit" class="btn btn-outline-primary">DONE</button>
              </div>
            </div>
          </form>
        </div>
        <div class="col-lg-3 col-md-2"></div>
      </div>
    </div>
    <div class="row m-5">
      <a class="sign" onclick="change()">Sign up</a>
    </div>
  </div>

  <script>
    function change() {
      var loginButton = document.getElementById('login');
      var signButton = document.querySelector('.sign');
      var form = document.getElementById("myform");
      var department = document.getElementById("department");
      var buttonText = loginButton.innerHTML;

      if (buttonText === "Sign up") {
        loginButton.innerHTML = "Sign in";
        signButton.innerHTML = "Sign up";
        form.action = "sign_in.jsp";
        department.style.display = "none";
      } else {
        loginButton.innerHTML = "Sign up";
        signButton.innerHTML = "Sign in";
        form.action = "sign_up.jsp";
        department.style.display = "block";
      }
    }
  </script>
</body>
</html>
