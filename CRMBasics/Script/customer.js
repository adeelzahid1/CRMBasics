/// <reference path="C:\Users\adeelzahid\Desktop\CustomerRelationBasics\CustomerRelationBasics\View/CompanyRegistration.aspx" />

var viewModel = new viewModel();
$(document).ready(function () {
    viewModel.Person(new CRModel());
    ko.applyBindings(viewModel);

    $("#birth").datepicker({
        dateFormat: 'yy-mm-dd',
        changeMonth: true,
        changeYear: true,
        yearRange: '1970:2001'
    });
});



//View Model
function viewModel() {
    var self = this;
    self.Person = ko.observable();
    self.countryList = ko.observableArray();
    $(document).ready(function () {
        $.getJSON("/api/Customer/GetAllCountries", function (data) {
            dataa = JSON.parse(data);
            //console.log(dataa);
            ko.utils.arrayForEach(dataa, function (item) {
                    self.countryList.push(item);
                })
        });
    });
    self.provinceList = ko.observableArray();
    self.selectedCountry = function () {
        var itemLength = self.provinceList().length;
        if (itemLength !== 0) {
            for (var i = itemLength; i > 0; i--) {
                self.provinceList.pop();
            }
        }
        var val = self.Person().selectedCountryName().id;
        $.getJSON("/api/Customer/GetProvince/" + val, function (data) {
            dataa = JSON.parse(data);
            //console.log(dataa);
            ko.utils.arrayForEach(dataa, function (item) {
                self.provinceList.push(item);
            });
        });
    };
    self.cityList = ko.observableArray();
    self.selectedProvince = function () {
        var itemLength = self.cityList().length;
        if (itemLength !== 0) {
            for (var i = itemLength; i > 0; i--) {
                self.cityList.pop();
            }
        }
        var val = self.Person().selectedProvinceName().id;
        $.getJSON("/api/Customer/GetCities/" + val, function (data) {
            dataa = JSON.parse(data);
            //console.log(dataa);
            ko.utils.arrayForEach(dataa, function (item) {
                self.cityList.push(item);
            });
        });
    };

    self.submitBtn = function () {
        console.log(self);
        console.log(self.Person(), self.Person.fname);
        $.ajax({
            type: "Post",
            data: JSON.parse(ko.toJSON(self.Person())),
            dataType: "json",
            url: "/api/Customer/PostPerson",
            success: function (response) {
                if (response !== null) {
                    console.log(response);
                    alert("Success : " + response);
                    resetForm();
                    //window.location.href = "../View/CompanyRegistration.aspx";
                }
                else {
                    alert("Something Went Wrong : ");
                }
            },
            failure: function (response) {
                alert("Failure : " + response.responseText);
            },
            error: function (response) {
                console.log(response);
                alert("Error : " + response.responseText);
            }
        });
    };
    self.resetBtn = function () {
        resetForm();
        //window.location.href = "../View/CompanyRegistration.aspx";
    };
}

// Model
function CRModel() {
    var self = this;
    self.fname = ko.observable();
    self.lname = ko.observable();
    self.email = ko.observable();
    self.phone = ko.observable();
    self.birth = ko.observable();
    self.gender = ko.observable("Male");

    self.selectedCountryName = ko.observable();
    self.country = ko.computed(function () {
        return self.selectedCountryName() && self.selectedCountryName().name;
    });
    self.selectedProvinceName = ko.observable();
    self.province = ko.computed(function () {
        return self.selectedProvinceName() && self.selectedProvinceName().name;
    });
    self.selectedCity = ko.observable();
    self.city = ko.computed(function () {
        return self.selectedCity() && self.selectedCity().name;
    });
    self.address = ko.observable();

}


function resetForm() {
    $("#form1").trigger('reset');
    $("#male").prop("checked", true);
}
