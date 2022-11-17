package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import Util.DatabaseUtil;
import java.sql.ResultSet;

public class memberDAO {
	Connection conn = DatabaseUtil.getConnection();

	public int join(String userID, String userPassword, String userName, String userEmail, String userPhone) {
		String SQL = "INSERT INTO member VALUES (?,?,?,?,?)";
		
		try {
			// 각각의 데이터를 실제로 넣어준다.
			PreparedStatement pstmt = conn.prepareStatement(SQL);
					
			// 쿼리문의 ?안에 각각의 데이터를 넣어준다.
			pstmt.setString(1, userID);
			pstmt.setString(2, userPassword);
			pstmt.setString(3, userName);
			pstmt.setString(4, userEmail);
			pstmt.setString(5, userPhone);

			// 명령어를 수행한 결과 반환, 반환값: insert가 된 데이터의 개수
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
		// 정상 실행시: 1 / 오류 발생시: -1
	}

	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM member WHERE userID = ?";
		ResultSet rs = null;
	
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; //로그인 성공
				} else {
					return 0;} //비밀번호 틀림
			} else {
				return -1;//아이디 없음
			}
		} catch (Exception e) {
				e.printStackTrace();
		}
		return -2; //DB오류
	}
}
