package service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;
import dao.NRBoardDao;
import model.Board;
import model.NRBoard;

public class NRboardDown implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		int num = Integer.parseInt(request.getParameter("num"));
		NRBoardDao nbd = NRBoardDao.getInstance();
		NRBoard nrboard = nbd.download(num);

		String filename = nrboard.getNRBoard_file();

		String uploadFileName = request.getSession().getServletContext().getRealPath("/listfile") + "/" + filename;

		File downFile = new File(uploadFileName);

		if (downFile.exists() && downFile.isFile()) // �ٿ�ε�

		{

			try

			{

				long filesize = downFile.length();

				response.setContentType("application/x-msdownload");

				response.setContentLength((int) filesize);

				String strClient = request.getHeader("user-agent");

				if (strClient.indexOf("MSIE 5.5") != -1)

				{

					response.setHeader("Content-Disposition", "filename=" + filename + ";");

				}

				else

				{

					filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");

					// ���ڵ� ����� '+'���� ���� ����

					response.setHeader("Content-Disposition", "attachment; filename=" + filename + ";");

				}

				response.setHeader("Content-Length", String.valueOf(filesize));

				response.setHeader("Content-Transfer-Encoding", "binary;");

				response.setHeader("Pragma", "no-cache");

				response.setHeader("Cache-Control", "private");

				byte b[] = new byte[1024];

				BufferedInputStream fin = new BufferedInputStream(new FileInputStream(downFile));

				BufferedOutputStream outs = new BufferedOutputStream(response.getOutputStream());

				int read = 0;

				while ((read = fin.read(b)) != -1)

				{

					outs.write(b, 0, read);

				}

				outs.flush();

				outs.close();

				fin.close();

			} catch (Exception e)

			{

				System.out.println("Download Exception : " + e.getMessage());

			}

		} else

		{

			System.out.println("Download Error : downFile Error [" + downFile + "]");

		}

		return null;
	}

}
