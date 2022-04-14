/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

//alert("js");

const Alert = ({ message, success, warning, error }) => {
  if (message) return swal.fire({ position: "center", text: message });

  if (success)
    return swal.fire({
      icon: "success",
      title: "success",
      text: success,
    });

  if (warning)
    return swal.fire({
      icon: "info",
      title: "Warning",
      text: warning,
    });

  if (error)
    return swal.fire({
      icon: "error",
      title: "Oops...",
      text: error,
    });
};


