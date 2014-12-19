using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Net;
using System.Xml.Xsl;
using System.Xml.XPath;
using System.Xml;
using System.IO;
using System.Xml.Schema;
using System.Web.Hosting;

namespace XMLWebService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class Service1 : IService1
    {
       private string errorMesg = "No error";
       public string transformation(string xmlUrl, string xslUrl)
        {
           if(String.IsNullOrEmpty(xmlUrl) || String.IsNullOrEmpty(xslUrl))
           {
               return "One or more inputs are empty.";
           }
           WebClient client = new WebClient();
           string xmlFile =  client.DownloadString(xmlUrl);
           //string xslFile = client.DownloadString(xslUrl);
           XslCompiledTransform xslt = new XslCompiledTransform();
           xslt.Load(xslUrl);
           XPathDocument xpathdocument = new XPathDocument(xmlUrl);

           string dirPath = HostingEnvironment.ApplicationPhysicalPath;
           string filePath = dirPath + "htmlfile.htm";
           XmlWriter writer = XmlWriter.Create(filePath);

           xslt.Transform(xpathdocument, null ,writer);
           writer.Close();
           return filePath;
        }

       public string verification(string xmlUrl, string xsdUrl)
       {
           if (String.IsNullOrEmpty(xmlUrl) || String.IsNullOrEmpty(xsdUrl))
           {
               return "One or more inputs are empty.";
           }
            WebClient webClient = new WebClient();
            string xsdFile = webClient.DownloadString(xsdUrl);

            XmlSchemaSet schemaSet = new XmlSchemaSet();
            schemaSet.Add("", XmlReader.Create(new StringReader(xsdFile)));

            XmlReaderSettings settings = new XmlReaderSettings();
            settings.ValidationType = ValidationType.Schema;
            settings.Schemas = schemaSet;
            settings.ValidationEventHandler += new ValidationEventHandler(verificationCallBack);

            // Create the XmlReader object.
            XmlReader reader = XmlReader.Create(xmlUrl, settings);

            while (reader.Read()) { }
            return errorMesg;
        }
        private void verificationCallBack(object sender, ValidationEventArgs e)
        {
            errorMesg = e.Message.ToString();
        }
    }
}