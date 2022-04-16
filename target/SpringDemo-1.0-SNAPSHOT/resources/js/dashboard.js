/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const account = JSON.parse(localStorage.getItem("account"));
document.getElementById("account_firstname").innerHTML = `${account.firstname} ${account.lastname}`

const getJobs = async () => {
    const res = await fetch(`http://localhost:8080/SpringDemo/job/all`, {
        method: "GET",
//                        body: JSON.stringify(_data),
//                                    headers: {"Content-type": "application/json;charset=UTF-8"}
    })
    const json = await res.json()

    console.log(json)


    $("#listJobs").html(``);

    await $.each(json.data, (index, value) => {
        const  {address, company, description, experience, id, major, noRecruitments, position, requirement, salary, userId, createdAt, updatedAt} = value

        var html = `<tr>
                        <th scope="row"> ${id} </th>
                        <td>${company}</td>
                        <td>${major}</td>
                        <td>${position}</td>
                        <td>${createdAt}</td>
                        <td>${updatedAt}</td>
        
                        <td>
                            <button data-toggle="modal" data-target="#editJobModal${index}">Edit</button>
        
                            <div class="modal fade" id="editJobModal${index}" role="dialog">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">Edit User Form</h4>
                                        </div>
                                        <form id="editJobForm${index}" class="modal-body" enctype="multipart/form-data">
                                            <input class="trip_input" type="text" name ="job_id" disabled value='${id}'/>
                                            <input class="trip_input" type="text" name ="job_major" value='${major}'/>
                                            <input class="trip_input" type="text" name ="job_company" value='${company}'/>
                                            <input class="trip_input" type="text" name ="job_address" value='${address}'/>
                                            <input class="trip_input" type="text" name ="job_position" value='${position}'/>
                                            <input class="trip_input" type="text" name ="job_experience" value='${experience}'/>
                                            <input class="trip_input" type="text" name ="job_salary" value='${salary}'/>
                                            <input class="trip_input" type="text" name ="job_recruitments" value='${noRecruitments}'/>
                                            <input class="trip_input" type="text" name ="job_requirement" value='${requirement}'/>
                                            <textarea id="job_description${index}" name="w3review" rows="4" cols="50">
                                                ${description}
                                            </textarea>
                                            <button class="trip_button" type="submit" onclick="editJob(event,'${index}','${id}')" class="btn btn-default" data-dismiss="modal">Submit</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </td>
                        <td>
                            <button type="button" onclick="deleteJob('${id}')">Delete</button>
                            
                        </td>
                    </tr>
                    `
        $("#listJobs").prepend(html);
    });

    const jsonASC = json.data.sort((a, b) => new Date(a.createdAt) - new Date(b.createdAt))
    chart(jsonASC)
}

getJobs()

const editJob = async (event, index, id) => {
    event.preventDefault()

    let myForm = document.getElementById(`editJobForm${index}`);
    let formData = new FormData(myForm);
    const major = formData.get("job_major");
    const company = formData.get("job_company");
    const address = formData.get("job_address");
    const position = formData.get("job_position");
    const experience = formData.get("job_experience");
    const salary = formData.get("job_salary");
    const noRecruitments = formData.get("job_recruitments");
    const requirement = formData.get("job_requirement");
    const description = document.getElementById(`job_description${index}`).value;

    const _data = {
        id,
        major,
        company,
        address,
        position,
        experience,
        salary,
        noRecruitments: Number(noRecruitments),
        requirement,
        description
    }

//    const _data = {
//        "id": 1,
//        "major": "1",
//        "company": "1",
//        "address": "1",
//        "position": "1",
//        "experience": "11111111",
//        "salary": "1",
//        "noRecruitments": 1,
//        "requirement": "1",
//        "description": "1"
//    }

    console.log(_data);

    const res = await fetch('http://localhost:8080/SpringDemo/job/update/', {
        method: "PUT",
        body: JSON.stringify(_data),
        headers: {"Content-type": "application/json;charset=UTF-8"}
    })
    const json = await res.json()

    Alert({success: "Success"})
    window.location.reload();
    console.log(json)

}

const deleteJob = async  (id) => {
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

    const res = await fetch('http://localhost:8080/SpringDemo/job/delete/' + id, {
        method: "DELETE",
//        body: JSON.stringify(_data),
        headers: {"Content-type": "application/json;charset=UTF-8"}
    })
    const json = await res.json()

    Alert({success: "Success"})
    window.location.reload();
    console.log(json)

}

const addJob = async (event) => {
    event.preventDefault()

    let myForm = document.getElementById(`addJobForm`);

    let formData = new FormData(myForm);
    const major = formData.get("add_major");
    const company = formData.get("add_company");
    const address = formData.get("add_address");
    const position = formData.get("add_position");
    const experience = formData.get("add_experience");
    const salary = formData.get("add_salary");
    const noRecruitments = formData.get("add_recruitments");
    const requirement = formData.get("add_requirement");
    const description = document.getElementById(`add_description`).value;

    const _data = {
        major,
        company,
        address,
        position,
        experience,
        salary,
        noRecruitments: Number(noRecruitments),
        requirement,
        description
    }

    console.log(_data);

    const res = await fetch('http://localhost:8080/SpringDemo/job/create/', {
        method: "POST",
        body: JSON.stringify(_data),
        headers: {"Content-type": "application/json;charset=UTF-8"}
    })
    const json = await res.json()

    if (json.message !== "success")
        return Alert({error: json.message})

    Alert({success: "Success"})
    window.location.reload();
    console.log(json)
}

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

const chart = (json) => {
    console.log(`jsonASC`, json)
    var xValues = json.map(x => x.company);
    var yValues = json.map(x => x.noRecruitments);
    
    console.log(xValues,yValues)
    var barColors = [
        "red",
        "blue",
        "yellow",
        "green",
        "gray",
        "pink",
        "magenta"
    ];

    new Chart("myChart", {
        type: "pie",
        data: {
            labels: xValues,
            datasets: [{
                    backgroundColor: barColors,
                    data: yValues
                }]
        },
        options: {
            title: {
                display: true,
                text: "Job Analyzing Recruitments"
            }
        }
    });
}

const getUsers = async () => {
    const res = await fetch(`http://localhost:8080/SpringDemo/user/all`, {
        method: "GET",
//                        body: JSON.stringify(_data),
//                                    headers: {"Content-type": "application/json;charset=UTF-8"}
    })
    const json = await res.json()

    console.log(json)


    $("#listUser").html(``);

    await $.each(json.data, (index, value) => {
        const {id, firstname, lastname, email, updatedAt, role, phone, age, createdAt} = value

        var html = `<tr>
                        <td>${id}</td>
                        <td>${firstname}</td>
                        <td>${lastname}</td>
                        <td>${age}</td>
                        <td>${email}</td>
                        <td>${phone}</td>                        
                        <td>${role}</td>
                        <td>${createdAt}</td>
                        <td>${updatedAt}</td>

                    </tr>`
        $("#listUser").prepend(html);
    });

}

getUsers()