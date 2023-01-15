
var vm = new ViewModel();
$(document).ready(function () {
    vm.customers.push(new Customer(null));
    ko.applyBindings(vm);

    $("#tableCustomerWarning").hide();
    $("#tableinfo").show();
});

//viewModel

function ViewModel() {
    var self = this;
    self.customers = ko.observableArray([]);
      $.ajax({
          url: '/api/Customer/GetAllCustomer',
          dataType: "json",
          method: 'Get',
          success: function (data) {
              dataa = JSON.parse(data);
              console.log(dataa);
              if (dataa.length === 0) {
                  $("#tableCustomerWarning").show();
                  $("#tableinfo").hide();
              }
              else{
                  ko.utils.arrayForEach(dataa, function (item) {
                      console.log(item.id, item.fname, item.email, item.phone, item.address);
                      vm.customers.push(new Customer(item));
                  });
              }
          }
      });
}

//Model
function Customer(Cdata) {
    var self = this;
    if (Cdata !== null) {
        self.Id = ko.observable(Cdata.id);
        self.Name = ko.observable(Cdata.fname);
        self.Email = ko.observable(Cdata.email);
        self.Mobile = ko.observable(Cdata.phone);
        self.Birth = ko.observable(Cdata.Birthdate);
        self.Gender = ko.observable(Cdata.gender);
        self.Address = ko.observable(Cdata.address);
    }
    else {
        self.Id = ko.observable("");
        self.Name = ko.observable("");
        self.Email = ko.observable("");
        self.Mobile = ko.observable("");
        self.Birth = ko.observable("");
        self.Gender = ko.observable("");
        self.Address = ko.observable("");
    }

}

