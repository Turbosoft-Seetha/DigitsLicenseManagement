using DigitsLicenseManagement;
using Microsoft.AspNetCore.Mvc;
using MVC_API.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Org.BouncyCastle.Asn1.Ocsp;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Net;
using System.Text;
using System.Web.Http;
using System.Web.UI;
using HttpPostAttribute = System.Web.Http.HttpPostAttribute;
using RouteAttribute = System.Web.Http.RouteAttribute;

namespace DigitsTracker.API
{
    public class LicenseController : ApiController
    {
        DataModels dm = new DataModels();
        string JSONString = string.Empty;

        [HttpPost]
        [Route("API/License/GetLicenseDetails")]
        [Consumes("multipart/form-data")]
        public IHttpActionResult GetLicenseDetails([FromForm] LicenseIn inputParams)
        {
            dm.TraceService("GetLicenseDetails STARTED");
            dm.TraceService("====================");

            ResponseOut odDetail = new ResponseOut();

            try
            {
                string LicenseKey = inputParams.LicenseKey == null ? "0" : inputParams.LicenseKey;
                string RouteCount = inputParams.RouteCount == null ? "0" : inputParams.RouteCount;
                string InventoryUserCount = inputParams.InventoryUserCount == null ? "0" : inputParams.InventoryUserCount;
                string BackOfficeUserCount = inputParams.BackOfficeUserCount == null ? "0" : inputParams.BackOfficeUserCount;
                string CustomerConnectUserCount = inputParams.CustomerConnectUserCount == null ? "0" : inputParams.CustomerConnectUserCount;
                string SFA_AppUserCount = inputParams.SFA_AppUserCount == null ? "0" : inputParams.SFA_AppUserCount;
                string Platform = inputParams.Platform == null ? "0" : inputParams.Platform;
                string IsStatusChange = inputParams.IsStatusChange == null ? "0" : inputParams.IsStatusChange;

                dm.TraceService("LicenseKey - " + inputParams.LicenseKey);
                dm.TraceService("RouteCount - " + inputParams.RouteCount);
                dm.TraceService("InventoryUserCount - " + inputParams.InventoryUserCount);
                dm.TraceService("BackOfficeUserCount - " + inputParams.BackOfficeUserCount);
                dm.TraceService("CustomerConnectUserCount - " + inputParams.CustomerConnectUserCount);
                dm.TraceService("SFA_AppUserCount - " + inputParams.SFA_AppUserCount);


                DataTable dt = dm.loadList("SelLicenseDetail", "sp_LicenseAPI", LicenseKey.ToString());
                List<LicenseOut> listItems = new List<LicenseOut>();

                if (dt.Rows.Count > 0)
                {
                    odDetail.Res = "200";
                    odDetail.Message = "Success";

                    foreach (DataRow dr in dt.Rows)
                    {
                        listItems.Add(new LicenseOut
                        {
                            ID = dr["ID"].ToString(),
                            LicenseNumber = dr["pke_LicenseNumber"].ToString(),
                            LicenseKey = dr["pke_LicenseKey"].ToString(),
                            LicenseType = dr["pke_LicenseType"].ToString(),
                            ProjectCode = dr["prj_Code"].ToString(),
                            ProjectName = dr["prj_Name"].ToString(),
                            CustomerCode = dr["cus_Code"].ToString(),
                            CustomerName = dr["cus_Name"].ToString(),
                            CreatedDate = dr["CreatedDate"].ToString(),
                            StartDate = dr["StartDate"].ToString(),
                            ExpiryDate = dr["ExpiryDate"].ToString(),
                            BufferPeriodInDays = dr["BufferPeriodInDays"].ToString(),
                            NeedExpiryNotification = dr["NeedExpiryNotification"].ToString(),
                            Prior_Exp_Notfctn_Intrvl_InDays = dr["Prior_Exp_Notfctn_Intrvl_InDays"].ToString(),
                            ModifiedDate = dr["ModifiedDate"].ToString(),
                            Status = dr["Status"].ToString(),
                            ContactPerson = dr["cus_ContactPerson"].ToString(),
                            ContactNumber = dr["cus_ContactNumber"].ToString(),
                            Email = dr["cus_Email"].ToString(),
                            UserLimit = dr["UserLimit"].ToString(),
                            CusConnectLimit = dr["CusConnectLimit"].ToString(),
                            InvLimit = dr["InvLimit"].ToString(),
                            BOLimit = dr["BOLimit"].ToString(),

                        });
                    }


                    int RotBal = Int32.Parse(listItems[0].UserLimit.ToString()) - Int32.Parse(RouteCount.ToString());
                    int InvBal = Int32.Parse(listItems[0].InvLimit.ToString()) - Int32.Parse(InventoryUserCount.ToString());
                    int CCBal = Int32.Parse(listItems[0].CusConnectLimit.ToString()) - Int32.Parse(CustomerConnectUserCount.ToString());
                    int BOBal = Int32.Parse(listItems[0].BOLimit.ToString()) - Int32.Parse(BackOfficeUserCount.ToString());

                    DateTime ExpiryDate = DateTime.Parse(listItems[0].ExpiryDate);
                    string Status = listItems[0].Status;

                    if (ExpiryDate < DateTime.Now) // Check if the expiry date is in the past
                    {
                        int BufferDays = Int32.Parse(listItems[0].BufferPeriodInDays);

                        if (ExpiryDate.AddDays(BufferDays) < DateTime.Now)
                        {
                            odDetail.AlertMessage = "Your license has expired on " + listItems[0].ExpiryDate + ". Please contact the DigiTS team to renew your license.";
                        }
                        else
                        {
                            odDetail.AlertMessage = "Your license has expired on " + listItems[0].ExpiryDate + ". You have a buffer period of " + listItems[0].BufferPeriodInDays + " days, after which the license will be cancelled. Please contact the DigiTS team to renew your license.";
                        }

                        odDetail.ResponseMessage = "Your license has expired on " + listItems[0].ExpiryDate + ". Please contact the DigiTS team to renew your license.";
                       
                    }
                    else if (Status == "Cancelled")
                    {
                        odDetail.ResponseMessage = "Your license has Cancelled. Please contact the DigiTS team to activate your license.";
                        odDetail.AlertMessage = "Your license has Cancelled. Please contact the DigiTS team to activate your license.";
                    }
                    else
                    {
                        if (Platform == "USER")
                        {
                            string UserLimit = listItems[0].UserLimit;
                            int AppUserBal = Int32.Parse(UserLimit.ToString()) - Int32.Parse(RouteCount.ToString());
                            if (AppUserBal <= 0)
                            {
                                if (IsStatusChange == "Y")
                                {
                                    odDetail.ResponseMessage = "You cannot make this Route as active due to license limitations.";
                                }
                                else
                                {
                                    odDetail.ResponseMessage = "Route Limit Exceeded, Kindly contact DigiTS team to increase the route limit.";
                                }
                            }
                            else
                            {
                                odDetail.ResponseMessage = "Proceed";
                            }
                        }
                        else if (Platform == "INV")
                        {
                            string InvLimit = listItems[0].InvLimit;
                            int InvUserBal = Int32.Parse(InvLimit.ToString()) - Int32.Parse(InventoryUserCount.ToString());
                            if (InvUserBal <= 0)
                            {
                                if (IsStatusChange == "Y")
                                {
                                    odDetail.ResponseMessage = "You cannot make this user as active due to license limitations.";
                                }
                                else
                                {
                                    odDetail.ResponseMessage = "Inventory User Limit Exceeded, Kindly contact DigiTS team to increase the user limit.";
                                }
                            }
                            else
                            {
                                odDetail.ResponseMessage = "Proceed";
                            }
                        }
                        else if (Platform == "BO")
                        {
                            string BOLimit = listItems[0].BOLimit;
                            int BOUserBal = Int32.Parse(BOLimit.ToString()) - Int32.Parse(BackOfficeUserCount.ToString());
                            if (BOUserBal <= 0)
                            {
                                if (IsStatusChange == "Y")
                                {
                                    odDetail.ResponseMessage = "You cannot make this user as active due to license limitations.";
                                }
                                else
                                {
                                    odDetail.ResponseMessage = "Backend User Limit Exceeded, Kindly contact DigiTS team to increase the user limit.";
                                }
                            }
                            else
                            {
                                odDetail.ResponseMessage = "Proceed";
                            }
                        }
                        else if (Platform == "CC")
                        {
                            string CusConnectLimit = listItems[0].CusConnectLimit;
                            int CCUserBal = Int32.Parse(CusConnectLimit.ToString()) - Int32.Parse(CustomerConnectUserCount.ToString());
                            if (CCUserBal <= 0)
                            {
                                if (IsStatusChange == "Y")
                                {
                                    odDetail.ResponseMessage = "You cannot make this user as active due to license limitations.";
                                }
                                else
                                {
                                    odDetail.ResponseMessage = "Customer Connect User Limit Exceeded, Kindly contact DigiTS team to increase the user limit.";
                                }
                            }
                            else
                            {
                                odDetail.ResponseMessage = "Proceed";
                            }
                        }
                        else
                        {
                            odDetail.ResponseMessage = "Proceed";

                            if (RotBal < 0 || InvBal < 0 || CCBal < 0 || BOBal < 0)
                            {
                                if (listItems[0].NeedExpiryNotification == "Yes")
                                {
                                    int PriorExpNotiDay = Int32.Parse(listItems[0].Prior_Exp_Notfctn_Intrvl_InDays);

                                    if (ExpiryDate.AddDays(-PriorExpNotiDay) <= DateTime.Now)
                                    {
                                        odDetail.AlertMessage = "Your licence will expire on " + listItems[0].ExpiryDate + ".You have a buffer period of " + listItems[0].BufferPeriodInDays + " days, after which the licence will be cancelled.You have exceeded the limit, If no action is taken within the next 15 days, you may experience disruptions in accessing the application..Please contact the DigiTS team to renew your licence.";
                                    }
                                    else
                                    {
                                        odDetail.AlertMessage = "According to the DigiTS licensing policy, you have exceeded the limit. If no action is taken within the next 15 days, you may experience disruptions in accessing the application.";
                                    }
                                }
                                else
                                {
                                    odDetail.AlertMessage = "According to the DigiTS licensing policy, you have exceeded the limit. If no action is taken within the next 15 days, you may experience disruptions in accessing the application.";
                                }
                            }
                            else
                            {
                                if (listItems[0].NeedExpiryNotification == "Yes")
                                {
                                    int PriorExpNotiDay = Int32.Parse(listItems[0].Prior_Exp_Notfctn_Intrvl_InDays);

                                    if (ExpiryDate.AddDays(-PriorExpNotiDay) <= DateTime.Now)
                                    {
                                        odDetail.AlertMessage = "Your license will expire on " + listItems[0].ExpiryDate + ". You have a buffer period of " + listItems[0].BufferPeriodInDays + " days, after which the license will be cancelled. Please contact the DigiTS team to renew your license.";
                                    }
                                    else
                                    {
                                        odDetail.AlertMessage = "";
                                    }
                                }
                                else
                                {
                                    odDetail.AlertMessage = "";
                                }
                            }
                        }
                    }

                    odDetail.LicenseData = listItems;

                    var result = new { result = new List<ResponseOut> { odDetail } };

                    return Ok(result);
                }
                else
                {
                    listItems.Add(new LicenseOut
                    {
                        ID = "",
                        LicenseNumber = "",
                        LicenseKey = "",
                        LicenseType = "",
                        ProjectCode = "",
                        ProjectName = "",
                        CustomerCode = "",
                        CustomerName = "",
                        CreatedDate = "",
                        StartDate = "",
                        ExpiryDate = "",
                        BufferPeriodInDays = "",
                        NeedExpiryNotification = "",
                        Prior_Exp_Notfctn_Intrvl_InDays = "",
                        ModifiedDate = "",
                        Status = "",
                        ContactPerson = "",
                        ContactNumber = "",
                        Email = "",
                        UserLimit = "",
                        CusConnectLimit = "",
                        InvLimit = "",
                        BOLimit = "",
                    });

                    odDetail.Res = "500";
                    odDetail.Message = "Failure";
                    odDetail.ResponseMessage = "Something went wrong please try again later.";
                    odDetail.AlertMessage = "Something went wrong please try again later.";
                    odDetail.LicenseData = listItems;

                    var result = new { result = new List<ResponseOut> { odDetail } };

                    return Ok(result);
                }
            }
            catch (Exception ex)
            {
                dm.TraceService("GetLicenseDetails Exception - " + ex.Message.ToString());
                return InternalServerError(ex);
            }
            finally
            {
                dm.TraceService("GetLicenseDetails ENDED");
                dm.TraceService("==================");
            }
        }

        public class ResponseOut
        {
            public string Res { get; set; }
            public string Message { get; set; }
            public string ResponseMessage { get; set; }
            public string AlertMessage { get; set; }

            public List<LicenseOut> LicenseData { get; set; }
        }

        public class LicenseIn
        {
            public string LicenseKey { get; set; }
            public string RouteCount { get; set; }
            public string InventoryUserCount { get; set; }
            public string BackOfficeUserCount { get; set; }
            public string CustomerConnectUserCount { get; set; }
            public string SFA_AppUserCount { get; set; }
            public string Platform { get; set; }
            public string IsStatusChange { get; set; }
        }

        public class LicenseOut
        {
            public string ID { get; set; }
            public string LicenseNumber { get; set; }
            public string LicenseKey { get; set; }
            public string LicenseType { get; set; }
            public string ProjectCode { get; set; }
            public string ProjectName { get; set; }
            public string CustomerCode { get; set; }
            public string CustomerName { get; set; }
            public string CreatedDate { get; set; }
            public string StartDate { get; set; }
            public string ExpiryDate { get; set; }
            public string BufferPeriodInDays { get; set; }
            public string NeedExpiryNotification { get; set; }
            public string Prior_Exp_Notfctn_Intrvl_InDays { get; set; }
            public string ModifiedDate { get; set; }
            public string Status { get; set; }
            public string ContactPerson { get; set; }
            public string ContactNumber { get; set; }
            public string Email { get; set; }
            public string UserLimit { get; set; }
            public string CusConnectLimit { get; set; }
            public string InvLimit { get; set; }
            public string BOLimit { get; set; }
        }


        // Get the Projects consumed License counts , and update that data into License db starts here

        [HttpPost]
        [Route("API/License/UpdateLicenseInfo")]
        [Consumes("multipart/form-data")]
        public IHttpActionResult UpdateLicenseInfo([FromForm] UpdateLicenseIn inputParams)
        {
            dm.TraceService("UpdateLicenseInfo STARTED");
            dm.TraceService("====================");


            try
            {
                string LicenseKey = inputParams.LicenseKey == null ? "0" : inputParams.LicenseKey;
                string RouteCount = inputParams.RouteCount == null ? "0" : inputParams.RouteCount;
                string InventoryUserCount = inputParams.InventoryUserCount == null ? "0" : inputParams.InventoryUserCount;
                string BackOfficeUserCount = inputParams.BackOfficeUserCount == null ? "0" : inputParams.BackOfficeUserCount;
                string CustomerConnectUserCount = inputParams.CustomerConnectUserCount == null ? "0" : inputParams.CustomerConnectUserCount;
                string SFA_AppUserCount = inputParams.SFA_AppUserCount == null ? "0" : inputParams.SFA_AppUserCount;

                dm.TraceService("LicenseKey - " + inputParams.LicenseKey);
                dm.TraceService("RouteCount - " + inputParams.RouteCount);
                dm.TraceService("InventoryUserCount - " + inputParams.InventoryUserCount);
                dm.TraceService("BackOfficeUserCount - " + inputParams.BackOfficeUserCount);
                dm.TraceService("CustomerConnectUserCount - " + inputParams.CustomerConnectUserCount);
                dm.TraceService("SFA_AppUserCount - " + inputParams.SFA_AppUserCount);

                string[] arr = { RouteCount, InventoryUserCount, BackOfficeUserCount, CustomerConnectUserCount, SFA_AppUserCount };
                DataTable dt = dm.loadList("UpdateLicenseDetail", "sp_LicenseAPI", LicenseKey.ToString(), arr);

                List<UpdateLicenseOut> listItems = new List<UpdateLicenseOut>();

                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        listItems.Add(new UpdateLicenseOut
                        {
                            Res = dr["Res"].ToString(),
                            Title = dr["Title"].ToString(),
                            Descr = dr["Descr"].ToString(),


                        });
                    }

                    var result = new
                    {
                        result = listItems
                    };

                    return Ok(result);
                }
                else
                {
                    listItems.Add(new UpdateLicenseOut
                    {
                        Res = "500",
                        Title = "Failure",
                        Descr = "datatable returns null or nodata",
                    });

                    var result = new
                    {
                        result = listItems
                    };

                    return Ok(result);
                }
            }
            catch (Exception ex)
            {
                dm.TraceService("UpdateLicenseInfo Exception - " + ex.Message.ToString());
                return InternalServerError(ex);
            }
            finally
            {
                dm.TraceService("UpdateLicenseInfo ENDED");
                dm.TraceService("==================");
            }
        }

        public class UpdateLicenseIn
        {
            public string LicenseKey { get; set; }
            public string RouteCount { get; set; }
            public string InventoryUserCount { get; set; }
            public string BackOfficeUserCount { get; set; }
            public string CustomerConnectUserCount { get; set; }
            public string SFA_AppUserCount { get; set; }

        }
        public class UpdateLicenseOut
        {
            public string Res { get; set; }
            public string Title { get; set; }
            public string Descr { get; set; }

        }


    }
}
