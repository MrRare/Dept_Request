function change() {
    var loginButton = document.getElementById('login');
    var signButton = document.getElementById('sign');
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
   var selectedOptions = [];

        function addToSelectedOptions(value) {
            if (selectedOptions.indexOf(value) === -1) {
                selectedOptions.push(value);
            } else {
                selectedOptions.splice(selectedOptions.indexOf(value), 1);
            }
            console.log(selectedOptions); 
        }