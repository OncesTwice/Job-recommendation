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
            <h2>Striped Rows</h2>
            <p>The .table-striped class adds zebra-stripes to a table:</p>            
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Firstname</th>
                        <th>Lastname</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>John</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                    </tr>
                    <tr>
                        <td>Mary</td>
                        <td>Moe</td>
                        <td>mary@example.com</td>
                    </tr>
                    <tr>
                        <td>July</td>
                        <td>Dooley</td>
                        <td>july@example.com</td>
                    </tr>
                </tbody>
            </table>
            <h2>Striped Rows</h2>
            <p>The .table-striped class adds zebra-stripes to a table:</p> 
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Firstname</th>
                        <th>Lastname</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>John</td>
                        <td>Doe</td>
                        <td>john@example.com</td>
                    </tr>
                    <tr>
                        <td>Mary</td>
                        <td>Moe</td>
                        <td>mary@example.com</td>
                    </tr>
                    <tr>
                        <td>July</td>
                        <td>Dooley</td>
                        <td>july@example.com</td>
                    </tr>
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
                            var xValues = ["Italy", "France", "Spain", "USA", "Argentina"];
                            var yValues = [55, 49, 44, 24, 15];
                            var barColors = [
                                "#b91d47",
                                "#00aba9",
                                "#2b5797",
                                "#e8c3b9",
                                "#1e7145"
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
                                        text: "Job Analyzing"
                                    }
                                }
                            });
        </script>
    </body>
</html>
