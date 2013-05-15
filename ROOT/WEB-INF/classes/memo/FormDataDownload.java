package memo;

import java.io.*;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

/**
 * Process form data as File download.
 *
 * Example)
 *<pre>
 *	FormDataDownload formData = new FormDataDownload(response, new File(filename), null, null);
 *	try
 *	{
 *		formData.download();
 *	}catch(FileNotFoundException e)
 *	{
 *		...
 *	}catch(IOException e)
 *	{
 *		...
 *	}</pre>
 *
 *
 * @version 1.0, 08/09/01
 * @author  Seungbae Lee
 * @since   JDK1.2, JSDK2.2
 */
public class FormDataDownload
{
	HttpServletResponse response;
	ServletOutputStream out;
	File srcDownloadFile;
	String downFileName = "";
	String contentType = "";

	/**
	*
	* @param	response	    
	* @param	srcDownloadFile	
	* @param	downFileName	default - srcDownloadFile
	* @param	contentType		MIME type default value - application/octet-stream
	*
	*/
	public FormDataDownload(HttpServletResponse response, File srcDownloadFile, String downFileName, String contentType) throws IOException
	{
		response.reset();
		this.response = response;
		out = response.getOutputStream();
		this.srcDownloadFile = srcDownloadFile;
		this.downFileName = downFileName;
		this.contentType = contentType;

		if(contentType == null)
			response.setContentType("application/octet-stream");
		if(downFileName == null)
		{
			downFileName = srcDownloadFile.getName();
			response.setHeader("Content-Disposition", "attachment; filename=" + downFileName);
		}
		else
			response.setHeader("Content-Disposition", "attachment; filename=" + downFileName);
	}

	/**
	* file download
	*/
	public void download() throws FileNotFoundException, IOException
	{
		byte[] buffer = new byte[1024];
		int byteData = 0;
		int offset = 0; 
		String line = null;
		
		//DataInputStream in = new DataInputStream(new FileInputStream(srcDownloadFile));
		FileInputStream in = new FileInputStream(srcDownloadFile);
		//System.out.println("srcDownload#" + srcDownloadFile);
		while((byteData = in.read(buffer, offset, buffer.length)) != -1)
			out.write(buffer, 0, byteData);
		in.close();
	}
}
