/// <reference path="C:\Users\adeelzahid\Desktop\CustomerRelationBasics\CustomerRelationBasics\View/CompanyRegistration.aspx" />

var viewModel = new ViewModel();
fieldHide();
disableInputs();

$(document).ready(function () {
    var person = viewModel.Person(new CrModel(null));
    ko.applyBindings(person);

    $("#birth").datepicker({
        dateFormat: 'yy-mm-dd',
        changeMonth: true,
        changeYear: true,
        yearRange: '1970:2001'
    });
});




//View Model
function ViewModel() {
    var self = this;
    self.Person = ko.observableArray();
    self.selectCustomer = ko.observable("");
    self.countryList = ko.observableArray();
    self.customerList = ko.observableArray();

    $(document).ready(function () {
        $.getJSON("/api/Customer/GetAllCustomerIds", function (data) {
            var deta = JSON.parse(data);
            console.log(deta);
            ko.utils.arrayForEach(deta, function (item) {
                console.log(item.id);
                self.customerList.push(item.id);
            });
        });
    });

    //----------------------------------------//
    self.UpdateBtn = function () {
        $(document).ready(function() {
            $.ajax({
                url: "/api/Customer/UpdateCustomerRecord",
                dataType: "json",
                data: JSON.parse(ko.toJSON(viewModel.Person())),
                method: 'put',
                success: function(data, status) {
                    alert("Success: " + data);
                }
            });
        });
    }


    // -----------------------------------------// 
    self.DeleteBtn = function () {
        $(document).ready(function () {
            var id = self.selectCustomer();
            $.ajax({
                url: "/api/Customer/DeleteCustomerRecord/"+id,
                dataType: "json",
                data: JSON.parse(ko.toJSON(viewModel.Person())),
                method: 'delete',
                success: function (data, status) {
                    $("#form1").trigger("reset");
                    alert("Success: " + data);
                }
            });
        });
    }

    //----------------------------------------//

    self.changeCustomerId = function () {
        console.log(self.selectCustomer());
        var val = self.selectCustomer();
        console.log("From Change Event ", val);
        if (val > 0) {
            $.getJSON("/api/Customer/GetaCustomerRecord/" + val,
                function (data) {
                    dataa = JSON.parse(data);
                    console.log(dataa.length);
                    if (dataa.length > 0) {
                        ko.utils.arrayMap(dataa,
                            function (item) {
                                console.log(item.fname, item.lname, item.address);
                                viewModel.Person(new CrModel(item));
                            });
                        $("#editBtn").show();
                    }
                });
        } else {
            viewModel.Person(new CrModel(null));
            fieldHide();
        }

        // --------------------------

        self.EditBtn = function () {
            $("#editBtn").hide();
            $("#submitBtn, #deleteBtn, #resetBtn").show();
            enableInputs();
        }
        self.CancelBtn = function() {
            //$("#editBtn").show();
            //$("#submitBtn, #deleteBtn, #resetBtn").hide();
            fieldHide();
            disableInputs();
            $("#form1").trigger('reset');
        }
    };

    //----------------------------------------//
}

// Model
function CrModel(item) {
    var self = this;
    if (item !== null) {
        self.id = ko.observable(item.id);
        self.fname = ko.observable(item.fname);
        self.lname = ko.observable(item.lname);
        self.email = ko.observable(item.email);
        self.phone = ko.observable(item.phone);
        self.birth = ko.observable(item.Birthdate);
        self.gender = ko.observable(item.gender);
        self.country = ko.observable(item.country);
        self.city = ko.observable(item.city);
        self.province = ko.observable(item.province);
        self.address = ko.observable(item.address);

    } else {
        self.fname = ko.observable("");
        self.lname = ko.observable("");
        self.email = ko.observable("");
        self.phone = ko.observable("");
        self.birth = ko.observable("");
        self.gender = ko.observable("");
        self.address = ko.observable("");
        self.country = ko.observable("");
        self.province = ko.observable("");
        self.city = ko.observable("");
    }
}


function resetForm() {
    $("#form1").trigger('reset');
    $("#male").prop("checked", true);
}


function fieldHide() {
    $("#editBtn, #submitBtn, #deleteBtn, #resetBtn").hide();
}
function fieldShow() {
    $("#editBtn, #submitBtn, #deleteBtn, #resetBtn").show();
}

function disableInputs() {
    $('#fname, #lname, #email, #mobile, #birth, #countryTxt, #provinceTxt, #cityTxt, #address').attr('readonly', true);
    $("input[name='gender']").each(function (i) {
        $(this).attr('disabled',true);
    });
}

function enableInputs() {
    $('#fname, #lname, #email, #mobile, #birth, #countryTxt, #provinceTxt, #cityTxt, #address').attr('readonly', false);
    $("input[name='gender']").each(function (i) {
        $(this).attr('disabled', false);
    });
}

function emptyFields() {
    $('#fname, #lname, #email, #mobile, #birth, #countryTxt, #provinceTxt, #cityTxt, #address').val(' ');

}