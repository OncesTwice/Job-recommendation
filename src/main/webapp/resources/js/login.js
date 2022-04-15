/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


const login = async (event) => {
    event.preventDefault()
    const email = (document.getElementById("email").value)
    const password = (document.getElementById("pwd").value)
    if (!email || email.length < 5)
        return Alert({error: `Login Fail : Input not valid!`})
    if (!password || password.length < 5)
        return Alert({error: `Login Fail : Input not valid!`})
    const _data = {
        "email": document.getElementById("email").value,
        "password": document.getElementById("pwd").value
    }
    const res = await fetch('http://localhost:8080/SpringDemo/login', {
        method: "POST",
        body: JSON.stringify(_data),
        headers: {"Content-type": "application/json;charset=UTF-8"}
    })
    const json = await res.json()
    const dataJSON = await json[0];
    console.log(json.data)
//                    console.log(dataJSON)
    if (json.data.length === 0) {
        return Alert({error: "Login error!"})
//        return document.getElementById("error").style.display = "";
    }
    await localStorage.setItem("account", JSON.stringify(json.data[0]))
    Alert({success: "Login success!"})
    if (json.data[0].role === 2)
        window.location.href = "http://localhost:8080/SpringDemo/home"
    if (json.data[0].role === 0 || json.data[0].role === 1)
        window.location.href = "http://localhost:8080/SpringDemo/dashboard"
}