/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const deleting = async  (id, name, price) => {
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

//    const _data = {
//        "priceThisTime": price,
//        "nameThisTime": name,
//        "userId": account.id,
//        "busId": 1,
//        "tripId": id
//    }

    const res = await fetch('http://localhost:8080/SpringDemo/trips/delete/' + id, {
        method: "DELETE",
//        body: JSON.stringify(_data),
        headers: {"Content-type": "application/json;charset=UTF-8"}
    })
    const json = await res.json()

    Alert({success: "Success"})
    window.location.reload();
    console.log(json)

}

const editing = async (event, index, id) => {
//    console.log(id, name, price, account.id)
//    const result = await Swal.fire({
//        title: 'Are you sure?',
//        text: "You won't be able to revert this!",
//        icon: 'warning',
//        showCancelButton: true,
//        confirmButtonColor: '#3085d6',
//        cancelButtonColor: '#d33',
//        confirmButtonText: 'Yes'
//    })
//
//    if (!result.isConfirmed)
//        return

//    const _data = {
//        "priceThisTime": price,
//        "nameThisTime": name,
//        "userId": account.id,
//        "busId": 1,
//        "tripId": id
//    }

//    
    event.preventDefault()
    let myForm = document.getElementById(`editForm${index}`);
    let formData = new FormData(myForm);
//    const id = formData.get("trip_id");
    const name = formData.get("trip_name");
    const price = formData.get("trip_price");
    const startLocation = formData.get("trip_startLocation");
    const endLocation = formData.get("trip_endLocation");

    const _data = {
        id,
        name,
        price,
        startLocation,
        endLocation
    }
    console.log(_data);

    const res = await fetch('http://localhost:8080/SpringDemo/trips/update/', {
        method: "PUT",
        body: JSON.stringify(_data),
        headers: {"Content-type": "application/json;charset=UTF-8"}
    })
    const json = await res.json()

    Alert({success: "Success"})
    window.location.reload();
    console.log(json)

}

const getUsers = async () => {
    const res = await fetch(`http://localhost:8080/SpringDemo/users/all`, {
        method: "GET",
//                        body: JSON.stringify(_data),
//                                    headers: {"Content-type": "application/json;charset=UTF-8"}
    })
    const json = await res.json()

    console.log(json)


    $("#listUser").html(``);

    await $.each(json.data, (index, value) => {
        const {id, firstname, lastname, email, updatedAt, role, createdAt} = value

        var html = `<tr>
                        <th scope="row"> ${id} </th>
                        <td>${firstname}</td>
                        <td>${lastname}</td>
                        <td>${email}</td>             
                        <td>${role}</td>
                        <td>${createdAt}</td>
                        <td>${updatedAt}</td>
                        <td>
                            <button data-toggle="modal" data-target="#editUserModal${index}">Edit</button>
        
                            <div class="modal fade" id="editUserModal${index}" role="dialog">
                                <div class="modal-dialog">

                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Edit User Form</h4>
                                        </div>
                                        <form id="editUserForm${index}" class="modal-body" enctype="multipart/form-data">
                                            <input class="trip_input" type="text" name ="user_id" disabled value='${id}'/>
                                            <input class="trip_input" type="text" name ="user_email" disabled value='${email}'/>
                                            <input class="trip_input" type="text" name ="user_firstname" placeholder="Firstname:"/>
                                            <input class="trip_input" type="text" name ="user_lastname" placeholder="Lastname:"/>
                                            <input class="trip_input" type="text" name ="user_password" placeholder="Password:"/>
                                            <input class="trip_input" type="text" name ="user_role" placeholder="Role:"/>
                                            <button class="trip_button" type="submit" onclick="editUser(event,'${index}','${id}')" class="btn btn-default" data-dismiss="modal">Submit</button>
                                        </form>

                                    </div>

                                </div>
                            </div>
                        </td>
                        <td>
                            <button type="button" onclick="deleteUser('${id}')">Delete</button>
                            
                        </td>
                    </tr>

                    `
        $("#listUser").prepend(html);
    });
}

getUsers()


const editUser = async (event, index, id) => {
    event.preventDefault()

    let myForm = document.getElementById(`editUserForm${index}`);
    let formData = new FormData(myForm);
    const firstname = formData.get("user_firstname");
    const lastname = formData.get("user_lastname");
    const password = formData.get("user_password");
    const role = formData.get("user_role");

    const _data = {
        id,
        firstname,
        lastname,
        password,
        role
    }
    console.log(_data);

    const res = await fetch('http://localhost:8080/SpringDemo/users/update/', {
        method: "PUT",
        body: JSON.stringify(_data),
        headers: {"Content-type": "application/json;charset=UTF-8"}
    })
    const json = await res.json()

    Alert({success: "Success"})
    window.location.reload();
    console.log(json)

}

const deleteUser = async  (id) => {
    console.log(id, account.id)
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

//    const _data = {
//        "priceThisTime": price,
//        "nameThisTime": name,
//        "userId": account.id,
//        "busId": 1,
//        "tripId": id
//    }

    const res = await fetch('http://localhost:8080/SpringDemo/users/delete/' + id, {
        method: "DELETE",
//        body: JSON.stringify(_data),
        headers: {"Content-type": "application/json;charset=UTF-8"}
    })
    const json = await res.json()

    Alert({success: "Success"})
    window.location.reload();
    console.log(json)

}