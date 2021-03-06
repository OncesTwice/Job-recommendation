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
<!--                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"
                           >Page 1 <span class="caret"></span
                            ></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Page 1-1</a></li>
                            <li><a href="#">Page 1-2</a></li>
                            <li><a href="#">Page 1-3</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Page 2</a></li>-->
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

                </ul>

                <form class="navbar-form navbar-left" onsubmit="searchJob(event)" >

                    <input
                        type="text"
                        id="kw"
                        class="form-control"
                        placeholder="Search"
                        name="search"
                        />

                    <button type="submit" class="btn btn-default">Submit</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="#" id="account_firstname"><span class="glyphicon glyphicon-user"></span> Sign Up</a>
                    </li>                  
                    <li>
                        <a href="#" onclick="logout()"><span  class="glyphicon glyphicon-log-in"></span> Logout</a>
                    </li>
                </ul> 
            </div>
        </nav>

        <div class="container">
            <div class="left">
                <div class="leftContent">
                    <div class="job"></div>
                </div>

                <div class="list">
                    <div class="list-group" id="listJob">

                        <div style="cursor: pointer;" class="list-group-item">
                            <table class="jobInfo">
                                <tbody>
                                    <tr>
                                        <td class="up">
                                            <div class="heading">
                                                <h2 class="jobTitle">
                                                    <span title="Nh??n vi??n b??n h??ng t???i Showroom"
                                                          >Nh??n vi??n b??n h??ng t???i Showroom
                                                    </span>
                                                </h2>
                                            </div>
                                            <div class="companyInfo">
                                                <span class="companyTitle">C??ng Ty TNHH Cock</span>
                                                <br />
                                                <span class="companyLocation"
                                                      >Th??nh Ph??? H??? Ch?? Minh</span
                                                >
                                            </div>

                                            <div class="salary">
                                                <span>7.000.000 VN?? - 10.000.000 VN?? m???t th??ng</span>
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
                                                <li>Ch??m s??c kh??ch h??ng</li>
                                                <li>Y??u th??ch c??ng vi???c</li>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>

                </div>
            </div>


            <div class="right">
                <div class="rightContent">
                    <!--<div class="detail_fake"></div>-->

                    <div class="detail" id="jobDetail">
                        <div class="detailHead">
                            <div class="job_title">Nh??n vi??n b??n h??ng t???i Showroom (V?? d???)</div>

                            <div class="companyInfo">
                                <span>C??ng Ty TNHH Cock</span><br />
                                <span>Th??nh Ph??? H??? Ch?? Minh</span>
                            </div>

                            <!--                            <div class="salary">
                                                            <span>7.000.000 VN?? - 10.000.000 VN?? m???t th??ng</span>
                                                        </div>-->

                            <!--                            <div class="apply">
                                                            <a href="">N???p ????n</a>
                                                        </div>-->
                        </div>

                        <div class="detailFooter">
                            <div>
                                <ul>
                                    <li>
                                        <b>M???c l????ng:</b>
                                        7 - 10 tri???u
                                    </li>
                                    <ul>
                                        <li>
                                            <b>Kinh nghi???m:</b>
                                            1 n??m
                                        </li>
                                        <li>
                                            <b>Tr??nh ?????:</b>
                                            ?????i H???c
                                        </li>
                                        <li>
                                            <b>T???nh/ Th??nh Ph???:</b>
                                            H??? Ch?? Minh
                                        </li>
                                        <li>
                                            <b>Ng??nh ngh???:</b>
                                            Kinh doanh b??n h??ng
                                        </li>
                                    </ul>
                                </ul>
                            </div>
                            <div>
                                <ul>
                                    <li>
                                        <b>S??? l?????ng tuy???n d???ng:</b>
                                        10
                                    </li>
                                    <ul>
                                        <li>
                                            <b>Gi???i t??nh:</b>
                                            Kh??ng y??u c???u
                                        </li>
                                        <li>
                                            <b>T??nh ch???t c??ng vi???c:</b>
                                            L??m vi???c thu nh???p cao
                                        </li>
                                        <li>
                                            <b>H??nh th???c l??m vi???c:</b>
                                            Nh??n vi??n ch??nh th???c
                                        </li>
                                        <li>
                                            <b>Th???i gian th??? vi???c:</b>
                                            Nh???n vi???c ngay
                                        </li>
                                    </ul>
                                </ul>
                            </div>

                            <div>
                                <div>
                                    <b>M?? t???</b>
                                </div>
                                <div>
                                    <ul>
                                        <li>
                                            T??m ki???m t??? c?? s??? d??? li???u c?? s???n c??c c?? nh??n/doanh nghi???p
                                            c?? mong mu???n l??m ?????i l??/nh?? ph??n ph???i ?????c quy???n b??n s???n
                                            ph???m ????n n??ng l?????ng m???t tr???i c???a c??ng ty.
                                        </li>
                                        <li>
                                            Gi???i thi???u, t?? v???n s???n ph???m, ch??nh s??ch ????? c??c c??
                                            nh??n/doanh nghi???p ti???m n??ng ?????ng ?? l??m ?????i l??/nh?? ph??n
                                            ph???i cho c??ng ty.
                                        </li>
                                        <li>
                                            L??n ????n h??ng, ph???i h???p b??? ph???n kho giao h??ng cho ?????i
                                            l??/nh?? ph??n ph???i.
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <div>
                                <div>
                                    <b>Y??u c???u</b>
                                </div>
                                <div>
                                    <ul>
                                        <li>
                                            Nam/n??? ????? tu???i d?????i 35, nhanh nh???n ho???t b??t, n??ng ?????ng,
                                            s??ng t???o.
                                        </li>
                                        <li>C?? k??? n??ng n??i chuy???n, giao ti???p t???t.</li>
                                        <li>
                                            ??am m?? kinh doanh, th??ch c??ng vi???c t?? v???n kh??ch h??ng.
                                        </li>
                                        <li>
                                            S??? d???ng th??nh th???o Word, Excel v?? am hi???u c??c trang m???ng.
                                        </li>
                                        <li>T???t nghi???p ?????i h???c/cao ?????ng tr??? l??n.</li>
                                        <li>Kh??ng y??u c???u kh???t khe v??? kinh nghi???m.</li>
                                    </ul>
                                </div>
                            </div>

                            <div>
                                <div>
                                    <b>Quy???n l???i</b>
                                </div>
                                <div>
                                    <ul>
                                        <li>Thu nh???p h???p d???n cho ???ng vi??n xu???t s???c 8-30 tri???u</li>
                                        <li>
                                            M???c th?????ng h???p d???n cho Nh??n vi??n kinh doanh c?? k???t qu??? l??m
                                            vi???c xu???t s???c, ?????t doanh s???.
                                        </li>
                                        <li>C?? h???i th??ng ti???n l??m Gi??m ?????c kinh doanh khu v???c.</li>
                                    </ul>
                                </div>
                            </div>

                            <div>
                                <div>
                                    <b>H???n n???p</b>
                                </div>
                                <div>
                                    <b>22-02-2022</b>
                                </div>
                            </div>
                            <br />

                            <div>
                                <div>
                                    <b>H??nh th???c n???p</b>
                                    <div>
                                        <p>B???m "N???p ????n" ????? ???ng tuy???n</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="resources/js/alert.js"></script>
        <script src="resources/js/home.js"></script>

    </body>
</html>
