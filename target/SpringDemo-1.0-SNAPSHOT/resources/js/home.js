/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const account = JSON.parse(localStorage.getItem("account"));



const getJobs = async () => {
    const res = await fetch(`http://localhost:8080/SpringDemo/job/all`, {
        method: "GET"
    })
    const json = await res.json()

    console.log(json)


    $("#listJob").html(``);

    await $.each(json.data, (index, value) => {
        const {address, company, description, experience, id, majorId, noRecruitments, position, requirement, salary, userId} = value

        var html = `<div style="cursor: pointer;" class="list-group-item" onclick="getDetailJob('${id}')">
                            <table class="jobInfo">
                                <tbody>
                                    <tr>
                                        <td class="up">
                                            <div class="heading">
                                                <h2 class="jobTitle">
                                                    <span title="Nhân viên bán hàng tại Showroom">${position}
                                                    </span>
                                                </h2>
                                            </div>
                                            <div class="companyInfo">
                                                <span class="companyTitle">${company}</span>
                                                <br />
                                                <span class="companyLocation">${address}</span>
                                            </div>

                                            <div class="salary">
                                                <span>${salary}</span>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            
                        </div>
                      `
        $("#listJob").prepend(html);
    });
}

getJobs()

const getDetailJob = async (id) => {
    const res = await fetch(`http://localhost:8080/SpringDemo/job/` + id, {
        method: "GET"
    })
    const json = await res.json()

    console.log(json)
    
    $("#jobDetail").html(``);

    await $.each(json.data, (index, value) => {
        const {address, company, description, experience, id, majorId, noRecruitments, position, requirement, salary, userId} = value

        var html = `<div class="detailHead">
                            <div class="job_title">${position}</div>

                            <div class="companyInfo">
                                <span>${company}/span><br />
                                <span>${address}</span>
                            </div>

                            
                            
                        </div>

                        <div class="detailFooter">
                            <div>
                                <ul>
                                    <li>
                                        <b>Mức lương:</b>
                                        ${salary}
                                    </li>
                                    <ul>
                                        <li>
                                            <b>Kinh nghiệm:</b>
                                            ${experience}
                                        </li>
                                        <li>
                                            <b>Trình độ:</b>
                                            Đại Học
                                        </li>
                                        <li>
                                            <b>địa chỉ làm việc:</b>
                                            ${address}
                                        </li>
                                        <li>
                                            <b>Ngành nghề:</b>
                                            Nhân viên
                                        </li>
                                    </ul>
                                </ul>
                            </div>
                            <div>
                                <ul>
                                    <li>
                                        <b>Số lượng tuyển dụng:</b>
                                        ${noRecruitments} người
                                    </li>
                                    <ul>
                                        <li>
                                            <b>Giới tính:</b>
                                            Không yêu cầu
                                        </li>
                                        <li>
                                            <b>Tính chất công việc:</b>
                                            Làm việc thu nhập cao
                                        </li>
                                        <li>
                                            <b>Hình thức làm việc:</b>
                                            Nhân viên chính thức
                                        </li>
                                        <li>
                                            <b>Thời gian thử việc:</b>
                                            Nhận việc ngay
                                        </li>
                                    </ul>
                                </ul>
                            </div>

                            <div>
                                <div>
                                    <b>Mô tả</b>
                                </div>
                                <div>
                                    <ul>
                                        <li>
                                            ${description}
                                        </li>
                                        
                                    </ul>
                                </div>
                            </div>

                            <div>
                                <div>
                                    <b>Yêu cầu</b>
                                </div>
                                <div>
                                    <ul>
                                        <li>
                                           ${requirement}
                                        </li>
                                        
                                    </ul>
                                </div>
                            </div>

                            <div>
                                <div>
                                    <b>Quyền lợi</b>
                                </div>
                                <div>
                                    <ul>
                                        <li>Thu nhập hấp dẫn cho ứng viên xuất sắc 8-30 triệu</li>
                                        <li>
                                            Mức thưởng hấp dẫn cho Nhân viên kinh doanh có kết quả làm
                                            việc xuất sắc, đạt doanh số.
                                        </li>
                                        <li>Cơ hội thăng tiến làm Giám đốc kinh doanh khu vực.</li>
                                    </ul>
                                </div>
                            </div>

                            
                            <br />

                            <div>
                                <div>
                                    <b>Hình thức nộp</b>
                                    <div>
                                        <p>gửi CV qua email của công ty</p>
                                    </div>
                                </div>
                            </div>
                        </div>`
        $("#jobDetail").prepend(html);
    });
}

const search = async (event) => {
    event.preventDefault()

    const kw = document.getElementById("kw").value

    const res = await fetch(`http://localhost:8080/SpringDemo/trips/search/` + kw, {
        method: "GET"
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


