
var vm = new ViewModel();
$(document).ready(function () {
    vm.company.push(new Company(null));
    ko.applyBindings(vm);
    $("#tableCompanyWarning").hide();
    $("#tableinfo").show();
});

//viewModel

function ViewModel() {
    var self = this;
    self.company = ko.observableArray([]);
    $.ajax({
        url: '/api/Company/GetCompanyRecords',
        dataType: "json",
        method: 'Get',
        success: function (data) {
            dataa = JSON.parse(data);
            console.log(dataa);
            if (dataa.length == 0) {
                $("#tableCompanyWarning").show();
                $("#tableinfo").hide();
            }
            else {
                ko.utils.arrayForEach(dataa, function (item) {
                    console.log(item.id, item.name, item.email, item.phone, item.address, item.employees);
                    vm.company.push(new Company(item));
                });
            }
        }
    });
}

//Model
function Company(item) {
    var self = this;
    if (item !== null) {
        self.Id = ko.observable(item.id);
        self.Name = ko.observable(item.name);
        self.Email = ko.observable(item.email);
        self.Mobile = ko.observable(item.phone);
        self.Register = ko.observable(item.registDate);
        self.CType = ko.observable(item.typeCmpny);
        self.NoEmployee = ko.observable(item.employees);
        self.Services = ko.observable(item.servics);
        self.Address = ko.observable(item.address);
    }
    else {
        self.Id = ko.observable("");
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

