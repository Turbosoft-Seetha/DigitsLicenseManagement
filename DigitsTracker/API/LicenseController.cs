using Microsoft.AspNetCore.Mvc;
using MVC_API.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.Http;
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

                dm.TraceService("GetLicenseDetails LicenseKey - " + inputParams.LicenseKey);

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
            public List<LicenseOut> LicenseData { get; set; }
        }

        public class LicenseIn
        {
            public string LicenseKey { get; set; }
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
    }
}
