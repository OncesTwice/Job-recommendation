<%-- 
    Document   : dashboard
    Created on : Apr 16, 2022, 12:11:02 AM
    Author     : baoma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"/>

        <link rel="stylesheet" href="resources/css/dashboard.css"/>

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

                </ul>

<!--                <form class="navbar-form navbar-left" onsubmit="searchJob(event)" >

                    <input
                        type="text"
                        id="kw"
                        class="form-control"
                        placeholder="Search"
                        name="search"
                        />

                    <button type="submit" class="btn btn-default">Submit</button>
                </form>-->
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="#" id="account_firstname"
                           ><span class="glyphicon glyphicon-user"></span> Sign Up</a
                        >
                    </li>
                    <li>
                        <a href="#" onclick="logout()"
                           ><span class="glyphicon glyphicon-log-in"></span> Logout</a
                        >
                    </li>
                </ul> 
            </div>
        </nav>

        <div class="table">
            <h2>Jobs Features</h2>

            <button id="1" data-toggle="modal" data-target="#addJobModal">+</button>

            <div class="modal fade" id="addJobModal" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Add User Form</h4>
                        </div>
                        <form id="addJobForm" class="modal-body" enctype="multipart/form-data">                         
                            <input class="trip_input" type="text" name ="add_major" placeholder="Major:"/>
                            <input class="trip_input" type="text" name ="add_company" placeholder="Company:"/>
                            <input class="trip_input" type="text" name ="add_address" placeholder="Address:"/>
                            <input class="trip_input" type="text" name ="add_position" placeholder="Position:"/>
                            <input class="trip_input" type="text" name ="add_experience" placeholder="Experience:"/>
                            <input class="trip_input" type="text" name ="add_salary" placeholder="Salary:"/>
                            <input class="trip_input" type="text" name ="add_recruitments" placeholder="Recruitments:"/>
                            <input class="trip_input" type="text" name ="add_requirement" placeholder="Requirement:"/>
                            <textarea id="add_description" name="w3review" rows="4" cols="50">Your description here:                              
                            </textarea>
                            <button class="trip_button" type="submit" onclick="addJob(event)" class="btn btn-default" data-dismiss="modal">Submit</button>
                        </form>
                    </div>
                </div>
            </div>

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Company</th>
                        <th>Major</th>
                        <th>Position</th>
                        <th>Created At</th>
                        <th>Updated at</th>
                    </tr>
                </thead>
                <tbody id="listJobs">
                    <!--                    <tr>
                                            <td>John</td>
                                            <td>Doe</td>
                                            <td>john@example.com</td>
                                        </tr>-->

                </tbody>
            </table>

            <h2>Users Features</h2>

            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Firstname</th>
                        <th>Lastname</th>
                        <th>Age</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Role</th>
                        <th>Created At</th>
                        <th>Updated At</th>
                    </tr>
                </thead>
                <tbody id="listUser">
                    <!--                    <tr>
                                            <td>1</td>
                                            <td>Ho??ng B???o</td>
                                            <td>L??</td>
                                            <td>22</td>
                                            <td>bao@gmail.com</td>
                                            <td>09010909501</td>
                                            <td>123456</td>
                                            <td>1</td>
                    
                    
                    
                                        </tr>-->
                    <!--                    <tr>
                                            <td>Mary</td>
                                            <td>Moe</td>
                                            <td>mary@example.com</td>
                                        </tr>
                                        <tr>
                                            <td>July</td>
                                            <td>Dooley</td>
                                            <td>july@example.com</td>
                                        </tr>
                                         <tr>
                                            <td>July</td>
                                            <td>Dooley</td>
                                            <td>july@example.com</td>
                                        </tr>-->

                </tbody>
            </table>

            <div  class="chart">
                <canvas id="myChart" style="width:100%;max-width:80%"></canvas>
            </div>

        </div>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="resources/js/alert.js"></script>
        <script src="resources/js/dashboard.js"></script>
        <script>

        </script>
    </body>
</html>
