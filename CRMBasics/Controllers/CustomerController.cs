using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Web.Script.Serialization;
using CRMBasics.Models;

namespace CustomerRelationBasics.Controllers
{
    public class CustomerController : ApiController
    {
        //-------------------------------------------------------------------------//
        //----------------------- Get All Countries << /api/Customer/GetAllCountries

        [HttpGet]
        public IHttpActionResult GetAllCountries()
        {
            List<Adresses> countryList = new List<Adresses>();
            using (CRMTestingContext context = new CRMTestingContext())
            {
                var countries = context.Countries.ToList();
                foreach (var item in countries)
                {
                    try
                    {
                        Adresses address = new Adresses()
                        {
                            id = item.id,
                            name = item.name,
                        };
                        countryList.Add(address);
                    }

                    catch (Exception)
                    {
                        return NotFound();
                    }
                }
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            return Ok(js.Serialize(countryList));
        }


        //-------------------------------------------------------------------------//
        //----------------------- Get All Province against Country  << /api/Customer/GetProvince/id

        [HttpGet]
        public IHttpActionResult GetProvince(int id)
        {
            List<Adresses> countryList = new List<Adresses>();
            using (CRMTestingContext context = new CRMTestingContext())
            {
                var province = context.Provinces.Where(p => p.C_id == id).ToList();
                //Select(p => new { p.Cities });

                //var province = Context.Provinces.Where(p => p.country_id.Equals(1)).ToList();
                foreach (var item in province)
                {
                    try
                    {
                        Adresses address = new Adresses()
                        {
                            name = item.p_name,
                            id = item.id
                        };
                        countryList.Add(address);
                    }

                    catch (Exception)
                    {
                        return NotFound();
                    }
                }

            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            return Ok(js.Serialize(countryList));
        }

        //-------------------------------------------------------------------------//
        //----------------------- Get All City against Province << /api/Customer/GetCities/id

        [HttpGet]
        public IHttpActionResult GetCities(int id)
        {
            List<Adresses> countryList = new List<Adresses>();
            using (CRMTestingContext context = new CRMTestingContext())
            {
                var Cities = context.Cities.Where(c => c.p_id == id).ToList();

                //Select(p => new { p.Cities });

                //var province = Context.Provinces.Where(p => p.country_id.Equals(1)).ToList();
                foreach (var item in Cities)
                {
                    try
                    {
                        Adresses address = new Adresses()
                        {
                            name = item.c_name,
                            id = item.id
                        };
                        countryList.Add(address);
                    }

                    catch (Exception)
                    {
                        return NotFound();
                    }
                }
            }

            JavaScriptSerializer js = new JavaScriptSerializer();
            return Ok(js.Serialize(countryList));
        }


        //-------------------------------------------------------------------------//
        //----------------------- Post a Person Record     << /api/Customer/PostPerson

        [HttpPost]
        public IHttpActionResult PostPerson(Person Person)
        {
            try
            {
                if (Person != null)
                {
                    using (CRMTestingContext context = new CRMTestingContext())
                    {
                        var emailExist = context.CRMPersons.Where(c => c.email.Equals(Person.email)).ToList();
                        if (emailExist.Count() != 0)
                        {
                            return Ok("Email Already Exist ");
                        }

                        var customer = new CRMPerson();
                        customer.fname = Person.fname;
                        customer.lname = Person.lname;
                        customer.email = Person.email;
                        customer.phone = Person.phone;
                        customer.birth = Person.birth;
                        customer.gender = Person.gender;
                        customer.country = Person.country;
                        customer.province = Person.province;
                        customer.city = Person.city;
                        customer.address = Person.address;

                        context.CRMPersons.Add(customer);
                        int success = context.SaveChanges();
                        if (success >= 0)
                        {
                            return Ok(Person.fname + " Data save Successfully : ");
                        }
                    }
                }
            }
            catch (Exception)
            {
                return Ok("Record Inserted Failedd !!!! .. ");
            }

            return Ok("Hmmmm ");
        }


        //-------------------------------------------------------------------------//
        //----------------------- Get All Person Record     << /api/Customer/getAllCustomer

        [HttpGet]
        public IHttpActionResult GetAllCustomer()
        {
            List<Person> customerList = new List<Person>();
            try
            {
                using (CRMTestingContext context = new CRMTestingContext())
                {
                    var customer = context.CRMPersons.ToList();
                    foreach (var item in customer)
                    {
                        try
                        {
                            Person person = new Person()
                            {
                                id = item.id,
                                fname = item.fname + " " + item.lname,
                                email = item.email,
                                phone = item.phone,
                                Birthdate = Convert.ToDateTime(item.birth).ToString("MMMM dd yyyy"),
                                birth = Convert.ToDateTime(item.birth),
                                gender = item.gender,
                                address = item.country + " " + item.province + " " + item.city // + " " + item.address
                            };
                            customerList.Add(person);
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
            return Ok(js.Serialize(customerList));
        }


        //-------------------------------------------------------------------------//
        //----------------------- Get All Customer ID's     << /api/Customer/GetAllCustomerIds

        [HttpGet]
        public IHttpActionResult GetAllCustomerIds()
        {
            //var person = new List<Person>();
            try
            {
                using (CRMTestingContext context = new CRMTestingContext())
                {
                    var customerIds = context.CRMPersons.Select(c => new {id = c.id}).ToList();
                    if (customerIds.Count() > 0)
                    {
                        JavaScriptSerializer js = new JavaScriptSerializer();
                        return Ok(js.Serialize(customerIds));
                    }
                    else
                    {
                        return Ok("No Record Found :");
                    }

                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return NotFound();
            }

        }

        //-------------------------------------------------------------------------//
        //----------------------- Get Specific Customer Record     << /api/Customer/GetaCustomerRecord/id

        [HttpGet]
        public IHttpActionResult GetaCustomerRecord(int id)
        {
            var customerList = new List<Person>();
            try
            {
                using (CRMTestingContext context = new CRMTestingContext())
                {
                    var customers = context.CRMPersons.Where(c => c.id.Equals(id)).FirstOrDefault();
                    if (customers != null)
                    {
                        Person customer = new Person()
                        {
                            id = customers.id,
                            fname = customers.fname,
                            lname = customers.lname,
                            address = customers.address,
                            Birthdate = Convert.ToDateTime(customers.birth).ToString("yyyy-MM-dd"),
                            city = customers.city,
                            email = customers.email,
                            country = customers.country,
                            province = customers.province,
                            gender = customers.gender,
                            birth = Convert.ToDateTime(customers.birth),
                            phone = customers.phone

                        };
                        customerList.Add(customer);
                    }
                    else
                    {
                        return Ok("No Record Found :");
                    }

                    JavaScriptSerializer js = new JavaScriptSerializer();
                    return Ok(js.Serialize(customerList));
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return NotFound();
            }
        }


        //-------------------------------------------------------------------------//
        //----------------------- Post Update Customer Record     << /api/Customer/UpdateCustomerRecord

        [HttpPut]
        public IHttpActionResult UpdateCustomerRecord(Person person)
        {
            try
            {
                using (CRMTestingContext context = new CRMTestingContext())
                {
                    var customer = context.CRMPersons.Single(c => c.id.Equals(person.id));
                    if (customer != null)
                    {
                        customer.fname = person.fname;
                        customer.lname = person.lname;
                        customer.email = person.email;
                        customer.phone = person.phone;
                        customer.birth = person.birth;
                        customer.gender = person.gender;
                        customer.country = person.city;
                        customer.province = person.province;
                        customer.city = person.city;
                        customer.address = person.address;

                        int count = context.SaveChanges();
                        if (count > 0)
                        {
                            return Ok("Record Update Successfully : ");
                        }
                        else
                        {
                            return Ok("You don't have done any changes !! ");
                        }
                    }
                    else
                    {
                        return NotFound();
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return Ok("Something Went Wrong .. ");
            }
        }


        //-------------------------------------------------------------------------//
        //----------------------- Post Update Customer Record     << /api/Customer/DeleteCustomerRecord/id

        [HttpDelete]
        public IHttpActionResult DeleteCustomerRecord(int id)
        {
            try
            {
                using (CRMTestingContext context = new CRMTestingContext())
                {
                    var customer = context.CRMPersons.FirstOrDefault(c => c.id == id);
                    if (customer != null)
                    {
                        context.CRMPersons.Remove(customer);
                        context.SaveChanges();
                        return Ok("Record Delete Successfully : ");
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                Console.WriteLine("Something Went Wrong .. ");
                return Ok("Record Not Deleted ... ");

            }

            return Ok("Alassss .. Something went Wrong ");
        }
    }
}


public class Adresses
{
    public int id { get; set; }

    public string name { get; set; }
}

public class Person : BirthDate
{
    public int id { get; set; }

    public string fname { get; set; }

    public string lname { get; set; }

    public string email { get; set; }

    public string phone { get; set; }

    public DateTime birth { get; set; }

    public string gender { get; set; }

    public string country { get; set; }

    public string province { get; set; }

    public string city { get; set; }

    public string address { get; set; }
}

public class BirthDate
{
    public string Birthdate { get; set; }
}