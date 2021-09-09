package model.bank;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.JNDI;

public class BankDAO {
	Connection conn=null;
	PreparedStatement pstmt=null;
	
	// String sql1="update bank1 set balance=balance-? where bid=1001";
	// String sql2="update bank2 set balance=balance+? where bid=2001";
	String SQL_GIVE="UPDATE BANK SET BALANCE=BALANCE-? WHERE BNUM=?";
	String SQL_TAKE="UPDATE BANK SET BALANCE=BALANCE+? WHERE BNUM=?";
	String SQL_CHECK="SELECT * FROM BANK WHERE BNUM=?";
	
	public boolean trans(int bal, int give, int take) {
		conn=JNDI.connect();
		try {
			conn.setAutoCommit(false); // set autocommit=0;
			pstmt=conn.prepareStatement(SQL_GIVE);
			pstmt.setInt(1, bal);
			pstmt.setInt(2, give);
			pstmt.executeUpdate();
			pstmt=conn.prepareStatement(SQL_TAKE);
			pstmt.setInt(1, bal);
			pstmt.setInt(2, take);
			pstmt.executeUpdate();
			
			pstmt=conn.prepareStatement(SQL_CHECK);
			pstmt.setInt(1, give);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			if(rs.getInt("balance")<0) { // 잔액이 0미만이면,
				conn.rollback();
				return false;
			}
			else {
				conn.commit(); // commit; 수행이 완료됐을 때!
			}
			rs.close();
			conn.setAutoCommit(true); // set autocommit=0;			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JNDI.disconnect(pstmt, conn);
		}
				
		return true;
	}
	
	// SQL_CHECK="SELECT * FROM BANK WHERE BNUM=?"
	public BankVO checkBal(BankVO vo) {
		BankVO data=null;
		conn=JNDI.connect();
		try {
			pstmt=conn.prepareStatement(SQL_CHECK);
			pstmt.setInt(1, vo.getBnum());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				data=new BankVO();
				data.setBnum(rs.getInt("bnum"));
				data.setBname(rs.getString("bname"));
				data.setName(rs.getString("name"));
				data.setBalance(rs.getInt("balance"));
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JNDI.disconnect(pstmt, conn);
		}
		
		return data;
	}
}
