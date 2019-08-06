using System.Web.Script.Serialization;

/// <summary>
/// JsonHelper 的摘要说明
/// </summary>
public class JsonHelper
{
    public static string ObjectToJsonByNativeSerializer(object obj)
    {
        if (obj == null)
            return string.Empty;
        try
        {
            JavaScriptSerializer jss = new JavaScriptSerializer();
            jss.MaxJsonLength = int.MaxValue;
            return jss.Serialize(obj);
        }
        catch
        {
            return string.Empty;
        }
    }
}