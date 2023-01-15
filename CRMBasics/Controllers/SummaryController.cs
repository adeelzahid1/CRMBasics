using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Script.Serialization;
using CRMBasics.Models;

namespace CustomerRelationBasics.Controllers
{
    public class SummaryController : ApiController
    {
        // /api/Summary/GetSummary
        [HttpGet]
        public IHttpActionResult GetSummary()
        {
            try
            {
                using (CRMTestingContext context = new CRMTestingContext())
                {
                    var Smmry = context.CRMPersons.Join(context.CRMCompanies,
                        cus => cus.id,
                        com => com.c_id,
                        (customer, company) => new
                        {
                            No = customer.id,
                            Name = customer.fname + " " + customer.lname,
                            Email = customer.email,
                            Mobile = company.phone,
                            Register = company.registration.ToString(),
                            Type = company.companyType,
                            Employees = company.noEmp,
                            Services = company.serviceOne + "-" + company.serviceTwo + "-" + company.serviceThree,
                            Address = company.country + " " + company.province + " " + company.city
                        }
                    ).ToList();
                    JavaScriptSerializer js = new JavaScriptSerializer();
                    return Ok(js.Serialize(Smmry));
                }
            }
            catch (Exception e)
            {
                return Ok(e.ToString());
            }
        }
    }
}

//public class Summary
//{
//    public int No { get; set; }
//    public string Name { get; set; }
//    public string Gender { get; set; }
//    public string Birth { get; set; }
//    public string Email { get; set; }
//    public string CEmail { get; set; }
//    public string Type { get; set; }
//    public string Services { get; set; }
//    public string CAddress { get; set; }
//}