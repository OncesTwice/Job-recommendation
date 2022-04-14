/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const account = JSON.parse(localStorage.getItem("account"));
document.getElementById("account_name").innerHTML = `Hello ` + account.firstname

//Alert({message: account.role})
//if (!account)
//    window.location.href = "/"
//if (account.role !== "customer")
//    window.location.href = "http://localhost:8080/SpringDemo/dashboard"

// Script to open and close sidebar
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}

function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}

const getTrips = async () => {
    const res = await fetch('http://localhost:8080/SpringDemo/trips/all', {
        method: "GET",
//                        body: JSON.stringify(_data),
        headers: {"Content-type": "application/json;charset=UTF-8"}
    })
    const json = await res.json()

    console.log(json)


    $("#listTrip").html(``);

    await $.each(json.data, (index, value) => {
        const {id, img, price, name, startLocation, endLocation} = value

        var html = `<div class='grid-item'>
                                            <img class='trip_img' src='resources/images/` + img + `' alt=` + name + `/>
                                            <div class='w3-container w3-white trip_frame'>
                                                <p class="trip_name">` + name + `</p>
                                                <p class="trip_start"><span class="trip_field">Start:</span> ` + startLocation + `</p>
                                                <p class="trip_end"><span class="trip_field">End:</span> ` + endLocation + `</p>
                                                <p class="trip_price"><span class="trip_field">Ticket price:</span> ` + price + `</p>
                                                <button class='trip_booking' onclick="booking('${id}','${name}','${price}')">Book</button>
                                            </div>
                                        </div>`
        $("#listTrip").append(html);
    });
}

getTrips()

const getTickets = async () => {
    const res = await fetch(`http://localhost:8080/SpringDemo/orders/` + account.id, {
        method: "GET",
//                        body: JSON.stringify(_data),
//                                    headers: {"Content-type": "application/json;charset=UTF-8"}
    })
    const json = await res.json()

    console.log(json)


    $("#listTicket").html(``);

    await $.each(json.data, (index, value) => {
        const {id, priceThisTime, nameThisTime} = value

        var html = `<tr>
                        <th scope="row"> ${id} </th>
                        <td>${nameThisTime}</td>
                        <td>${priceThisTime}</td>
                        <td>` + 1 + `</td>
                    </tr>`
        $("#listTicket").prepend(html);
    });
}

getTickets()

const booking = async  (id, name, price) => {
    console.log(id, name, price, account.id)
    const result = await Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes'
    })

    if (!result.isConfirmed)
        return

    const _data = {
        "priceThisTime": price,
        "nameThisTime": name,
        "userId": account.id,
        "busId": 1,
        "tripId": id
    }

    const res = await fetch('http://localhost:8080/SpringDemo/orders/create', {
        method: "POST",
        body: JSON.stringify(_data),
        headers: {"Content-type": "application/json;charset=UTF-8"}
    })
    const json = await res.json()

    Alert({success: "Success"})
    window.location.reload();
    console.log(json)




}

const search = async (event) => {
    event.preventDefault()

    const kw = document.getElementById("kw").value

    const res = await fetch(`http://localhost:8080/SpringDemo/trips/search/` + kw, {
        method: "GET",
//                        body: JSON.stringify(_data),
//                            headers: {"Content-type": "application/json;charset=UTF-8"}
    })
    const json = await res.json()

    console.log(json)


    $("#listTrip").html(``);

    await $.each(json.data, (index, value) => {
        const {id, img, price, name, startLocation, endLocation} = value

        var html = `<div class='grid-item'>
                        <img class='trip_img' src='resources/images/` + img + `' alt=` + name + `/>
                        <div class='w3-container w3-white trip_frame'>
                        <p class="trip_name">` + name + `</p>
                        <p class="trip_start"><span class="trip_field">Start:</span> ` + startLocation + `</p>
                        <p class="trip_end"><span class="trip_field">End:</span> ` + endLocation + `</p>
                        <p class="trip_price"><span class="trip_field">Ticket price:</span> ` + price + `</p>
                        <button class='trip_booking' onclick='booking(` + id + `)'>Book</button>
                        </div>
                    </div>`
        $("#listTrip").append(html);
    });
}



