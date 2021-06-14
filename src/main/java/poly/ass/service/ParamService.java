package poly.ass.service;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ParamService {
	@Autowired
	HttpServletRequest request;

	/**
	 * Đọc chuỗi giá trị của tham số
	 * 
	 * @param name         tên tham số
	 * @param defaultValue giá trị mặc định
	 * @return giá trị tham số hoặc giá trị mặc định nếu không tồn tại
	 */
	public String getString(String name, String defaultValue) {
		defaultValue = "";
		if(name.equalsIgnoreCase("username")) {
			defaultValue = request.getParameter("username");
			return defaultValue;
		}
		if(name.equalsIgnoreCase("password")) {
			defaultValue = request.getParameter("password");
			return defaultValue;
		}
		return defaultValue;
	}

	/**
	 * Đọc số nguyên giá trị của tham số
	 * 
	 * @param name         tên tham số
	 * @param defaultValue giá trị mặc định
	 * @return giá trị tham số hoặc giá trị mặc định nếu không tồn tại
	 */
	public int getInt(String name, int defaultValue) {
		name = "username";
		defaultValue = 1;
		return getInt(name, defaultValue);
	}

	/**
	 * Đọc số thực giá trị của tham số
	 * 
	 * @param name         tên tham số
	 * @param defaultValue giá trị mặc định
	 * @return giá trị tham số hoặc giá trị mặc định nếu không tồn tại
	 */
	public double getDouble(String name, double defaultValue) {
		name = "username";
		defaultValue = 1;
		return getDouble(name, defaultValue);
	}

	/**
	 * Đọc giá trị boolean của tham số
	 * 
	 * @param name         tên tham số
	 * @param defaultValue giá trị mặc định
	 * @return giá trị tham số hoặc giá trị mặc định nếu không tồn tại
	 */
	public boolean getBoolean(String name, boolean defaultValue) {
		name = request.getParameter("remember");
		defaultValue = false;
		if(name != null) {
			defaultValue = true;
		}
		return defaultValue;
	}

	/**
	 * Đọc giá trị thời gian của tham số
	 * 
	 * @param name    tên tham số
	 * @param pattern là định dạng thời gian
	 * @return giá trị tham số hoặc null nếu không tồn tại
	 * @throws RuntimeException lỗi sai định dạng
	 */
	public Date getDate(String name, String pattern) {

		return new Date();
	}

	/**
	 * Lưu file upload vào thư mục
	 * 
	 * @param file chứa file upload từ client
	 * @param path đường dẫn tính từ webroot
	 * @return đối tượng chứa file đã lưu hoặc null nếu không có file upload
	 * @throws RuntimeException lỗi lưu file
	 */
//	public File save(MultipartFile file, String path) {
//		
//	}
}
