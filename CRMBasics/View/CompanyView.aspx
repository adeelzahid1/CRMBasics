<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyView.aspx.cs" Inherits="CRMBasics.View.CompanyView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Style/bootstrapslim.css" rel="stylesheet" />
    <link href="../Style/Custome.css" rel="stylesheet" />
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet" />
</head>
<body>
    <form id="form2" runat="server">
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
                                    <a href="#" class="nav-link">Home</a>
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

        <section id="customerView">
            <div class="m-5">
                <div class="form mt-5">
                    <div class="container">
                        <div class="row">
                            <div class="col-10 offset-2 m-auto">
                                <div class="col-8 offset-4 m-auto p-3">
                                    <h2 class="text-danger">Details About Your Select View </h2>
                                </div>
                                <div class="row form-group">
                                    <label for="DropDownListCards" class="col-sm-2"><strong>Choose View: </strong></label>
                                    <div class="col-sm-5">
                                        <div class="row">
                                            <div id="ErrorCards" class="text-danger"></div>
                                            <div class="col-sm-9">
                                                <asp:DropDownList ID="DropDownListCards" runat="server" CssClass="form-control">
                                                    <%--enable: selectedChoice"--%><%--data-bind="value: selectedValue, optionsText:???"--%>
                                                    <asp:ListItem Value="0" class="dropdown-item disabled">-- Select Your View --</asp:ListItem>

                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-sm-3">
                                                <input type="button" value="All Record" class="btn btn-sm btn-dark" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-5">
                                        <input type="text" id="search" class="form-control-sm ml-2" placeholder="Search..." />
                                        <%--data-bind="value: viewModel.searchTxt, valueUpdate: 'afterkeydown'"--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="tableCompanyWarning">
                    <h4 class="text-danger text-center">No Record Found</h4>
                </div>


                <div id="tableinfo">
                    <div class="container-fluid">
                        <div class="row mt-1">
                            <%--<div class="col-1"></div>--%>
                            <div class="col-12 m-auto">

                                <table class="table table-hover table-responsive" id="customerTable">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>No.</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Mobile</th>
                                            <th>R-Date</th>
                                            <th>Type</th>
                                            <th>Employee</th>
                                            <th>Services</th>
                                            <th>Address</th>
                                        </tr>
                                    </thead>
                                    <tbody id="compnayKO" data-bind="foreach: vm.company">
                                        <%--data-bind="foreach: {data: Accounts, as:'Account'}--%><%--data-bind="foreach: Accounts"--%>
                                        <tr>
                                            <td data-bind="text: Id"></td>
                                            <td data-bind="text: Name"></td>
                                            <td data-bind="text: Email"></td>
                                            <td data-bind="text: Mobile"></td>
                                            <td data-bind="text: Register"></td>
                                            <td data-bind="text: CType"></td>
                                            <td data-bind="text: NoEmployee"></td>
                                            <td data-bind="text: Services"></td>
                                            <td data-bind="text: Address"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <%--<div class="col-1"></div>--%>
                        </div>
                    </div>
                    <hr class="mt-5" />
                </div>
            </div>
        </section>


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

                        <div class="col-lg-3 col-md-5 mr-auto col-sm-12">
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
    <script src="../Script/CompanyView.js"></script>
    <script>
        $("#year").html(new Date().getFullYear());
    </script>
</body>
</html>
