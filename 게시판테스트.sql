-- 게시판 페이지처리
SELECT * FROM 
			(SELECT rownum r ,f.* FROM
								(SELECT * FROM community  ORDER BY idx DESC) f)
		WHERE r BETWEEN #{start} AND #{end};
-- 1) idx 내림차순 정령
SELECT * FROM COMMUNITY ORDER BY IDX DESC;
-- 2) : rownum 컬럼값 사용
SELECT rownum r ,f.* FROM
								(SELECT * FROM community  ORDER BY idx DESC) f);
--3) : 범위를 지정 1페이지에 글이 10개, 20개 이므로 start, end 값을 그 갯수에 따라 지정
--	 : 1 페이지의 글 목록이 10개 일 때는 아래와 같이 실행되야 한다.	
SELECT * FROM 
			(SELECT rownum r ,f.* FROM
								(SELECT * FROM community  ORDER BY idx DESC) f)	
			WHERE r BETWEEN 1 AND 10;
		
SELECT * FROM 
			(SELECT rownum r ,f.* FROM
								(SELECT * FROM community  ORDER BY idx DESC) f)	
			WHERE r BETWEEN 11 AND 20;
		
SELECT * FROM 
			(SELECT rownum r ,f.* FROM
								(SELECT * FROM community  ORDER BY idx DESC) f)	
			WHERE r BETWEEN 101 AND 110;
		
--새글 저장
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, 'wonder','자비를 베푸소서 (외전증보판) 1','재미있게 잘 읽었습니다. 다음 편이 궁금해지네요.');

SELECT COMMUNITY_IDX_SEQ.CURRVAL FROM DUAL;

-- 글 수정
UPDATE community
SET title='자비를 베푸소서 (번역판) 1', content='좋은 글입니다.' ,ip='13.0.1.25'
WHERE idx=257;

-- 글 1개 가져오기
SELECT * FROM COMMUNITY WHERE IDX=257;

-- 글 삭제
DELETE FROM community WHERE idx=258;
 			
-- 글 갯수
 SELECT * FROM COMMUNITY ;
 		
-- 글 조회수 증가
 UPDATE community SET READCOUNT = READCOUNT +1 WHERE idx = 257;
 
-- 메인글의 댓글 갯수 조회 : 댓글 테이블 가서 메인글 번호 idx를 확인 후 실행
SELECT COUNT(*) FROM COMMUNITYCOMMENTS WHERE MREF=257;

-- 메인 글의 댓글 갯수 업데이트
UPDATE COMMUNITY SET COMMENTCOUNT = (SELECT COUNT(*) 
FROM COMMUNITYCOMMENTS WHERE MREF=257) WHERE IDX = 257;

-- 메인 글의 댓글 목록 가져오기	
SELECT count(*) FROM COMMUNITYCOMMENTS WHERE MREF=257;
 			
 			
 			
 			
 			
 			
 			
 			
 			