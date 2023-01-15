<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyRegistration.aspx.cs" Inherits="CRMBasics.CompanyRegistration" %>

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

        <div class="bg-light" data-bind="with: viewModel.Company">
            <div class="form mt-2">

                <div class="container">

                    <div class="row">
                        <div class="col-md-5 col-6 offset-7 m-auto">
                            <h3>Company Registration</h3>
                        </div>
                    </div>

                    <%--First Name--%>
                    <div class="row form-group mt-3" id="Dfname">
                        <div class="col-lg-6 col-9 offset-6 m-auto">
                            <div class="row">
                                <div class="col-md-3  d-none d-sm-block">
                                    <p>Name: </p>
                                </div>
                                <div class="col-md-9 col-sm-12">
                                    <div id="Errorfname" class=""></div>
                                    <input type="text" id="fname" class="form-control" placeholder="Company Name" data-bind="value: name" />
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
                                    <input type="email" id="email" class="form-control" placeholder="Company Email@" data-bind="value: email" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--Mobile--%>
                    <div class="row form-group" id="Dmobile">
                        <div class="col-lg-6 col-9 offset-6 m-auto">
                            <div class="row">
                                <div class="col-md-3  d-none d-sm-block">
                                    <p>Contact # : </p>
                                </div>
                                <div class="col-md-9 col-sm-12">
                                    <div id="ErrorMobile" class=""></div>
                                    <input type="text" id="mobile" class="form-control" placeholder="Company Contact#" data-bind="value: phone" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--Registration--%>
                    <div class="row form-group" id="DRegistration">
                        <div class="col-lg-6 col-9 offset-6 m-auto">
                            <div class="row">
                                <div class="col-md-3 d-none d-sm-block">
                                    <p>Registration : </p>
                                </div>
                                <div class="col-md-9 col-sm-12">
                                    <div id="ErrorRegistration" class=""></div>
                                    <input type="text" id="registeration" class="form-control" placeholder="Company Registration Date" data-bind="value: registration" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--No of Employees--%>
                    <div class="row form-group" id="DNoEmployee">
                        <div class="col-lg-6 col-9 offset-6 m-auto">
                            <div class="row">
                                <div class="col-md-3  d-none d-sm-block">
                                    <p>No# Employees: </p>
                                </div>
                                <div class="col-md-9 col-sm-12">
                                    <div id="ErrorNoEmployee" class=""></div>
                                    <input type="text" id="lname" class="form-control" placeholder="Number of Employees" data-bind="value: employees" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--No of Employees--%>
                    <div class="row form-group" id="TypeofCompany">
                        <div class="col-lg-6 col-9 offset-6 m-auto">
                            <div class="row">
                                <div class="col-md-3  d-none d-sm-block">
                                    <p>Type Company:</p>
                                </div>
                                <div class="col-md-9 col-sm-12">
                                    <div id="ErrorTypeCompnay" class=""></div>
                                    <select class="form-control" id="services"  data-bind="value: typeCmpny">
                                        <option value="0" disabled="disabled" selected="selected" hidden="hidden">Type of Company</option>
                                        <option value="A private limited company">A private limited company</option>
                                        <option value="A single member company">A single member company</option>
                                        <option value="A public limited company">A public limited company</option>
                                        <option value="A company limited by guarantee">A company limited by guarantee</option>
                                        <option value="An unlimited company">An unlimited company</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--Services--%>
                    <div class="row form-group" id="Dgender">
                        <div class="col-lg-6 col-9 offset-6 m-auto">
                            <div class="row">
                                <div class="col-md-3 ">
                                    <p>Services : </p>
                                </div>
                                <div class="col-md-9 col-sm-12">
                                    <div class="d-sm-flex justify-content-around ml-3">
                                        <div class="checkbox">
                                            <label class="mr-1">
                                                <input type="checkbox" data-bind="checked: services" value="Telecom" />Telecom</label>
                                        </div>
                                        <div class="checkbox">
                                            <label class="mr-1">
                                                <input type="checkbox" value="Business" data-bind="checked: services"/>Business</label>
                                        </div>
                                        <div class="checkbox">
                                            <label class="mr-1">
                                                <input type="checkbox" value="Banking" data-bind="checked: services"/>Banking</label>
                                        </div>
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
                                                    event: { change: viewModel.selectedCountry }">
                                            </select>
                                        </div>

                                        <div class="form-group col-md-4">
                                            <select id="province" class="form-control"
                                                data-bind="options: viewModel.provinceList,
                                                    optionsCaption: '--Province--',
                                                    value: selectedProvinceName,
                                                    optionsText: 'name',
                                                    //optionsValue: 'id',
                                                    event: { change: viewModel.selectedProvince }">
                                            </select>
                                        </div>

                                        <div class="form-group col-md-4">
                                            <select id="city" class="form-control"
                                                data-bind="options: viewModel.cityList,
                                                   optionsCaption: '--City--',
                                                   value: selectedCity,
                                                   //optionsValue: 'id',
                                                   optionsText: 'name'">
                                            </select>
                                        </div>
                                    </div>
                                    <textarea class="form-control" rows="2" id="address" placeholder="Optional ..." data-bind="value: address"></textarea>
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
                                            <input type="button" id="submitBtn" value="Submit" class="btn btn-info" data-bind="event: { click: submitBtn }" />
                                        </div>
                                        <div>
                                            <input type="button" id="resetBtn" value="Reset" class="btn btn-sm btn-warning mr-lg-4 mr-md-3 mr-2" data-bind="event: { click: resetBtn }" />

                                        </div>
                                    </div>
                                </div>



                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <%------------------------------------->>Footer Bar Starting<< ---------------------------------------%>
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
                                <input type="text" class="form-control" id="subscribe" placeholder="Subscribe ... Enter Your Email@" />
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
                                &copy; <span id="year"></span>Adeel Company. All Rights Reserved.
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
    <script src="../Script/company.js"></script>
    <script>
        $("#year").html(new Date().getFullYear());
    </script>
</body>
</html>
