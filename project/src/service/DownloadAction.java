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
import model.Board;

public class DownloadAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		int num = Integer.parseInt(request.getParameter("num"));
		BoardDao bd = BoardDao.getInstance();
		Board board = bd.download(num);

		String filename = board.getBoard_file();

		String uploadFileName = request.getSession().getServletContext().getRealPath("/upload") + "/" + filename;

		File downFile = new File(uploadFileName);

		if (downFile.exists() && downFile.isFile()) // 다운로드

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

					// 인코딩 변경과 '+'문자 깨짐 방지

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
