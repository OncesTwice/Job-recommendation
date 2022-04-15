<%-- 
    Document   : home
    Created on : Apr 15, 2022, 5:28:32 PM
    Author     : baoma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
            />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="resources/css/home.css"/>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid" style="background-color: #183260">
                <div class="nav imgcontainer">
                    <img class="avatar" src="resources/images/logo.png" alt="error" />
                </div>
                <!-- <div class="navbar-header">
                  <a class="navbar-brand" href="#">Job recommendation</a>
                </div> -->

                <ul class="nav navbar-nav">
                    <li class="active">
                        <a href="#" style="background-color: #183260">Home</a>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"
                           >Page 1 <span class="caret"></span
                            ></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Page 1-1</a></li>
                            <li><a href="#">Page 1-2</a></li>
                            <li><a href="#">Page 1-3</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Page 2</a></li>
                    <!-- <div class="search">
                      <div>
                        <input
                          type="text"
                          class="form-control"
                          placeholder="Search"
                          name="search"
                        />
                      </div>
                      <button type="submit" class="btn">Submit</button>
                    </div> -->

                    <form class="navbar-form navbar-left" action="/action_page.php">
                        <div class="form-group">
                            <input
                                type="text"
                                class="form-control"
                                placeholder="Search"
                                name="search"
                                />
                        </div>
                        <button type="submit" class="btn btn-default">Submit</button>
                    </form>
                </ul>

                <!-- <ul class="nav navbar-nav navbar-right">
                  <li>
                    <a href="/Html/signup.html"
                      ><span class="glyphicon glyphicon-user"></span> Sign Up</a
                    >
                  </li>
                  <li>
                    <a href="/Html/login.html"
                      ><span class="glyphicon glyphicon-log-in"></span> Login</a
                    >
                  </li>
                </ul> -->
            </div>
        </nav>

        <div class="container">
            <div class="left">
                <div class="leftContent">
                    <div class="job"></div>
                </div>

                <div class="list">
                    <div class="list-group">
                        <a href="#" class="list-group-item">
                            <table class="jobInfo">
                                <tbody>
                                    <tr>
                                        <td class="up">
                                            <div class="heading">
                                                <h2 class="jobTitle">
                                                    <span title="Nhân viên bán hàng tại Showroom"
                                                          >Nhân viên bán hàng tại Showroom
                                                    </span>
                                                </h2>
                                            </div>
                                            <div class="companyInfo">
                                                <span class="companyTitle">Công Ty TNHH Cock</span>
                                                <br />
                                                <span class="companyLocation"
                                                      >Thành Phố Hồ Chí Minh</span
                                                >
                                            </div>

                                            <div class="salary">
                                                <span>7.000.000 VNĐ - 10.000.000 VNĐ một tháng</span>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <table class="jobRequire">
                                <tbody>
                                    <tr>
                                        <td class="down">
                                            <div class="require">
                                                <li>Chăm sóc khách hàng</li>
                                                <li>Yêu thích công việc</li>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </a>
                        <a href="#" class="list-group-item">
                            <table class="jobInfo">
                                <tbody>
                                    <tr>
                                        <td class="up">
                                            <div class="heading">
                                                <h2 class="jobTitle">
                                                    <span title="Nhân viên bán hàng tại Showroom"
                                                          >Nhân viên bán hàng tại Showroom
                                                    </span>
                                                </h2>
                                            </div>
                                            <div class="companyInfo">
                                                <span class="companyTitle">Công Ty TNHH Cock</span>
                                                <br />
                                                <span class="companyLocation"
                                                      >Thành Phố Hồ Chí Minh</span
                                                >
                                            </div>

                                            <div class="salary">
                                                <span>7.000.000 VNĐ - 10.000.000 VNĐ một tháng</span>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <table class="jobRequire">
                                <tbody>
                                    <tr>
                                        <td class="down">
                                            <div class="require">
                                                <li>Chăm sóc khách hàng</li>
                                                <li>Yêu thích công việc</li>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </a>
                        <a href="#" class="list-group-item">
                            <table class="jobInfo">
                                <tbody>
                                    <tr>
                                        <td class="up">
                                            <div class="heading">
                                                <h2 class="jobTitle">
                                                    <span title="Nhân viên bán hàng tại Showroom"
                                                          >Nhân viên bán hàng tại Showroom
                                                    </span>
                                                </h2>
                                            </div>
                                            <div class="companyInfo">
                                                <span class="companyTitle">Công Ty TNHH Cock</span>
                                                <br />
                                                <span class="companyLocation"
                                                      >Thành Phố Hồ Chí Minh</span
                                                >
                                            </div>

                                            <div class="salary">
                                                <span>7.000.000 VNĐ - 10.000.000 VNĐ một tháng</span>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <table class="jobRequire">
                                <tbody>
                                    <tr>
                                        <td class="down">
                                            <div class="require">
                                                <li>Chăm sóc khách hàng</li>
                                                <li>Yêu thích công việc</li>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </a>
                        <a href="#" class="list-group-item">
                            <table class="jobInfo">
                                <tbody>
                                    <tr>
                                        <td class="up">
                                            <div class="heading">
                                                <h2 class="jobTitle">
                                                    <span title="Nhân viên bán hàng tại Showroom"
                                                          >Nhân viên bán hàng tại Showroom
                                                    </span>
                                                </h2>
                                            </div>
                                            <div class="companyInfo">
                                                <span class="companyTitle">Công Ty TNHH Cock</span>
                                                <br />
                                                <span class="companyLocation"
                                                      >Thành Phố Hồ Chí Minh</span
                                                >
                                            </div>

                                            <div class="salary">
                                                <span>7.000.000 VNĐ - 10.000.000 VNĐ một tháng</span>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <table class="jobRequire">
                                <tbody>
                                    <tr>
                                        <td class="down">
                                            <div class="require">
                                                <li>Chăm sóc khách hàng</li>
                                                <li>Yêu thích công việc</li>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </a>
                        <a href="#" class="list-group-item">
                            <table class="jobInfo">
                                <tbody>
                                    <tr>
                                        <td class="up">
                                            <div class="heading">
                                                <h2 class="jobTitle">
                                                    <span title="Nhân viên bán hàng tại Showroom"
                                                          >Nhân viên bán hàng tại Showroom
                                                    </span>
                                                </h2>
                                            </div>
                                            <div class="companyInfo">
                                                <span class="companyTitle">Công Ty TNHH Cock</span>
                                                <br />
                                                <span class="companyLocation"
                                                      >Thành Phố Hồ Chí Minh</span
                                                >
                                            </div>

                                            <div class="salary">
                                                <span>7.000.000 VNĐ - 10.000.000 VNĐ một tháng</span>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <table class="jobRequire">
                                <tbody>
                                    <tr>
                                        <td class="down">
                                            <div class="require">
                                                <li>Chăm sóc khách hàng</li>
                                                <li>Yêu thích công việc</li>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </a>
                        <a href="#" class="list-group-item">
                            <table class="jobInfo">
                                <tbody>
                                    <tr>
                                        <td class="up">
                                            <div class="heading">
                                                <h2 class="jobTitle">
                                                    <span title="Nhân viên bán hàng tại Showroom"
                                                          >Nhân viên bán hàng tại Showroom
                                                    </span>
                                                </h2>
                                            </div>
                                            <div class="companyInfo">
                                                <span class="companyTitle">Công Ty TNHH Cock</span>
                                                <br />
                                                <span class="companyLocation"
                                                      >Thành Phố Hồ Chí Minh</span
                                                >
                                            </div>

                                            <div class="salary">
                                                <span>7.000.000 VNĐ - 10.000.000 VNĐ một tháng</span>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <table class="jobRequire">
                                <tbody>
                                    <tr>
                                        <td class="down">
                                            <div class="require">
                                                <li>Chăm sóc khách hàng</li>
                                                <li>Yêu thích công việc</li>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </a>
                        <a href="#" class="list-group-item">
                            <table class="jobInfo">
                                <tbody>
                                    <tr>
                                        <td class="up">
                                            <div class="heading">
                                                <h2 class="jobTitle">
                                                    <span title="Nhân viên bán hàng tại Showroom"
                                                          >Nhân viên bán hàng tại Showroom
                                                    </span>
                                                </h2>
                                            </div>
                                            <div class="companyInfo">
                                                <span class="companyTitle">Công Ty TNHH Cock</span>
                                                <br />
                                                <span class="companyLocation"
                                                      >Thành Phố Hồ Chí Minh</span
                                                >
                                            </div>

                                            <div class="salary">
                                                <span>7.000.000 VNĐ - 10.000.000 VNĐ một tháng</span>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <table class="jobRequire">
                                <tbody>
                                    <tr>
                                        <td class="down">
                                            <div class="require">
                                                <li>Chăm sóc khách hàng</li>
                                                <li>Yêu thích công việc</li>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </a>
                    </div>
<!--                    <div class="page">
                        <ul class="pagination">
                            <li><a href="#">1</a></li>
                            <li class="active"><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                        </ul>
                    </div>-->
                </div>
            </div>


            <div class="right">
                <div class="rightContent">
                    <!--<div class="detail_fake"></div>-->
                    
                    <div class="detail">
                        <div class="detailHead">
                            <div class="job_title">Nhân viên bán hàng tại Showroom</div>

                            <div class="companyInfo">
                                <span>Công Ty TNHH Cock</span><br />
                                <span>Thành Phố Hồ Chí Minh</span>
                            </div>

                            <div class="salary">
                                <span>7.000.000 VNĐ - 10.000.000 VNĐ một tháng</span>
                            </div>

                            <div class="apply">
                                <a href="">Nộp đơn</a>
                            </div>
                        </div>

                        <div class="detailFooter">
                            <div>
                                <ul>
                                    <li>
                                        <b>Mức lương:</b>
                                        7 - 10 triệu
                                    </li>
                                    <ul>
                                        <li>
                                            <b>Kinh nghiệm:</b>
                                            1 năm
                                        </li>
                                        <li>
                                            <b>Trình độ:</b>
                                            Đại Học
                                        </li>
                                        <li>
                                            <b>Tỉnh/ Thành Phố:</b>
                                            Hồ Chí Minh
                                        </li>
                                        <li>
                                            <b>Ngành nghề:</b>
                                            Kinh doanh bán hàng
                                        </li>
                                    </ul>
                                </ul>
                            </div>
                            <div>
                                <ul>
                                    <li>
                                        <b>Số lượng tuyển dụng:</b>
                                        10
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
                                            Tìm kiếm từ cơ sở dữ liệu có sẵn các cá nhân/doanh nghiệp
                                            có mong muốn làm đại lý/nhà phân phối độc quyền bán sản
                                            phẩm đèn năng lượng mặt trời của công ty.
                                        </li>
                                        <li>
                                            Giới thiệu, tư vấn sản phẩm, chính sách để các cá
                                            nhân/doanh nghiệp tiềm năng đồng ý làm đại lý/nhà phân
                                            phối cho công ty.
                                        </li>
                                        <li>
                                            Lên đơn hàng, phối hợp bộ phận kho giao hàng cho đại
                                            lý/nhà phân phối.
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
                                            Nam/nữ độ tuổi dưới 35, nhanh nhẹn hoạt bát, năng động,
                                            sáng tạo.
                                        </li>
                                        <li>Có kỹ năng nói chuyện, giao tiếp tốt.</li>
                                        <li>
                                            Đam mê kinh doanh, thích công việc tư vấn khách hàng.
                                        </li>
                                        <li>
                                            Sử dụng thành thạo Word, Excel và am hiểu các trang mạng.
                                        </li>
                                        <li>Tốt nghiệp đại học/cao đẳng trở lên.</li>
                                        <li>Không yêu cầu khắt khe về kinh nghiệm.</li>
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

                            <div>
                                <div>
                                    <b>Hạn nộp</b>
                                </div>
                                <div>
                                    <b>22-02-2022</b>
                                </div>
                            </div>
                            <br />

                            <div>
                                <div>
                                    <b>Hình thức nộp</b>
                                    <div>
                                        <p>Bấm "Nộp đơn" để ứng tuyển</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                
                </div>
            </div>
        </div>

    </body>
</html>
