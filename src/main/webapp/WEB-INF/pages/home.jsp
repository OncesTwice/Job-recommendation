<%-- 
    Document   : home.jsp
    Created on : Apr 10, 2022, 11:16:17 AM
    Author     : Kien Mason
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>W3.CSS Template</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            body,h1,h2,h3,h4,h5,h6 {
                font-family: "Raleway", sans-serif
            }

            .grid-container {
                display: grid;
                grid-template-columns: auto auto auto;
                padding: 10px;
            }
            .grid-item {
                /*background-color: rgba(255, 255, 255, 0.8);*/
                /*border: 1px solid rgba(0, 0, 0, 0.8);*/
                padding: 20px;
                font-size: 30px;
                text-align: center;
            }

        </style>
    </head>
    <body class="w3-light-grey w3-content" style="max-width:1600px">

        <!-- Sidebar/menu -->
        <nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
            <div class="w3-container">
                <a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey" title="close menu">
                    <i class="fa fa-remove"></i>
                </a>
                <img src="data:image/png;base64,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" style="width:45%;" class="w3-round"><br><br>
                <h4><b>PORTFOLIO</b></h4>
                <p class="w3-text-grey">Template by W3.CSS</p>
            </div>
            <div class="w3-bar-block">
                <a href="#portfolio" onclick="w3_close()" class="w3-bar-item w3-button w3-padding w3-text-teal"><i class="fa fa-th-large fa-fw w3-margin-right"></i>PORTFOLIO</a> 
                <a href="#about" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-user fa-fw w3-margin-right"></i>ABOUT US</a> 
                <a href="#contact" onclick="w3_close()" class="w3-bar-item w3-button w3-padding"><i class="fa fa-envelope fa-fw w3-margin-right"></i>CONTACT US</a>
            </div>
            <div class="w3-panel w3-large">
                <i class="fa fa-facebook-official w3-hover-opacity"></i>
                <i class="fa fa-instagram w3-hover-opacity"></i>
                <i class="fa fa-snapchat w3-hover-opacity"></i>
                <i class="fa fa-pinterest-p w3-hover-opacity"></i>
                <i class="fa fa-twitter w3-hover-opacity"></i>
                <i class="fa fa-linkedin w3-hover-opacity"></i>
            </div>
        </nav>

        <!-- Overlay effect when opening sidebar on small screens -->
        <div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:300px">

            <!-- Header -->
            <header id="portfolio">
                <a href="#"><img src="/WEB-INF/img/logo.png" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
                <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
                <div class="w3-container">
                    <h1><b>My Portfolio</b></h1>
                    <div class="w3-section w3-bottombar w3-padding-16">
                        <span class="w3-margin-right">Filter:</span> 
                        <button class="w3-button w3-black">ALL</button>
                        <button class="w3-button w3-white"><i class="fa fa-diamond w3-margin-right"></i>Design</button>
                        <button class="w3-button w3-white w3-hide-small"><i class="fa fa-photo w3-margin-right"></i>Photos</button>
                        <button class="w3-button w3-white w3-hide-small"><i class="fa fa-map-pin w3-margin-right"></i>Art</button>
                    </div>
                </div>
            </header>

            <!-- First Photo Grid-->

            <div class="grid-container" id="listTrip">
                <!--                <div class="grid-item">
                                    <img src="data:image/png;base64,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" alt="Norway" style="width:100%" class="w3-hover-opacity">
                                    <div class="w3-container w3-white">
                                        <p style="text-align: left;">Name: </p>
                                        <p style="text-align: left;">Start: </p>
                                        <p style="text-align: left;">End: </p>
                                        <p style="text-align: left;">Ticket price: </p>
                                        <button class="book" onclick="booking()">Book</button>
                                    </div>
                                </div>-->
                <!--                <div class="grid-item">
                                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAmVBMVEUboOL////w7+/f3t0rpuQAnOEAmuASnuIAneL48/D08e8AmODc3+Dh4OD7/v/t9/xwvuvk8/thuOmJxOhQsufk4N3S6viBxO253vSv2vPG4vbZ5e3J3+zh6e6jz+rr7u+zzt6czvBAquR6wezq9fyLvuC/4PWWze9luena7vq22fNaseV/vueYyOiqz+mGw+ijyN/Q4u3E09vEmZOHAAAJEUlEQVR4nO2dbXuiOhCGAyWJ0FVRqWjry4rdamtbT/f//7gDqCsqkAlklHjl+dj2Uu5OMpmZTAIhdy7n1g+ALkOovwyh/jKE+ssQ6i9DqL8Mof4yhPrLEOovQ6i/DKH+MoT6yxDqL0Oovwyh/jKE+ssQ6i9DqL9uTsixv+CmhJzSKMT+ktsRcsqCxbtlMeTvuRUhZ2QV41lW5y4JOefBm7VT7w4JOSVhzzro+f4IKV91raPG90ZI6apjZbWgyN94XULOw65l3S8hZ/2eda57IqTk7YLvrghZ2MkBtELssO1ahNx5zuOzrP6dELL1uYc5CP0BrkLIH1cFfJZ1F7kF5wUjNBH2gn8NQu68FwPeAyF3iqbgnRAKAK1H7AfAJhQBdnQn5OQyTjsRenqITciG5YDWUHNCNhYAWm/KCHmsvJ+jEtKlCND6UEDIeYsy6mzWy7zfohI6ubG2SkLearFH4n/OXl6mruvnGRGTkJWEMrUJOWlRSp3t12Rue65n27b7mZuIIRJyXwxYjZBzypzo83viuW4KZ6eA+R+FSVi+ElYkTOk2s8k0NtwBLgUcFHwSHiEdAADlCBM6sp79zD03C5cCfhV9EBohJxATWit4EaPVIv3Zj+d553QJ4KzwP4VHGEIAoUUMTkm0nczdPLpY3kfxPwqNkIqimZ1yHfyZOOXr2cvlyDxacJK/2KdCI3RAgOIyTTz11t/xxCuiSyz40ir5FCxC0FIRKygljAfn5qPEeHvA0ifBImQftQl5i22+pwK8GHDqlP6X0Ajzqr85ioo+gDNn8FPgWE4Jy4cBHmFZbSaj/O+PQ+nNyIbw2W6/Vf4kaISg1TCfkFNn8CIcnXsL+qIFFYvwEQaYM0o5C77nZa7zBHAgjBjQCMWJU6qzSRR7l/XEhpkvGaIzcUh061F6StgiW7HzzACOAHUsNEJYSHNC2Ir+gIdnOkQnAieDSwhcLY4xDY3+e3iQ4ItXetDDoxGOYISHuJRGv5+e5AjnEShqxyKkxbtNJ1omT8l5kPJJEXoRZIwixqUBjDDJD+lmzydD6K2BmeWtc4sFy/A9tMGA7hc0dcbLgGFh20d05JMgdL/B1Q80QkgpMdY0wwcn9Cbw8g6eDWEJYvvhQZ5QkBFeixDmauwTwl8wQuA6gUxImGBfrQahKGG6FqFw3ymRJ0/obqWqyHiEwIkoTSjhRlMhVvUpKIGSJYSF2xkhEsLWi7YcoTeVfQzMnRlQ1duWI5Ryo6kwCYk0oXA9dIVlmQuh7pCCsmAZwuIdpmJhEsIyqDac0JtUaLdF3cePIIRzMKFUsPZPqISg/OJkIpYTSnuZRLjdJjOIEaGE7rJSSziuDTcQwjaMUDaWOQi56wtSNc0QlqyH3k/Fo4rIXV+QmqINIrQrTUKCTci3AEIPQuiuJcPRf0IepaD1AjAPq05Cgt99Cckv2kLCaivhTtiEkPwiMxHn+YTy8fZR2ISQRL8jIizoyYMJmZAuAISWgFCmdngp7D5vUI44L5+H05J+ILGwCUHte3YpobepdXIIe5SCItPjMM1JLjzATnaZsD0NbBuxXUzo/dQ8+4VNCCoLH4dpDmGNhSIVctQGKtVkAreLsM0Vt5MIVEBYcHZBVlx8HOF0mJ4TSldHL1VA6PSdpOdYAjP3T4FbbEfCi1Fad4wWj1JOQj+cLaOIMFZqT86440SRk/zdxS8jYN/QcSKqHqNl8zAeqLQ/eH57HoabIOXMAeV087ZzJp3heEPOIGGbM6lyCb0fBSdqyj0N54xF69G71e0NB8uAMkaznJSFJ77ydRw9ZhkBZ2bOh+mpCVX4QcBncEZJME6qu53ucBEmnAlo/OPw9eJJh/2jHaFdQ4kOw3SueIxCV4vkoAPtz3o7m3SHH6t+fzvKt1DPT8dz/B8ANkLvdGnD2mu9DOEOkzJnObo024Xe/XjaOmtgV9Re7UsbCpp/1ROmlIwEK3Gdt/vahU/BnexzG3rVCxd1CPfnjrbAzkMJdc6X/Kmiuwgqeat4jjnhUNZKArVPl/zqxTUVhDvIaAULq4GyTwjr5fUqCBNR3lc4WjunE7HwmMI1CRPHE6ljbGecqVdhK7RAdaMGztaA9QMkO2PDqbr7FOvHRZzAo89yHW3oLhW5GaIkA+ZUKngpVvvgarwXhfcQKMnxqeDyC6DsA6Gr8molNVUM7ihZOPaElRoSCqWoTsMdFf5mvnM1ntLbsVRVokS3tICULolq8t6jlNXaOGirUKDE1/zKv/yhstRVE1V41MTXPM3VrRSJFNZL2aI+YjJMlUWkO6msCINrh6VGfPpqrA2h1yiUKfY1T3/UXlKntKoPPQpUonazCQmFXRVRIq/hhITB9gvLjPj0p7nzMJFMjTRX9sNftXe2qibkwBs/Soz4q7mrRSpOa64Z3kOg9IHU75ByWjMjVjwRMfaAC24Mhsr929C4NCPq1JqM9kblwyDt47N1nZT4t8phinbSmfrV7eipNCLi2TUajavGqX+bVokqEGd0XbDJKNJno6qJZeKMrccVpmTtPqGjrnBTMmOB/yxL+aKmoYdc68ZyzkjkfwAvVtppouqC4eu9OSC2JYsWY/Dm8EiRt7nyO0ooY6S/HfcgTnZxo13u2kr6VJgT+OOhCHOlBPFG73tK23FItByXhgVKEG/6VrJ0bgaDt9eiubnK6ZWT1W0JE6WdZf4ofzkZy7RH5uv2hKk441H4lmPKYe11sSGEiWJb9mcX3uc1qlm2aRAhSaL1x2Bxvk/n1/M3zSIkx5cGZidjLcTGEZL0Vt1gnJ2TPacGYxMJyS4nec5ADqr71IYSkvSK1u1xCRlGVc3YXMLdaP2XQXeqrv5NJiS7l3kefGsvqGTGhhOmvvVff+DIqWDHxhOStD9w71o7C96o21vUKR6si30XffgoaUY9CEnyes/96y+7vlyoqg1h5vzKeyjTm6kRYdKU7MeMQeRvJTbgtCJMkslld1t+1OxcmhEmTmdZfo/+ubQjlH7fvIaEkjKE+ssQ6i9DqL8Mof4yhPrLEOovQ6i/DKH+MoT6yxDqL0Oovwyh/jKE+ssQ6i9DqL8Mof4yhPrLEOovQ6i/DKH+MoT6yxDqL+d/LRp/gCpNHhcAAAAASUVORK5CYII=" alt="Norway" style="width:100%" class="w3-hover-opacity">
                                    <div class="w3-container w3-white">
                                        <p><b>Lorem Ipsum</b></p>
                                        <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
                                    </div>
                                </div>
                                <div class="grid-item">
                                    <img src="data:image/png;base64,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" alt="Norway" style="width:100%" class="w3-hover-opacity">
                                    <div class="w3-container w3-white">
                                        <p><b>Lorem Ipsum</b></p>
                                        <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
                                    </div>
                                </div>
                                <div class="grid-item w3-row-padding">
                                    <img src="data:image/png;base64,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" alt="Norway" style="width:100%" class="w3-hover-opacity">
                                    <div class="w3-container w3-white">
                                        <p><b>Lorem Ipsum</b></p>
                                        <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
                                    </div>
                                </div>
                                <div class="grid-item w3-row-padding">
                                    <img src="/WEB-INF/img/logo.png" alt="alt"/>
                                    <div class="w3-container w3-white">
                                        <p><b>Lorem Ipsum</b></p>
                                        <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
                                    </div>
                                </div>
                                <div class="grid-item w3-row-padding">
                                    <img src="data:image/png;base64,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" alt="Norway" style="width:100%" class="w3-hover-opacity">
                                    <div class="w3-container w3-white">
                                        <p><b>Lorem Ipsum</b></p>
                                        <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
                                    </div>
                                </div>
                                <div class="grid-item w3-row-padding">
                                    <img src="data:image/png;base64,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" alt="Norway" style="width:100%" class="w3-hover-opacity">
                                    <div class="w3-container w3-white">
                                        <p><b>Lorem Ipsum</b></p>
                                        <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
                                    </div>
                                </div>-->

            </div>

            <!-- Pagination -->
            <!--            <div class="w3-center w3-padding-32">
                            <div class="w3-bar">
                                <a href="#" class="w3-bar-item w3-button w3-hover-black">«</a>
                                <a href="#" class="w3-bar-item w3-black w3-button">1</a>
                                <a href="#" class="w3-bar-item w3-button w3-hover-black">2</a>
                                <a href="#" class="w3-bar-item w3-button w3-hover-black">3</a>
                                <a href="#" class="w3-bar-item w3-button w3-hover-black">4</a>
                                <a href="#" class="w3-bar-item w3-button w3-hover-black">»</a>
                            </div>
                        </div>-->

            <!-- Images of Me -->
            <!--            <div class="w3-row-padding w3-padding-16" id="about">
                            <div class="w3-col m6">
                                <img src="/w3images/avatar_g.jpg" alt="Me" style="width:100%">
                            </div>
                            <div class="w3-col m6">
                                <img src="/w3images/me2.jpg" alt="Me" style="width:100%">
                            </div>
                        </div>-->

            <div class="w3-container w3-padding-large" style="margin-bottom:32px">
                <h4><b>About Us</b></h4>
                <p>Just me, myself and I, exploring the universe of unknownment. I have a heart of love and an interest of lorem ipsum and mauris neque quam blog. I want to share my world with you. Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla. Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
                <hr>


                <hr>

            </div>

            <!-- Contact Section -->
            <div class="w3-container w3-padding-large w3-grey">
                <h4 id="contact"><b>Contact us</b></h4>
                <div class="w3-row-padding w3-center w3-padding-24" style="margin:0 -16px">
                    <div class="w3-third w3-dark-grey">
                        <p><i class="fa fa-envelope w3-xxlarge w3-text-light-grey"></i></p>
                        <p>email@email.com</p>
                    </div>
                    <div class="w3-third w3-teal">
                        <p><i class="fa fa-map-marker w3-xxlarge w3-text-light-grey"></i></p>
                        <p>Chicago, US</p>
                    </div>
                    <div class="w3-third w3-dark-grey">
                        <p><i class="fa fa-phone w3-xxlarge w3-text-light-grey"></i></p>
                        <p>512312311</p>
                    </div>
                </div>
                <hr class="w3-opacity">
                <form action="/action_page.php" target="_blank">
                    <div class="w3-section">
                        <label>Name</label>
                        <input class="w3-input w3-border" type="text" name="Name" required>
                    </div>
                    <div class="w3-section">
                        <label>Email</label>
                        <input class="w3-input w3-border" type="text" name="Email" required>
                    </div>
                    <div class="w3-section">
                        <label>Message</label>
                        <input class="w3-input w3-border" type="text" name="Message" required>
                    </div>
                    <button type="submit" class="w3-button w3-black w3-margin-bottom"><i class="fa fa-paper-plane w3-margin-right"></i>Send Message</button>
                </form>
            </div>

            <!-- Footer -->
            <footer class="w3-container w3-padding-32 w3-dark-grey">
                <div class="w3-row-padding">
                    <div class="w3-third">
                        <h3>FOOTER</h3>
                        <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
                        <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
                    </div>

                    <div class="w3-third">
                        <h3>BLOG POSTS</h3>
                        <ul class="w3-ul w3-hoverable">
                            <li class="w3-padding-16">
                                <img src="/w3images/workshop.jpg" class="w3-left w3-margin-right" style="width:50px">
                                <span class="w3-large">Lorem</span><br>
                                <span>Sed mattis nunc</span>
                            </li>
                            <li class="w3-padding-16">
                                <img src="/w3images/gondol.jpg" class="w3-left w3-margin-right" style="width:50px">
                                <span class="w3-large">Ipsum</span><br>
                                <span>Praes tinci sed</span>
                            </li> 
                        </ul>
                    </div>

                    <div class="w3-third">
                        <h3>POPULAR TAGS</h3>
                        <p>
                            <span class="w3-tag w3-black w3-margin-bottom">Travel</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">New York</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">London</span>
                            <span class="w3-tag w3-grey w3-small w3-margin-bottom">IKEA</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">NORWAY</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">DIY</span>
                            <span class="w3-tag w3-grey w3-small w3-margin-bottom">Ideas</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">Baby</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">Family</span>
                            <span class="w3-tag w3-grey w3-small w3-margin-bottom">News</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">Clothing</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">Shopping</span>
                            <span class="w3-tag w3-grey w3-small w3-margin-bottom">Sports</span> <span class="w3-tag w3-grey w3-small w3-margin-bottom">Games</span>
                        </p>
                    </div>

                </div>
            </footer>

            <div class="w3-black w3-center w3-padding-24">Powered by <a href="https://www.w3schools.com/w3css/default.asp" title="W3.CSS" target="_blank" class="w3-hover-opacity">w3.css</a></div>

            <!-- End page content -->
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
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
                            const {id, name, startLocation, endLocation} = value
                            console.log(name)

                            var html = `<div class='grid-item'>
                                            <img src='data:image/png;base64,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' alt='Norway' style='width:100%' class='w3-hover-opacity'/>
                                            <div class='w3-container w3-white'>
                                                <p style='text-align: left;'>Name: `+ name + `</p>
                                                <p style='text-align: left;'>Start: `+ startLocation +`</p>
                                                <p style='text-align: left;'>End: `+ endLocation +`</p>
                                                <p style='text-align: left;'>Ticket price: `+ startLocation +`</p>
                                                <button class='book' onclick='booking(`+ id +`)'>Book</button>
                                            </div>
                                        </div>`
                            console.log(value);
                            $("#listTrip").append(html);
                        });
                    }

                    getTrips()

                    const booking = (id) => {
                        let text = "Are you sure?";
                        if (!confirm(text + id))
                            return;


                    }


        </script>

    </body>
</html>
