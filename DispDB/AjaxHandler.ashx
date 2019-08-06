<%@ WebHandler Language="C#" Class="AjaxHandler" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Data;

public class AjaxHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        //context.Response.ContentType = "application/json";

        string action = context.Request["action"];

        string strReslt = "";
        switch (action)
        {
            case "GetDBTables":
                strReslt = GetDBTables(context);
                break;
            case "GetTableInfo":
                strReslt = GetTableInfo(context);
                break;
        }

        context.Response.Write(strReslt);
        HttpContext.Current.ApplicationInstance.CompleteRequest();
    }

    private string GetDBTables(HttpContext context)
    {
        context.Response.ContentType = "application/json";

        string dbAddress = context.Request.Form["db"].ToString();
        SqlHelper sqlHelper = new SqlHelper(dbAddress);
        string dbName = string.Empty;
        if (dbAddress.IndexOf(":") > 0)
            dbName = dbAddress.Substring(dbAddress.IndexOf(":") + 1).Trim();

        DBModel dbModel = new DBModel();
        List<DBBase> listDBBase = new List<DBBase>();

        listDBBase = SqlHelper.DbContext.Sql(string.Format(@"
        select 
        a.name table_name,
        'A' table_type,
        isnull(b.value,'') column_info,
        t1.name column_name,
        case when t4.id is null then '0' else '1' end as column_biaoshi,
        case when t4.id is null then '0' else '1' end as column_key,
        t5.name column_type,
            c.CHARACTER_MAXIMUM_LENGTH column_length,
            ISNULL(ISNULL(CAST(c.NUMERIC_PRECISION AS varchar),c.CHARACTER_MAXIMUM_LENGTH),'') column_count,
            ISNULL(c.NUMERIC_SCALE,0) column_scale,
            t1.isnullable column_isnull,
            ISNULL(c.COLUMN_DEFAULT,'') column_text,
            cast(isnull(t6.value,'') as varchar(2000)) column_value
            from {0}..sysobjects a
            LEFT JOIN {0}.sys.extended_properties b on a.id=b.major_id and b.minor_id=0 
        LEFT JOIN {0}..syscolumns t1 ON a.id=t1.id
        LEFT JOIN {0}..SYSOBJECTS t2 on  t2.parent_obj = t1.id  AND t2.xtype = 'PK' 
        LEFT JOIN {0}..SYSINDEXES t3 on  t3.id = t1.id  and t2.name = t3.name  
        LEFT JOIN {0}..SYSINDEXKEYS t4 on t1.colid = t4.colid and t4.id = t1.id and t4.indid = t3.indid
        LEFT JOIN {0}..systypes  t5 on  t1.xtype=t5.xtype AND t5.xtype=t5.xusertype
        LEFT JOIN {0}.sys.extended_properties t6 on t1.id=t6.major_id and t1.colid=t6.minor_id
        LEFT JOIN {0}.INFORMATION_SCHEMA.COLUMNS c ON c.TABLE_NAME=a.name 
        AND c.COLUMN_NAME=t1.name
        where 
        a.xtype='U'
        ORDER BY a.name,c.ORDINAL_POSITION", dbName)).QueryMany<DBBase>();

        dbModel.data1 = listDBBase;
        dbModel.data2 = new List<DBBase>();

        string strJson = JsonHelper.ObjectToJsonByNativeSerializer(dbModel);

        return strJson;
    }

    private string GetTableInfo(HttpContext context)
    {
        //return @"{\"code\":1,"msg":"[TableName(\"e_Base_Brand\")]\r\npublic class EBaseBrandInfo : BaseModel\r\n{\r\n   /// <summary>\r\n   /// \r\n   /// </summary>\r\n   [Display(Name = @\"\")]\r\n   public virtual Int32 FID { get; set; }\r\n\r\n}\r\n"}";
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        sb.Append("[TableName(\"e_Base_Brand\")]");
        sb.Append("\r\n");
        sb.Append("public class EBaseBrandInfo : BaseModel");
        sb.Append("\r\n");
        sb.Append("{");
        sb.Append("\r\n");
        sb.Append("\r\n");
        sb.Append("/// <summary>");
        sb.Append("\r\n");
        sb.Append("/// ");
        sb.Append("\r\n");
        sb.Append("/// </summary>");
        sb.Append("\r\n");
        sb.Append("[Display(Name = @\"\")]");
        sb.Append("\r\n");
        sb.Append("public virtual Int32 FID { get; set; }");
        sb.Append("\r\n");
        sb.Append("\r\n");
        sb.Append("}");
        return sb.ToString();
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}