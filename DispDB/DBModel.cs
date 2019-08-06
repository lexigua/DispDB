using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


    /// <summary>
    /// DBModel 的摘要说明
    /// </summary>
    public class DBModel
    {
        public List<DBBase> data1 { get; set; }
        public List<DBBase> data2 { get; set; }
        public string error { get; set; }
    }

    public class DBBase
    {
        public string column_biaoshi { get; set; }
        public string column_count { get; set; }
        public string column_info { get; set; }
        public string column_isnull { get; set; }
        public string column_key { get; set; }
        public string column_length { get; set; }
        public string column_name { get; set; }
        public string column_scale { get; set; }
        public string column_text { get; set; }
        public string column_type { get; set; }
        public string column_value { get; set; }
        public string table_name { get; set; }
        public string table_type { get; set; }
    }