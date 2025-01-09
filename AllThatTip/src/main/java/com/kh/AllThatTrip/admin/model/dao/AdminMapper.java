package com.kh.AllThatTrip.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.AllThatTrip.admin.model.vo.AdNotice;
import com.kh.AllThatTrip.admin.model.vo.AdReply;
import com.kh.AllThatTrip.admin.model.vo.Admin;
import com.kh.AllThatTrip.board.model.vo.Board;
import com.kh.AllThatTrip.member.model.vo.Member;

@Mapper
public interface AdminMapper {
	
	int selectTotalCount();

	List<AdNotice> selectAdNoticeList(RowBounds rowBounds);

	void insertAdNotice(AdNotice adNotice);

	int increaseCount(Long adNoticeNo);

	AdNotice selectById(Long adNoticeNo);

	int updateAdNotice(AdNotice adNotice);

	int deleteAdNotice(Long adNoticeNo);

	Admin adLogin(Admin admin);

	int insertAdReply(AdReply reply);

	List<AdReply> selectAdReplyList(int adNoticeNo);

	Map<String, Object> memberFindAll(Member member);

	List<Member> memberFindAll();

	Member selectMemberId(String userId);

	List<Member> selectMember();

	List<Member> selectDeleteMember();

	List<Member> selectNewMember();

	List<Member> selectOldMember();

	int deleteMember(String userId);

	int unDeleteMember(String userId);

	int spamMember(String userId);

	int unSpamMember(String userId);

	int updatePasswordMember(Member member);

	int resetCount(String userId);

	List<Board> boardFindAll();

	List<Board> selectBoardWriter(String boardWriter);

	List<Board> selectCountMax();

	List<Board> selectCountMin();

	List<Board> selectNewBoard();

	List<Board> selectOldBoard();

	List<Board> selectDeleteBoard();

	List<Board> selectBoard();

	List<Board> select40Board();

	List<Board> select30Board();

	List<Board> select20Board();

	List<Board> select10Board();

	List<Board> select50Board();

	int deleteBoard(int boardNo);

	int unDeleteBoard(int boardNo);

	List<Board> selectBoardNo(int boardNo);

	
	
	
}
