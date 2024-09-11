using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;



namespace DigitsLicenseManagement.BO_Digits
{
    public class General
    {
        public SqlConnection FunMyCon(ref SqlConnection _Conn)
        {
            string _ConStr = null;


            if (_Conn == null)
            {
                _ConStr = ConfigurationManager.AppSettings.Get("MyDB");
                _Conn = new SqlConnection(_ConStr);
                _Conn.Open();

            }
            else
            {
                if (_Conn.State == ConnectionState.Closed)
                {
                    _ConStr = ConfigurationManager.AppSettings.Get("MyDB");
                    _Conn = new SqlConnection(_ConStr);
                    _Conn.Open();
                }
            }
            return _Conn;
        }

        public static SqlConnection FunMyCon_Static(ref SqlConnection _Conn)
        {
            string _ConStr = null;


            if (_Conn == null)
            {
                _ConStr = ConfigurationManager.AppSettings.Get("MyDB");
                _Conn = new SqlConnection(_ConStr);
                _Conn.Open();

            }
            else
            {
                if (_Conn.State == ConnectionState.Closed)
                {
                    _ConStr = ConfigurationManager.AppSettings.Get("MyDB");
                    _Conn = new SqlConnection(_ConStr);
                    _Conn.Open();
                }

            }
            return _Conn;
        }

    }
}