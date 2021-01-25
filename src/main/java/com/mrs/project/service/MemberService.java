package com.mrs.project.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.mrs.project.dao.MemberDAO;
import com.mrs.project.dto.BoardDTO;
import com.mrs.project.dto.MemberDTO;
import com.mrs.project.dto.ScrapDTO;

@Service
public class MemberService {
	private String REST_API_KEY = "504490bc7bab52d815247c9fa2477533";
	private String REDIRECT_URI = "http://127.0.0.1:8080/project/Kakaologin";
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	MemberDAO dao;

	// 로그인-----------------------------------------------------------------------------------------------------------------
	public int login(String id, String pw) {
		int cnt = dao.login(id, pw);
		// logger.info("회원여부"+cnt);
		return cnt;
	}

	// 회원가입-----------------------------------------------------------------------------------------------------------------
	public ModelAndView join(HashMap<String, Object> params) {
		int success = dao.join(params);
		// logger.info("여기까지왔슈");

		String msg = "가입에 실패했습니다.";
		String page = "joinForm";

		if (success > 0) {
			msg = "가입에 성공했습니다.";
			page = "member/index_login";
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.setViewName(page);
		return mav;
	}

	// 아이디중복확인------------------------------------------------------------------------------------------------------------
	public HashMap<String, Object> dbchk(String id) {
		int result = dao.dbchk(id);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("dbchk", result);
		return map;
	}

	public int mypage_loginpw(String id, String pw) {
		int result = dao.mypage_loginpw(id, pw);
		// logger.info(""+result);
		return result;
	}

	public void deleteMember(String id) {
		dao.deleteMember(id);

	}

	public MemberDTO mypage_updatepage(String id) {
		MemberDTO dto = dao.updatepage(id);
		return dto;
	}

	public int updateMember(String user_id, String user_pw, String user_name, String user_email) {

		return dao.updateMember(user_id, user_pw, user_name, user_email);
	}

	public void mypage_scrap(String id, Model model) {
		ArrayList<ScrapDTO> list = dao.mypage_scrap(id);
		model.addAttribute("list", list);

	}

	public void scrap_delete(String idx) {
		dao.scrap_delete(idx);
	}

	public String mypage_written(String id, int page, Model model) {
		int perPage = 10; // 한화면에서 보여줄 갯수
		int start = 0;
		int end = 0;
		if (page >= 0 && page <= 1) {
			start = 1;
			end = 10;
		} else { //
			end = page * perPage;
			start = end - perPage + 1;
		}
		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("id", id);
		map.put("start", start);
		map.put("end", end);

		ArrayList<BoardDTO> list = dao.mypage_written(map);
		int total = dao.getTotalCnt(id);
		int allPage = total / perPage;
		if (total % perPage > 0) { // 한페이지를 더해주고
			allPage += 1;
		}
		model.addAttribute("list", list);
		model.addAttribute("totalPage", allPage);
		model.addAttribute("curPage", page);

		return "member/mypage_written";
	}

	public MemberDTO mypage_detail(String id) {
		MemberDTO dto = dao.mypage_detail(id);

		return dto;

	}

	//토근 받기
    public String getAccessToken (Map<String, Object> params) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";
        
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            
            //POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            
            //POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=504490bc7bab52d815247c9fa2477533");
            sb.append("&redirect_uri=http://127.0.0.1:8080/project/Kakaologin");
            sb.append("&code=" + params.get("code"));
            bw.write(sb.toString());
            bw.flush();
            
            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
 
            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);
            
            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
            
            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);
            
            br.close();
            bw.close();
            
            //카카오로시도
        } catch (Exception e) {
            e.printStackTrace();
        } 
        return access_Token;
    }

	public String getAccessToken_naver(Map<String, Object> params) {
		 	String access_Token = "";
	        String refresh_Token = "";
	        String reqURL = "https://nid.naver.com/oauth2.0/token";
	        
	        try {
	            URL url = new URL(reqURL);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            
	            //POST 요청을 위해 기본값이 false인 setDoOutput을 true로
	            conn.setRequestMethod("POST");
	            conn.setDoOutput(true);
	            
	            //POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
	            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	            StringBuilder sb = new StringBuilder();
	            sb.append("grant_type=authorization_code");
	            sb.append("&client_id=8MdhoeyuHdGjRRVM_YPS");
	            sb.append("&client_secret=zL3rzttz0u");
	            sb.append("&code=" + params.get("code"));
	            sb.append("&state=" + params.get("state"));
	            bw.write(sb.toString());
	            bw.flush();
	            
	            //    결과 코드가 200이라면 성공
	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : " + responseCode);
	 
	            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	            String line = "";
	            String result = "";
	            
	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println("response body : " + result);
	            
	            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(result);
	            
	            access_Token = element.getAsJsonObject().get("access_token").getAsString();
	            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
	            
	            System.out.println("access_token : " + access_Token);
	            System.out.println("refresh_token : " + refresh_Token);
	            
	            br.close();
	            bw.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        } 
	        return access_Token;
	    }

	
	public String getUserInfo_kakao(String token) {
		//요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
	    HashMap<String, Object> userInfo = new HashMap<>();
	    String reqURL = "https://kapi.kakao.com/v2/user/me";
	    String kakaoId = null;
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setDoOutput(true);
	        //요청에 필요한 Header에 포함될 내용
	        conn.setRequestProperty("Authorization", "Bearer " + token);
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String line = "";
	        String result_1 = "";
	        
	        while ((line = br.readLine()) != null) {
	        	result_1 += line;
	        }
	        //result = {id : xxxxx}
	        
	        System.out.println("response body : " + result_1);
	        JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result_1);
	        
	        kakaoId = element.getAsJsonObject().get("id").getAsString();
	        System.out.println(kakaoId);
	        
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    
		return kakaoId;
	}

	public ModelAndView kaoIdChk(String kaoId, HttpSession session, RedirectAttributes rAttr) {
		ModelAndView mav = new ModelAndView();
		String page = "member/index_login_connect";
		String msg = "로그인에 실패했습니다.";
		int chkIdCount = dao.kaoIdChk(kaoId);
		System.out.println(chkIdCount);
		
		if (chkIdCount>0) {
			//로그인
			ArrayList<MemberDTO> result = dao.kaoLogin(kaoId);
			//kaoid에 대응하는 id와 pw를 찾아서
			String id = result.get(0).getId();
			String pw = result.get(0).getPw();
			
			session.setAttribute("loginid", id);
			page = "redirect:/";
			msg = "로그인에 성공했습니다.";
			//param에 담아서 controller의 /login 태우기
			
		}else {
			//아이디가 없으면 kakaoId를 세션에 담기
			session.setAttribute("kakaoId", kaoId);
			//연결하려고 하는 아이디를 받아오자
		}
		mav.setViewName(page);
		rAttr.addFlashAttribute("msg", msg);
		
		return mav;
	}
	/*
	 * public void accessCode(HttpServletResponse resp) { String reqUrl =
	 * "https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=" +
	 * REST_API_KEY + "&redirect_uri="+ REDIRECT_URI;
	 * 
	 * String readLine=null; try { //connetion 생성 URL url = new URL(reqUrl);
	 * HttpURLConnection conn =(HttpURLConnection) url.openConnection();
	 * 
	 * //requstmethod : get, conn.setRequestMethod("GET");
	 * 
	 * //결과코드가 200이면 성공 int responscode = conn.getResponseCode();
	 * 
	 * 
	 * BufferedReader br= new BufferedReader(new
	 * InputStreamReader(conn.getInputStream()));
	 * 
	 * StringBuffer response = new StringBuffer();
	 * 
	 * while((readLine = br.readLine()) !=null) { response.append(readLine); }
	 * br.close(); PrintWriter pw = resp.getWriter();
	 * pw.println(response.toString());
	 * 
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } }
	 */

	public int memberConnect(String id, String pw, String kakaoId) {
		int success = dao.memberConnect(id,pw,kakaoId);
		return success;
	}

	public void AcsCode(String reqURL) {

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
	        
	        int responseCode = conn.getResponseCode();
	        System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        System.out.println(conn.getInputStream());
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//카카오 계정 연결 끊기
	public void disconnect(HttpSession session) {

		//Access token 꺼내오기
		String AccTk = (String) session.getAttribute("AccessToken");
		System.out.println("AccessToken :" + AccTk);
		String reqURL = "https://kapi.kakao.com/v1/user/unlink";

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			//POST요청
			conn.setRequestMethod("POST");
		    conn.setRequestProperty("Authorization", "Bearer " + AccTk);
			
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode: "+responseCode);
			
			String line = "";
            String result = "";
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
