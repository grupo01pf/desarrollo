using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;

namespace CapaPresentacion
{
    public class Email
    {
        MailMessage m = new MailMessage();
        SmtpClient smtp = new SmtpClient();

        public bool enviarcorreo(string from,string password,string to,string msj)
        {
            try
            {
                m.From = new MailAddress(from);
                m.To.Add(new MailAddress(to));
                m.Body = msj;
                m.Subject = "Usted se ha Registrado Correctamente";
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.Credentials = new NetworkCredential(from, password);
                smtp.EnableSsl = true;
                smtp.Send(m); 
                return true;
            }
            catch (Exception e)
            {
                Console.WriteLine(e.StackTrace);
                return false;
            }
        }

    }
}