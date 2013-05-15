package dbconn;
import java.io.*;
import java.util.*;
import java.sql.*;
import dbconn.*;


public class DataProcess
{
	public DataProcess(){}

	public int RetrieveData(final String sqlStmt, MatrixDataSet matrixData, Connection conn)
	{
		Statement stmt = null;
		ResultSet rs = null;
		int iRet = 0;
        int fetchCount  = 0;

		try
		{
			stmt = conn.createStatement();

			rs = stmt.executeQuery(sqlStmt);

			ResultSetMetaData metaData = rs.getMetaData();
			int columnNum = metaData.getColumnCount();

			matrixData.clear();

			SerialDataSet serialData;

			while(rs.next())
			{
				serialData = new SerialDataSet();

				for(int i = 1;  i <= columnNum; i++)
				{
					serialData.addTail((rs.getString(i)==null?"":rs.getString(i)));
				}

				fetchCount++;
				matrixData.addTail(serialData);
			}

			if(fetchCount == 0)
			{
				 //System.out.println("DataProcess RetrieveData count:"+fetchCount);
				 iRet = 0;
			}
			else
				iRet = fetchCount;

		}catch(SQLException e)
		{
			System.err.println("DataProcess RetrieveData Err1:"+e.toString()+e.getMessage());
			iRet = -1;
		}
		finally
		{
			try
			{
				if(stmt != null) stmt.close();
				if(rs != null) rs.close();

			}catch(Exception e)
			{
				System.err.println("DataProcess RetrieveData Err2:"+e.toString()+e.getMessage());
				iRet = -1;
			}
		}
		return iRet;
	}

	public boolean ManipulateData(final String sqlStmt, Connection conn)
	{
		boolean bIsSuccess = true;
		Statement stmt = null;

		try
		{
			stmt = conn.createStatement();
			int returnValue = stmt.executeUpdate(sqlStmt);

			if(returnValue <= 0)
			{
				bIsSuccess = false;
			}

		}catch(SQLException e)
		{
			System.err.println("DataProcess ManipulateData Err:"+e.toString()+e.getMessage());
			System.err.println("sqlStmt:"+sqlStmt);
			bIsSuccess = false;
		}
		finally
		{
			try
			{
				if(stmt != null) stmt.close();
			}catch(Exception e)
			{
				System.err.println("DataProcess ManipulateData Err2:"+e.toString()+e.getMessage());
				bIsSuccess = false;
			}
		}

		return bIsSuccess;
	}
}
