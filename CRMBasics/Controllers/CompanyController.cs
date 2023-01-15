using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Web.Script.Serialization;
using CRMBasics.Models;

namespace CustomerRelationBasics.Controllers
{
    public class CompanyController : ApiController
    {
        //-------------------------------------------------------------------------//
        //----------------------- Post Company Record     << /api/Company/PostCompanyRecord

        [HttpPost]
        public IHttpActionResult PostCompanyRecord(Company company)
        {
            try
            {
                using (CRMTestingContext context = new CRMTestingContext())
                {
                    var emailExist = context.CRMCompanies.Where(c => c.email.Equals(company.email)).ToList();
                    if (emailExist.Count() != 0)
                    {
                        return Ok("Email Already Exist ");
                    }

                    var compny = new CRMCompany();
                    compny.name = company.name;
                    compny.email = company.email;
                    compny.phone = company.phone;
                    compny.registration = company.registration;
                    compny.noEmp = company.employees;
                    compny.companyType = company.typeCmpny;
                    
                foreach (var item in company.services)
                {
                    if (item == "Telecom")
                    {
                        compny.serviceOne = "Telecom";
                    }
                    if (item == "Business")
                    {
                        compny.serviceTwo = "Business";
                    }
                    if (item == "Banking")
                    {
                        compny.serviceThree = "Banking";
                    }
                }
                
                    compny.country = company.country;
                    compny.province = company.province;
                    compny.city = company.city;
                    compny.address = company.address;

                    context.CRMCompanies.Add(compny);
                    int count = context.SaveChanges();
                    if (count >= 1)
                    {
                        return Ok("Record has been saved successfully : .");
                    }
                }
            }
            catch (Exception)
            {
                return NotFound();
            }
            return Ok("Something went Wrong ... ");
        }

        //-------------------------------------------------------------------------//
        //----------------------- Get All Company Records     << /api/Company/GetCompanyRecords

        [HttpGet]
        public IHttpActionResult GetCompanyRecords()
        {
            List<Company> companyList = new List<Company>();
            try
            {
                using (CRMTestingContext context = new CRMTestingContext())
                {
                    var company = context.CRMCompanies.ToList();
                    var count = 1;
                    foreach (var item in company)
                    {
                        try
                        {
                            Company companys = new Company()
                            {
                                id = count,
                                name = item.name,
                                email = item.email,
                                phone = item.phone,
                                registDate = Convert.ToDateTime(item.registration).ToString("MMMM dd yyyy"),
                                employees = Convert.ToInt32(item.noEmp),
                                typeCmpny = item.companyType,
                                servics = item.serviceOne + "-" + item.serviceTwo + "-" + item.serviceThree,
                                address = item.country + "-" + item.province + "-" + item.city // + " " + item.address
                            };
                            companyList.Add(companys);
                            count++;
                        }
                        catch (Exception)
                        {
                            return Ok("Record Not Identify : ");
                        }
                    }
                }
            }
            catch (Exception)
            {
                return NotFound();
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            return Ok(js.Serialize(companyList));
        }
    }
}

public class Company: RegistrationDate
{
    public int id { get; set; }

    public string name { get; set; }

    public string email { get; set; }

    public string phone { get; set; }

    public DateTime registration { get; set; }

    public int employees { get; set; }

    public string typeCmpny { get; set; }

    //private Object _services;

    //public Object services
    //{
    //    get { return _services; }
    //    set { _services = value; }
    //}

    //private string _telecom;

    //public string telecom
    //{
    //    get { return _telecom; }
    //    set { _telecom = value; }
    //}

    //private string _business;

    //public string business
    //{
    //    get { return _business; }
    //    set { _business = value; }
    //}

    //private string _banking;

    //public string banking
    //{
    //    get { return _banking; }
    //    set { _banking = value; }
    //}

    public string country { get; set; }

    public string province { get; set; }

    public string city { get; set; }

    public string address { get; set; }

    public string[] services { get; set; }
}

public class RegistrationDate
{
    public string registDate { get; set; }

    public string servics { get; set; }
}