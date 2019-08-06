using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using FluentData;

public class SqlHelper
{
    public static string connectionString =string.Empty;

    public SqlHelper(string address)
    {
        if (!string.IsNullOrWhiteSpace(address))
            connectionString = ConfigurationManager.ConnectionStrings[address].ConnectionString;
    }

    /// <summary>
    /// 直接执行SQL语句
    /// </summary>
    /// <param name="sql">SQL语句</param>
    /// <returns></returns>
    public static DataTable ExecuteSqlPara(string sql, params SqlParameter[] cmdParms)
    {
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            try
            {
                connection.Open();
            }
            catch
            {
                throw;
            }
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = connection;
            cmd.CommandText = sql;
            cmd.CommandTimeout = 30;
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                try
                {
                    da.Fill(dt);
                    cmd.Parameters.Clear();
                }
                catch (SqlException ex)
                {
                    throw ex;
                }
                finally
                {
                    cmd.Dispose();
                    connection.Close();
                }
                return dt;
            }
        }
    }

    /// <summary>
    /// 上下文
    /// </summary>
    public static IDbContext DbContext
    {
        get
        {
            var context = new DbContext().ConnectionString(connectionString, new SqlServerProvider());
            return context;
        }
    }
}