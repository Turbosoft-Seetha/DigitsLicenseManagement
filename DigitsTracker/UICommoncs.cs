using Ecosoft.DAL;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace DigitsLicenseManagement
{
    public class UICommon
    {
        public static string GetLogFileNameFromRoot()
        {
            return System.Web.HttpContext.Current.Server.MapPath(@"LogFile\" + DateTime.Now.ToString("yyyyMMdd") + ".txt").ToString();
        }
        public static string GetErrorMessage(string message)
        {
            return string.Format("<div class='alert alert-error bg-warning'><button class='close' data-dismiss='alert'></button>{0}</div>", message);
        }
        public static string GetLogFileName()
        {
            return System.Web.HttpContext.Current.Server.MapPath(@"LogFile\" + DateTime.Now.ToString("yyyyMMdd") + ".txt").ToString();
        }
        public static string GetSucessMessage(string message)
        {
            return string.Format("<div class='alert alert-sucess'><button class='close' data-dismiss='alert'></button>{0}</div>", message);
        }

        public static string GetThumbnail(string imageName)
        {
            return string.Concat(Path.GetDirectoryName(imageName), "/Thumbnails/", Path.GetFileName(imageName)).Replace("\\", "/");
        }

        public static void CreateThumbnail(string imageUrl, int width, int height)
        {
            string saveDirectory = string.Concat(Path.GetDirectoryName(imageUrl), "\\Thumbnails");
            string newFileName = string.Concat(saveDirectory, "\\", Path.GetFileName(imageUrl));

            if (!Directory.Exists(saveDirectory))
            {
                Directory.CreateDirectory(saveDirectory);
            }

            System.Drawing.Image originalImage = System.Drawing.Image.FromFile(imageUrl);
            System.Drawing.Image thumbnail = new Bitmap(width, height);

            using (Graphics graphicsHandle = Graphics.FromImage(thumbnail))
            {
                graphicsHandle.InterpolationMode = InterpolationMode.High;
                graphicsHandle.DrawImage(originalImage, 0, 0, width, height);
            }

            var ms = new MemoryStream();

            thumbnail.Save(ms, GetImageFormat(newFileName));

            using (var fileStream = new FileStream(newFileName, FileMode.OpenOrCreate))
            {
                byte[] thumnailBytes = ms.GetBuffer();

                fileStream.Write(thumnailBytes, 0, thumnailBytes.Length);
            }
        }

        public static System.Drawing.Imaging.ImageFormat GetImageFormat(string fileName)
        {
            var ext = Path.GetExtension(fileName).ToLower();

            switch (ext)
            {
                case ".jpg":
                case ".jpeg":
                    return System.Drawing.Imaging.ImageFormat.Jpeg;

                case ".gif":
                    return System.Drawing.Imaging.ImageFormat.Gif;

                case ".bmp":
                    return System.Drawing.Imaging.ImageFormat.Bmp;
            }

            return System.Drawing.Imaging.ImageFormat.Png;
        }

        public static void SendEmail(string to, string subject, string from, string body)
        {
            System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage();
            
            message.To.Add(to);
            message.Subject = subject;
            message.From = new System.Net.Mail.MailAddress(from);
            message.Body = body;
            
            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient();
            smtp.Send(message);
        }

        public static void LogException(Exception ex, string Page)
        {
            HttpContext.Current.Response.Write(ex.ToString());
        }

        public static void SelectDropDownValue(DropDownList ddl, string value)
        {
            if (string.IsNullOrEmpty(value))
            {
                return;
            }

            ListItem item = ddl.Items.FindByValue(value);

            if (item != null)
            {
                ddl.SelectedValue = value;
            }
        }

        public static Bitmap ResizeImage(System.Drawing.Image image, int maxWidth, int maxHeight)
        {
            var ratioX = (double)maxWidth / image.Width;
            var ratioY = (double)maxHeight / image.Height;

            var ratio = Math.Min(ratioX, ratioY);

            var newWidth = (int)(image.Width * ratio);
            var newHeight = (int)(image.Height * ratio);

            var newImage = new Bitmap(newWidth, newHeight);

            Graphics.FromImage(newImage).DrawImage(image, 0, 0, newWidth, newHeight);
            Bitmap bmp = new Bitmap(newImage);

            return bmp;
        }

        public static void DeleteFile(string fileName)
        {
            if (string.IsNullOrEmpty(fileName))
            {
                return;
            }

            if (File.Exists(fileName))
            {
                File.Delete(fileName);
            }
        }


         public static int GetCurrentUserID()
        {
            try
            {
                if (HttpContext.Current.Session["UserID"] == null)
                {
                    HttpContext.Current.Session["UserID"] = DALHelper.GetUsers(userCriteria => userCriteria.UserName.ToLower() == HttpContext.Current.User.Identity.Name.ToLower()).First().ID;
                }

               
            }
            catch (Exception ex)
            {
             
            }
            return int.Parse(HttpContext.Current.Session["UserID"].ToString());
        }

        public static string RandomString()
        {
            var chars = "0123456789";
            var stringChars = new char[3];
            var random = new Random();

            for (int i = 0; i < stringChars.Length; i++)
            {
                stringChars[i] = chars[random.Next(chars.Length)];
            }

            return new String(stringChars);
        }
    }
}