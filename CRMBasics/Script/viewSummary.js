
var viewModel = new ViewModel();
$(document).ready(function () {
    viewModel.summary.push(new Model(null));
    ko.applyBindings(viewModel);
    $("#tableSummaryWarning").hide();
    $("#tableInfo").show();
});

//viewModel

function ViewModel() {
    var self = this;
    self.summary = ko.observableArray([]);
    $.ajax({
        url: "/api/Summary/GetSummary",
        dataType: "json",
        method: "Get",
        success: function (data) {
            var dataa = JSON.parse(data);
            console.log(dataa);
            if (dataa.length === 0) {
                $("#tableSummaryWarning").show();
                $("#tableInfo").hide();
            }
            else {
                ko.utils.arrayForEach(dataa, function (item) {
                    console.log(item.No, item.Name, item.Email, item.Mobile, item.Address, item.Employees, item.Register);
                    viewModel.summary.push(new Model(item));
                });
            }
        }
    });
}

//Model
function Model(item) {
    var self = this;
    if (item !== null) {
        

        self.No = ko.observable(item.No);
        self.Name = ko.observable(item.Name);
        self.Email = ko.observable(item.Email);
        self.Mobile = ko.observable(item.Mobile);
        self.Register = ko.observable(item.Register);
        self.CType = ko.observable(item.Type);
        self.NoEmployee = ko.observable(item.Employees);
        self.Services = ko.observable(item.Services);
        self.Address = ko.observable(item.Address);
    }
    else {
        self.No = ko.observable("");
        self.Name = ko.observable("");
        self.Email = ko.observable("");
        self.Mobile = ko.observable("");
        self.Register = ko.observable("");
        self.CType = ko.observable("");
        self.NoEmployee = ko.observable("");
        self.Services = ko.observable("");
        self.Address = ko.observable("");
    }

}