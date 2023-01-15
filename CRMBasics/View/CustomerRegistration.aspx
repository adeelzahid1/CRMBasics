<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerRegistration.aspx.cs" Inherits="CRMBasics.View.CustomerRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Style/jquery-ui-css.css" rel="stylesheet" />
     <link href="../Style/bootstrapslim.css" rel="stylesheet" />
    <link href="../Style/Custome.css" rel="stylesheet" />
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
     <header>
            <div class="">
                <%----------------------NAVIGATION BAR---------------%>
                <nav class="navbar navbar-expand-md navbar-dark bg-dark  py-1">
                    <%--fixed-top--%>
                    <div class="container">
                        <a href="#" class="navbar-brand">
                            <img src="../Images/logoImg.png" width="50" height="50" />
                            <h3 class="d-inline align-middle txtlogo"><span class="customer1">Customer</span> <span class="customer2">Relation</span></h3>
                        </a>

                        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#NavMenu">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse " id="NavMenu">
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item">
                                    <a href="ViewSummary.aspx" class="nav-link">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a href="CustomerRegistration.aspx" class="nav-link">Customer</a>
                                </li>
                                <li class="nav-item">
                                    <a href="CompanyRegistration.aspx" class="nav-link">Company</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#" class="nav-link">Indexes </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </header>
        <%------------------------------------- Navigation Bar Ending ---------------------------------------%>
         <div class="bg-light" data-bind="with: viewModel.Person">
        <div class="form mt-2">
           
            <div class="container">

                <div class="row">
                    <div class="col-md-5 col-6 offset-7 m-auto">
                        <h3>Customer Registration</h3>
                    </div>
                </div>

                <%--First Name--%>
                <div class="row form-group mt-3" id="Dfname">
                    <div class="col-lg-6 col-9 offset-6 m-auto">
                        <div class="row">
                            <div class="col-md-3  d-none d-sm-block">
                                <p>First Name: </p>
                            </div>
                            <div class="col-md-9 col-sm-12">
                                <div id="Errorfname" class=""></div>
                                <input type="text" id="fname" class="form-control" placeholder="First Name" data-bind="value: fname" />
                            </div>
                        </div>
                    </div>
                </div>

                <%--Last Name--%>
                <div class="row form-group" id="Dlname">
                    <div class="col-lg-6 col-9 offset-6 m-auto">
                        <div class="row">
                            <div class="col-md-3  d-none d-sm-block">
                                <p>Last Name: </p>
                            </div>
                            <div class="col-md-9 col-sm-12">
                                <div id="Errorlname" class=""></div>
                                <input type="text" id="lname" class="form-control" placeholder="Last Name"  data-bind="value: lname"/>
                            </div>
                        </div>
                    </div>
                </div>

                <%--Email--%>
                <div class="row form-group" id="Demail">
                    <div class="col-lg-6 col-9 offset-6 m-auto">
                        <div class="row">
                            <div class="col-md-3  d-none d-sm-block">
                                <p>Email : </p>
                            </div>
                            <div class="col-md-9 col-sm-12">
                                <div id="ErrorEmail" class=""></div>
                                <input type="email" id="email" class="form-control" placeholder="Email@"  data-bind="value: email"/>
                            </div>
                        </div>
                    </div>
                </div>

                <%--Mobile--%>
                <div class="row form-group" id="Dmobile">
                    <div class="col-lg-6 col-9 offset-6 m-auto">
                        <div class="row">
                            <div class="col-md-3  d-none d-sm-block">
                                <p>Mobile# : </p>
                            </div>
                            <div class="col-md-9 col-sm-12">
                                <div id="ErrorMobile" class=""></div>
                                <input type="text" id="mobile" class="form-control" placeholder="Mobile #"  data-bind="value: phone"/>
                            </div>
                        </div>
                    </div>
                </div>

                <%--Birth--%>
                <div class="row form-group" id="Dbirth">
                    <div class="col-lg-6 col-9 offset-6 m-auto">
                        <div class="row">
                            <div class="col-md-3 d-none d-sm-block">
                                <p>Birth Date : </p>
                            </div>
                            <div class="col-md-9 col-sm-12">
                                <div id="ErrorBirth" class=""></div>
                                <input type="text" id="birth" class="form-control" placeholder="Birth Date" data-bind="value: birth" />
                            </div>
                        </div>
                    </div>
                </div>

                <%--Gender--%>
                <div class="row form-group" id="Dgender">
                    <div class="col-lg-6 col-9 offset-6 m-auto">
                        <div class="row">
                            <div class="col-md-3  d-none d-sm-block">
                                <p>Gender : </p>
                            </div>
                            <div class="col-xs-4">
                                <div class="custom-control custom-radio ml-2">
                                    <input type="radio" class="custom-control-input" id="male" value="Male" name="gender" data-bind="checked: gender"/>
                                    <label class="custom-control-label" for="male">Male</label>
                                </div>
                            </div>
                            <div class="col-xs-2 ">
                                <div class="custom-control custom-radio ml-4">
                                    <input type="radio" class="custom-control-input" id="female" value="Female" name="gender" data-bind="checked: gender"/>
                                    <label class="custom-control-label" for="female">Female</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%--Address--%>
                <div class="row form-group" id="Daddress">
                    <div class="col-lg-6 col-9 offset-6 m-auto">
                        <div class="row">
                            <div class="col-md-3  d-none d-sm-block">
                                <p>Address : </p>
                            </div>
                            <div class="col-md-9 col-sm-12">
                                <div id="ErrorAddress" class=""></div>
                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <select id="Country" class="form-control"
                                             data-bind="options: viewModel.countryList,
                                                        optionsCaption: '--Country--',
                                                        value: selectedCountryName,
                                                        optionsText: 'name',
                                                        //optionsValue: 'id',
                                                        event: { change: viewModel.selectedCountry }"
                                            >
                                        </select>
                                    </div>

                                    <div class="form-group col-md-4">
                                        <select id="province" class="form-control"
                                            data-bind="options: viewModel.provinceList,
                                                       optionsCaption: '--Province--',
                                                       value: selectedProvinceName,
                                                       optionsText: 'name',
                                                       //optionsValue: 'id',
                                                       event: { change: viewModel.selectedProvince }"
                                            >       
                                        </select>
                                    </div>

                                    <div class="form-group col-md-4">
                                        <select id="city" class="form-control"
                                             data-bind="options: viewModel.cityList,
                                                       optionsCaption: '--City--',
                                                       value: selectedCity,
                                                       //optionsValue: 'id',
                                                       optionsText: 'name'"
                                            >
                                        </select>
                                    </div>
                                </div>
                                <textarea class="form-control" rows="2" id="address" placeholder="Optional Street Address"  data-bind="value: address"></textarea>
                            </div>
                        </div>
                    </div>
                </div>

                <%--Submit Button--%>

                <div class="row form-group" id="btnrow">
                    <div class="col-9 offset-6 m-auto">
                        <div class="row">
                            <div class="col-md-3"></div>
                            <div class="col-md-9 col-xs-12">
                                <div class="row justify-content-around">
                                    <div>
                                        <input type="button" id="submitBtn" value=" Next " class="btn btn-info" data-bind="event: { click: viewModel.submitBtn }"/>
                                    </div>
                                    <div>
                                        <input type="button" id="resetBtn" value="Reset" class="btn btn-sm btn-warning" data-bind="event: { click: viewModel.resetBtn }"/>
                                        
                                    </div>
                                </div>
                            </div>

                            
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

        <%------------------------------------- Footer Styling is Here >> Down >> ---------------------------------------%>
        <footer>
            <div class="bg-dark">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-6 col-sm-12">
                            <h4 class="text-white py-4"><span class="customer1">Customer</span> <span class="customer2">Relation</span> <span class="customer3">Management </span></h4>
                        </div>
                        <div class="col-lg-3 col-md-6 col-sm-12">
                            <div class="mt-4">
                                <h5 class="text-white">Contact </h5>
                                <div class="row">
                                    <div class="col-1"><i class="fas fa-map-marker text-info"></i></div>
                                    <div class="col-10">
                                        <h6 class="font-weight-light mb-0 text-white">Address:</h6>
                                        <p class="text-white">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 col-sm-12">
                            <div class="input-group mt-4">
                                <input type="text" class="form-control" placeholder="Your Email Address"/>
                                <span class="input-group-addon text-white" id="basic-addon2"><i class="fas fa-check"></i></span>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6 col-sm-12">
                            <ul class="social-pet mt-4">
                                <li><a href="#" title="facebook"><i class="fab fa-facebook-f"></i></a></li>
                                <li><a href="#" title="twitter"><i class="fab fa-twitter"></i></a></li>
                                <li><a href="#" title="google-plus"><i class="fab fa-google-plus-g"></i></a></li>
                                <li><a href="#" title="instagram"><i class="fab fa-instagram"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>


            <section class="copyright">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 ">
                            <div class="text-center text-white">
                                &copy; <span id="year"></span> Adeel Company. All Rights Reserved.
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </footer>
    </form>



    <script src="../Script/jquery-3.4.1.js"></script>
    <script src="../Script/knockout-3.5.1.js"></script>
    <script src="../Script/bootstrap.min.js"></script>
    <script src="../Script/jquery-ui-js.js"></script>
    <script src="../Script/customer.js"></script>
    <script>
        $("#year").html(new Date().getFullYear());
    </script>
</body>
</html>

