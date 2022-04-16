/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const account = JSON.parse(localStorage.getItem("account"));
document.getElementById("account_firstname").innerHTML = `${account.firstname} ${account.lastname}`

const logout = async () => {
    const result = await Swal.fire({
        title: 'Are you sure?',
        text: "...to logout?",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes'
    })

    if (!result.isConfirmed)
        return
    localStorage.removeItem("account")
    window.location.href = "http://localhost:8080/SpringDemo/"
}
