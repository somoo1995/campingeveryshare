package web.view;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

//import web.dto.BoardFile;

public class FileDownloadView extends AbstractView {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );

	@Autowired ServletContext context;
	
	@Override
	protected void renderMergedOutputModel(
			Map<String, Object> model, 
			HttpServletRequest request,
			HttpServletResponse response ) throws Exception {
		
//		// ### 파일 준비 ###
//		BoardFile downFile = (BoardFile) model.get("downFile");
//		
//		File src = new File(context.getRealPath("upload"), downFile.getStoredName());
//		FileInputStream in = new FileInputStream(src);
//		
//		logger.info("서버에 업로드된 파일 : {}", src);
//		
//		//원래 존재 여부 확인해서 안내창 띄우기 등 예외처리 필요
//		logger.info("존재 여부 : {}", src.exists());
//		
//		//응답 헤더 설정
//		response.setContentType("application/octet-stream");
//		response.setContentLengthLong( src.length() );
//		response.setCharacterEncoding("UTF-8");
//		
//		String outputName = URLEncoder.encode(downFile.getOriginName(), "UTF-8");
//		outputName = outputName.replace("+", "%20"); //띄어쓰기 복원 : "+" -> "공백문자"
//		response.setHeader("Content-Disposition", "attachment; filename=\"" + outputName +"\" ");
//		
//		//응답
//		OutputStream out = response.getOutputStream();
//		FileCopyUtils.copy(in, out);
	
	}

}
