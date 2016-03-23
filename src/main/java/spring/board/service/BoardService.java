package spring.board.service;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javassist.expr.NewArray;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.NumberUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.beans.*;
//import com.board.beans.NewUser;
import com.board.dao.BoardDao;
import com.board.mail.SendEmailUsingGMailSMTP;
//import com.board.dao.PostManager;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.spring.web.dao.SpringDao;

import spring.board.controller.*;

@Service
public class BoardService extends BoardController{
	@Autowired
	private SpringDao dao;
	
	
	private static User currentUser = new User();
//	login user session variable; loginUserIdx	
	public ArrayList<Categories> getCategoryList(){
		ArrayList<Categories> categoryList = new ArrayList<Categories>();
		
		//--- DB���� ��������..
		try {
			categoryList = dao.getCategoryList();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return categoryList;
	}
	
	public ArrayList<StageCategories> getStageCategoryList(){
		ArrayList<StageCategories> categoryList = new ArrayList<StageCategories>();
		//--- DB���� ��������..
		try {
			categoryList = dao.getStageCategories();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return categoryList;
	}
	
	public ArrayList<Outputs> getOutputList(){
		ArrayList<Outputs> outputList = new ArrayList<Outputs>();
		
		try {
			outputList = dao.getOutputs();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return outputList;
	}

	@Override
	public String landing(HttpServletRequest request){
		// TODO Auto-generated method stub
		try {
			request = setUser(request);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("msg", "�߸��� �����Դϴ�.");
			return "error";
		}
		return "index2";
	}	
	@Override
	public String showUser(@PathVariable Integer idx,
			HttpServletRequest request) throws Exception{
//			Model model) throws Exception{
		// TODO Auto-generated method stub
		System.out.println("showUser invoked...");
		System.out.println("UID dddd= " + idx);
		
		User targetUser = new User();
		targetUser = dao.getUser(idx);
		
		
		Integer loginUserIdx = 0;
		HttpSession session = request.getSession(true);
		if (session.getAttribute("loginUserIdx") != null){
			loginUserIdx = (Integer)session.getAttribute("loginUserIdx");
			request = setUser(request);
		}
		

//		model.addAttribute("uid", idx);
//		ModelAndView mav = new ModelAndView("user");
//		mav.addObject("idx", idx);
		String m = null;
		m = "getting activity";
		// activity �������� - �����Լ��� ������ 		
		request.setAttribute("message", m);
		request.setAttribute("targetUserIdx", idx);
		request.setAttribute("targetUser", targetUser);
		request.setAttribute("loginUserIdx", loginUserIdx);
		System.out.println("getting activity from showUserInfo..");
		
		System.out.println("targetUser.getIdx();" + idx);
//		return this.showUserInfo(idx, "a", request);
		return "userActivity";
	}
	
	
	@Override
	public String showUserInfo(
			@PathVariable Integer idx,
			@PathVariable String target,
			HttpServletRequest request) throws Exception {
		
		User targetUser = new User();
		targetUser = dao.getUser(idx);
		
		request.setAttribute("targetUserIdx", idx);
		request.setAttribute("targetUser", targetUser);
		request.setAttribute("t", target);
		
		String m = null;
		String targetViewPage = null;
		HttpSession session = request.getSession();
		Integer loginUserIdx = (Integer) session.getAttribute("loginUserIdx");
		request = setUser(request);

		// ���� ���� ����ڴ� user.jsp�� return; ���� �̿� ����ڴ� activity�� ���� ����.
		if(!loginUserIdx.equals(idx))
			return "redirect:/user/"+idx;
		
		if (target.equals("a"))
		{
			// gets activity
			m = "getting activity";
			// activity �������� - �����Լ��� ������
			targetViewPage = "userActivity";
			
		}
		else if(target.equals("f"))
		{
			// gets folder
			m = "getting folder";
			targetViewPage = "userFolder";
		}
		else if(target.equals("p"))
		{
			// gets profile
			m = "getting profile";
			request.setAttribute("categoryList", getCategoryList());
			targetViewPage = "userProfile";
			
		}
		else if(target.equals("n"))
		{
			// gets notice
			m = "getting notice";
			targetViewPage = "userNotice";
		}else{
			m = "�߸��� ����Դϴ�!";
			targetViewPage = "error";
		}
		System.out.println("m= " + m);
		request.setAttribute("message", m);
		request.setAttribute("msg", m);	
		
		return targetViewPage;
	}
//	
//	@Override
//	public String showProfileEditForm(
//			@PathVariable Integer idx,
//			@PathVariable String tab,
//			Model model) {
//		
////		tab definitions.
////			b - basic
////			c - career
//
//		String m = null;
//		m = "getting Profile form for Editing " + tab;
//		
//		model.addAttribute("message", m);
//		model.addAttribute("tab", tab);
//		model.addAttribute("idx", idx);
//		
//		return "profileForm";
//	}
	
//	RedirectAttributes�� ���� method���� redirect�Ǵ� �������� �Ӽ��� ������ �� �ִ�. 
//	querystring���� �Ѿ� ��.
//	@Override	 
//	public String updateProfile(
//			@PathVariable Integer idx, 
//			@PathVariable String tab,
//			RedirectAttributes redirectAttrs,
//			HttpServletRequest request) {
//		// TODO Auto-generated method stub
//		// update the form...
//		String m = null;
//		m = "Profile has been updated;  ";
//		if(tab.equals("b"))
//		{
////			editing basic info
//			m += " basic info.";
////			some function for updating BASIC info
//		}
//		else if(tab.equals("c"))
//		{
////			editing career
//			m += " career.";
////			some function for updating CAREER
//		}
//		System.out.println(m);
//				
////		request.setAttribute("message", m);
////		Process Result
////		1: sucess
//		redirectAttrs.addAttribute("PR", 1);
////		redirectAttrs.addAttribute("NM", m).addFlashAttribute("pResult", m);
//		
//		return "redirect:/user/"+idx+"/p";
////		return "redirect:/user/"+idx+"/p/"+tab;
//	}
	
//	ibatis test

		
//	@RequestMapping("/ibatisTest")
//	public void ibatisTest(){
//		ArrayList<String> list = new ArrayList<String>();
//			try {
//				list = dao.ibatisTest();
//	    		        for(String str : list) {
//	    			       System.out.println(str);	//�� ����� �ߺ����� ������...��... �ϴ� �Ű澲����... ���߿�select�������� ������ ��Ȳ ����� �׶� ����.
//	       		        }
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//	}	

	@Override
	public String finalPage() {
		// TODO Auto-generated method stub
		return "final";
	}

	@Override
	public String showSignUp(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String designatedViewName = "signupForm2";
		request.setAttribute("user",new User());
		return redirectLoginUser(request, designatedViewName);
//		return "signupForm2";
	}

	@Override
	public String signUpSubmit(
			Model model, 
			HttpServletRequest request,
			RedirectAttributes redirectAttributes) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		
		User user = new User();
		String email = request.getParameter("email");
//		String pword = request.getParameter("pword");
		String createdTime = LocalDateTime.now().toString();
		String userType	= request.getParameter("userType");
			
		user.seteMail(email.trim());		
		user.setPassword(request.getParameter("pword"));
		user.setCreatedTime(createdTime);
		user.setUserType(userType);
		
		// check if the same email address has been created after the form submitted.
		// --> later..
		int howManyDuplicatedEmail = dao.getHowManyUsersByEmail(email);
		System.out.println("howManyDuplicatedEmail?; "+ howManyDuplicatedEmail);
		if(howManyDuplicatedEmail>0){
			redirectAttributes.addFlashAttribute("isAlreadySignUp", true);
			redirectAttributes.addFlashAttribute("isAlreadySignUpMSG", "�̹� �����ϼ̽��ϴ�.<br>��й�ȣ�� �����̴ٸ� �Ʒ� ��й�ȣ ã�⸦ ���� Ȯ���ϼ���.");
			return "redirect:/signin";
		}		  
		int lastCreatedUserIdx = dao.createUser(user);
		user.setIdx(lastCreatedUserIdx);
		request.setAttribute("requestingUserIdx", lastCreatedUserIdx);
		request.setAttribute("registeredEmail", user.geteMail());
		return "userActivationRequest";
	}
	
	@Override
	public String generateActivationCode(
			HttpServletRequest request,
			RedirectAttributes redirectAttributes)
			throws Exception {
		// TODO Auto-generated method stub
		String userIdx = request.getParameter("requestingUserIdx");
		String userEmail = request.getParameter("requestingEmail");
		
		Map<String, Object> userId_email = new HashMap<String, Object>();
		userId_email.clear();
		userId_email.put("userIdx", userIdx);
		userId_email.put("userEmail", userEmail);
		
		
		if(dao.getUserIdByEmail_Idx(userId_email)==1){
//			�ش� ����ڰ� �Ѹ� ����.. 
//			�����ڵ� �����ϰ� ���� �߼�...
			String seed_now = LocalDateTime.now().toString();
			String seed = seed_now + userEmail;
			String secuCode = getSHA256(seed);
			
			Map<String, Object> mapToGenerateSecuCode = new HashMap<String, Object>();
			mapToGenerateSecuCode.clear();
			mapToGenerateSecuCode.put("userIdx", userIdx);
			mapToGenerateSecuCode.put("relatedAction", "signUp");
			mapToGenerateSecuCode.put("secuCode", secuCode);
			dao.createSecuCode(mapToGenerateSecuCode);
			System.out.println("userIdx: "+ userIdx);
			System.out.println("secuCode: " + secuCode);
			
//			���Ϲ߼�...
			ApplicationContext context = 
		             new ClassPathXmlApplicationContext("Spring-Mail.xml");
			
			SendEmailUsingGMailSMTP mm = (SendEmailUsingGMailSMTP) context.getBean("SendEmailUsingGMailSMTP");
			try{
	        mm.sendMail("support.auth@dimp.com",	// gmail�� �� �������� ���ư���.
	    		   "cooljohn72@gmail.com",
	    		   "Testing123", 
	    		   "<html><body><a href='#'>HTML</a>�����Դϴ�...."
	    		   + "activationURL = /validateUser?c=" + secuCode + "</body></html>");
			}catch (Exception e){
				System.out.println("error on sending email...");
				e.printStackTrace();
				request.setAttribute("msg", "���Ϲ߼ۿ� �����߽��ϴ�.");
				return "error";
			}	        
//	        /. ���� �߼� 
			
		}else{
			request.setAttribute("msg", "���������� �����Դϴ�.");
			return "error";
		}
		
		
//		id�� �̸� �ּҰ� ��ġ�ϴ��� Ȯ�� �� �����Ѵ�.
//		��ġ���� ������ ������������ �����̷�Ʈ...
		
		return "userActivationRequestResult";
	}
	
	@Override
	public String checkActivationCode(
			@RequestParam(value="c", required=true) String code,
			HttpServletRequest request, 
			RedirectAttributes redirectAttributes) throws Exception{
//		�ش� code�� DB�� �����Ѵٸ� ���� ����� IDX�� return ���ְ� activate��Ų��.
		try{
			System.out.println("validating..."+dao.getUserIdxBySecuCode(code));
			int userIdxToActivate = dao.getUserIdxBySecuCode(code);
			if(userIdxToActivate>0){
//				activate
				dao.updateUserToActivated(userIdxToActivate);
			}else{
				request.setAttribute("msg", "invalid access[no such code. or expired...]");
				return "error";
			}
		}catch(Exception e){
			request.setAttribute("msg", "invalid access[no such code. or expired...]");
			return "error";
		}		
			
//		������ ������������ �����̷�Ʈ.
		
		return "userActivationResult";
	}
	
	@Override	//---> �̰� ���ʿ���!!
	public ModelAndView showNickNameForm(
			Integer idx,
			HttpServletRequest request,
			User user)
			throws Exception {
		// TODO Auto-generated method stub
		// idx�� �������� ������ ���� �������� �̵�.
		
		// ���� ����ڿ� ��û ��� ����� Ȯ��
		// ���� ����ڶ�� �������� Nickname ���� �� ǥ��.
		// �ƴϸ� ���� ������ ǥ��.(���������� �����̿�!)
		return null;
	}

	@Override
	public String nickNameSubmit(
			Model model,
			HttpServletRequest request)
			throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		return null;
	}
	
	@Override
	public String getNewPostForm(
			Model model,
			HttpServletRequest request) {
		// TODO Auto-generated method stub
		model.addAttribute("categoryList", getCategoryList());
		model.addAttribute("stageCategoryList", getStageCategoryList());
		model.addAttribute("outputList", getOutputList());
		
		try {
			request = setUser(request);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Map<String, String> attr = new HashMap<String, String>();
		attr.put("rows", "8");
		attr.put("cols", "50");
		
		model.addAttribute("editorAttr", attr);
		
		return "dimp";
	}	

	@Override
	public String saveNewPost(
			Model model,
			HttpServletRequest request) throws Exception{
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		
		Board article = new Board();
		User user = new User();
		int uIdx = (Integer) session.getAttribute("loginUserIdx");
		
		user.setIdx(uIdx);
		String howTo = request.getParameter("howTo");
		String postType = request.getParameter("postType");
		
		int ownerType = 0;
		try{
			if(request.getParameter("ownerType")!=null)
				ownerType = Integer.parseInt(request.getParameter("ownerType"));
		}catch(NumberFormatException e){}
		
		String title = request.getParameter("title");		
		String categories = request.getParameter("categories");				
		String[] categoriesA = request.getParameterValues("categories");

		String[] stageCategoriesA = request.getParameterValues("stageCategories");

		String stageCategories = request.getParameter("stageCategories");
		String editor1 = request.getParameter("editor1");
		String keyword = request.getParameter("keyword");
		int expectingDays = 0;
		try{
			if(request.getParameter("expectingDays")!=null)
				expectingDays = Integer.parseInt(request.getParameter("expectingDays"));
		}catch (NumberFormatException e){}
				
		int expectingCost = 0;
		try{
			if(request.getParameter("expectingCost")!=null)
				expectingCost = Integer.parseInt(request.getParameter("expectingCost"));
		}catch(NumberFormatException e){}	
		
		String[] requiredOutputA = request.getParameterValues("requiredOutputs");
		
		String qualification = request.getParameter("qualification");
		int emailNotice = 0;
		try{
			if(request.getParameter("emailNotice")!=null)
				emailNotice = Integer.parseInt(request.getParameter("emailNotice"));
		}catch(NumberFormatException e){}
		String regdate = LocalDateTime.now().toString();
		
		article.setPostType(postType);
		article.setOwnerType(ownerType);
		article.setTitle(title);
//		article.setCategories(categories);
//		article.setCategoriesAL(categoriesAL);
		article.setStageCategories(stageCategories);
//		article.setStageCategoriesAL(stageCategoriesAL);
		article.setContent(editor1);
		article.setKeyword(keyword);
		article.setExpectingDays(expectingDays);
		article.setExpectingCost(expectingCost);
//		article.setRequiredOutput(requiredOutput);
//		article.setRequiredOutput1(requiredOutput1);
//		article.setRequiredOutput2(requiredOutput2);
//		article.setRequiredOutput3(requiredOutput3);
//		article.setRequiredOutput4(requiredOutput4);
		article.setQualification(qualification);
		article.setEmailNotice(emailNotice);
		article.setWriterIdx(uIdx);
		article.setRegdate(regdate);
						
		//PostManager pm = new PostManager();
		System.out.println("howto: "+howTo);
		int lastInsertedIdx = 0;
		
//		�ٽú���!!!
		Map<String, Object> categoriesMapToInsert = new HashMap<String, Object>();	
		
		if(howTo.equals("toSave")){
			article.setPostStatus("01");	// draft.
			// save as draft and get last inserted idx		
			lastInsertedIdx = dao.insertPost(article);			
			// categories, stageCategories �� ���� �׸� ����...
			// DB�� Į���� ���� �����?
			
			if(categoriesA != null){
				dao.deleteExistingCategories(lastInsertedIdx);//				
				for(String str: categoriesA){
					System.out.println("selected Categories; " + str);
					categoriesMapToInsert.clear();
					categoriesMapToInsert.put("idx", lastInsertedIdx);
					categoriesMapToInsert.put("code", str);
					dao.insertCategories(categoriesMapToInsert);
				}
			}		
			
			if(stageCategoriesA!=null){
				dao.deleteExistingStageCategories(lastInsertedIdx);				
				for(String str: stageCategoriesA){
					System.out.println("selected Categories; " + str);
					categoriesMapToInsert.clear();
					categoriesMapToInsert.put("idx", lastInsertedIdx);
					categoriesMapToInsert.put("code", str);
					dao.insertStageCategories(categoriesMapToInsert);
				}
			}			
			
			if(requiredOutputA!=null){
				dao.deleteExistingRequiredOutputs(lastInsertedIdx);
				for(String str: requiredOutputA){
					categoriesMapToInsert.clear();		
					categoriesMapToInsert.put("idx", lastInsertedIdx);
					categoriesMapToInsert.put("code", str);
					dao.insertRequiredOutputs(categoriesMapToInsert);
				}
			}
		}else if(howTo.equals("toPost")){
			// save as open
			article.setPostStatus("02");	// open
			article.setPostDate(regdate);
			lastInsertedIdx = dao.insertPost(article);			
//			categoriesMapToInsert.put("idx", lastInsertedIdx);
			
			if(categoriesA != null){
				dao.deleteExistingCategories(lastInsertedIdx);			
				for(String str: categoriesA){					
					categoriesMapToInsert.clear();
					categoriesMapToInsert.put("idx", lastInsertedIdx);
					categoriesMapToInsert.put("code", str);
					dao.insertCategories(categoriesMapToInsert);
				}
			}
			
			if(stageCategoriesA!=null){
				dao.deleteExistingStageCategories(lastInsertedIdx);				
				for(String str: stageCategoriesA){				
					categoriesMapToInsert.clear();
					categoriesMapToInsert.put("idx", lastInsertedIdx);
					categoriesMapToInsert.put("code", str);
					dao.insertStageCategories(categoriesMapToInsert);
				}
			}
			
			if(requiredOutputA!=null){
				dao.deleteExistingRequiredOutputs(lastInsertedIdx);
				for(String str: requiredOutputA){
					categoriesMapToInsert.clear();			
					categoriesMapToInsert.put("idx", lastInsertedIdx);
					categoriesMapToInsert.put("code", str);
					dao.insertRequiredOutputs(categoriesMapToInsert);
				}
			}
		}
		
		return "redirect:/post/"+lastInsertedIdx;
	}

	@Override
	public String showSignInForm(
			HttpServletRequest request,
			RedirectAttributes redirectAttributes) throws Exception {
		// �̷̹α��� �Ǿ� �ִµ� ���˿� ġ�� ������ ���� ���� �������� �����̷�Ʈ��ų��.
		String designatedViewName = "signInForm";
		return redirectLoginUser(request, designatedViewName);
	}
	
	public String redirectLoginUser(HttpServletRequest request, String designatedViewName){
		HttpSession session = request.getSession();
		String returnView = "";		
		returnView = designatedViewName;
		int loginUserIdx = 0;
//		loginUserIdx = (String)session.getAttribute("loginUserIdx");
//		System.out.println("loginUserIdx" + loginUserIdx);
				
//		System.out.println(session.getAttribute("loginUserIdx").equals(null));
		if (session.getAttribute("loginUserIdx") != null){
			loginUserIdx = (Integer) session.getAttribute("loginUserIdx");
			//���ڰ� �ƴϸ��¥��?
			returnView="redirect:/user/" + loginUserIdx;
		}
		return returnView;
	}

	@Override
	public String signInSubmit(
			Model model,
			HttpServletRequest request)
			throws Exception {
		// TODO Auto-generated method stub
		String id_requested = request.getParameter("email");
		String pw_requested = request.getParameter("pword");
		int idx_returned = 0;		
		String resultmsg = "";		
		
		if (id_requested.trim().isEmpty() || id_requested == null || pw_requested.isEmpty() || pw_requested == null){
			// redirect to error page.
			resultmsg = "��Ȯ�� ID�� ��й�ȣ�� �Է��ϼ���.";
			request.setAttribute("resultmsg", resultmsg);
			return "signInForm";
		}else{		
			
			// all parameter is provided..
			// check if id/pw is correct
			Map<String, Object> map = new HashMap<String, Object>();
			map.clear();
			map.put("id", id_requested);
			map.put("pw", pw_requested);
			System.out.println("id: "+ id_requested);
			System.out.println("pw; "+ pw_requested);
			// check if the id(email address) and password are correct and get int idx of the email address(id)
			
			User loginUser = new User();

			loginUser = dao.getUserId(map);

			if(loginUser==null){
				resultmsg = "ID�� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.";
//				System.out.println(resultmsg);
				request.setAttribute("resultmsg", resultmsg);
				return "signInForm";
			}else{
				idx_returned = loginUser.getIdx();			
				
				request.setAttribute("loginUser", loginUser);
				
				HttpSession session = request.getSession();
				session.setAttribute("connected", "true");
				session.setMaxInactiveInterval(-1);
				session.setAttribute("loginUserIdx", loginUser.getIdx());
				String displayName = loginUser.getNickName();
				
				if(displayName == null){
					displayName = loginUser.geteMail();
				}
				System.out.println("loginUser.geteMail();"+loginUser.getIdx());
				System.out.println("loginUser.getNickName();"+loginUser.getNickName());
				System.out.println("displayName; " + displayName);
				session.setAttribute("loginUserName", displayName);
				
				// logging DB
				dao.loggingSignIn(loginUser.getIdx());
				
				return "redirect:/";
			}
		}
		
	}

	@Override
	public String logOut(HttpServletRequest request)
			throws Exception {
		HttpSession session = request.getSession();
		session.setAttribute("connected", "false");
		session.setAttribute("loginUserIdx", null);
		session.setAttribute("loginUserName", null);
		return "redirect:/";
	}

	@Override
	public String submitProfile(
			@PathVariable Integer idx, HttpServletRequest request)
			throws Exception {
		request.setCharacterEncoding("UTF-8");
		String returnValue="";
		
		//���� ��� ����ڿ� ���� ����� Ȯ��.
		HttpSession session = request.getSession();
		if (!session.getAttribute("loginUserIdx").equals(idx)){
			returnValue= "redirect:/error";
		}else{
			System.out.println("updating profile...");
			User userInfo = new User();
			userInfo.setIdx(idx);
			userInfo.setNickName(request.getParameter("nickName"));
			userInfo.setLegalName(request.getParameter("legalName"));
			userInfo.setAddress1(request.getParameter("address1"));
			userInfo.setAddress2(request.getParameter("address2"));
			userInfo.setBirthYearMonth(request.getParameter("birthYearMonth"));
			userInfo.setGender(request.getParameter("gender"));
			String[] interestingCategories = request.getParameterValues("categories");
			userInfo.setInterestingCategories(interestingCategories);
			userInfo.setAdditionalCareer(request.getParameter("additionalCareer"));
			userInfo.setSelfIntro(request.getParameter("selfIntro"));
			
			dao.updateUserProfile(userInfo);	
		
			returnValue = "redirect:/user/" + idx + "/p";
		}			
		return returnValue;
		
	}

	@Override
	public String getPost(
			@PathVariable Integer idx,
			HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		request = setUser(request);
		Board article = dao.getPost(idx);
		article.setCategoriesAL(dao.getPostCategories(article.getIdx()));
		article.setStageCategoriesAL(dao.getPostStageCategories(article.getIdx()));
		article.setRequiredOutputAL(dao.getPostRequiredOutputs(article.getIdx()));
				
		ArrayList<Comment> comments = new ArrayList<Comment>();
		comments = dao.getCommentList(idx);
		// �� select�ؿ��� �ϳ��� ����������??!!
		HttpSession session = request.getSession();
//		String loginUserIdx = session.getAttribute("loginUserIdx").toString();
		boolean isLoginUser = true;
		boolean isPostOwner = false;		
		if (session.getAttribute("loginUserIdx")==null)
			isLoginUser = false;		
//		if (loginUserIdx.equals(article.getWriterIdx()))
//			isPostOwner = true;
		if(getCurrentUser()!=null){
			if(article.getWriterIdx()==getCurrentUser().getIdx())
				isPostOwner = true;
//				if(article.getWriterIdx()==Integer.parseInt(loginUserIdx))
		}
		
			
		System.out.println("comments.size() of idx["+idx+"] : " + comments.size());
		request.setAttribute("article", article);
		request.setAttribute("comments", comments);
		request.setAttribute("isLoginUser", isLoginUser);
		request.setAttribute("isPostOwner", isPostOwner);
		request.setAttribute("loginUserIdx", session.getAttribute("loginUserIdx"));
		request = setUser(request);
		
		return "viewPost";
	}
	
	@Override
	public String getComment(
			@PathVariable Integer idx, 
			HttpServletRequest request) 
					throws Exception{
		String m = "";
		m = "comment list of idx;"+idx;
		request.setAttribute("m", m);
		
		return "comment";
	}
	
	@Override
	public String updateComment(
			@PathVariable Integer idx, 
//			@RequestParam(value="howTo", required=true) String howTo,
			HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("UTF-8");
		String howTo = request.getParameter("howTo");
		if(howTo.equals("rmvComment")){
			String commentId = request.getParameter("commentId");
			dao.removeComment(Integer.parseInt(commentId));
			System.out.println("removed comment #"+commentId);
		}else if(howTo.equals("reply")){
			
		}
		return "updateCommentResult";
	}
	
	@Override
	public String addComment(
			@PathVariable Integer idx, 
			HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("UTF-8");
		
		String m = "";
		Comment comment = new Comment();
		HttpSession session = request.getSession();
		int uIdx = (Integer) session.getAttribute("loginUserIdx");
		String regDate = LocalDateTime.now().toString();
				
//		comment.setChildComment(request.getParameter("isChildComment"));
		Integer parentCommentId = 0;
		Boolean isChildComment = false;
		Boolean isDeleted = false;
		System.out.println("parentCommentId is null? ;" + String.valueOf(request.getParameter("parentCommentId")));
//		System.out.println("parentCommentId; " + request.getParameter("parentCommentId"));
		if(!String.valueOf(request.getParameter("parentCommentId")).equals("")){
			parentCommentId = Integer.parseInt(request.getParameter("parentCommentId").toString());
			isChildComment = true;
		}
				
		comment.setWriterIdx(uIdx);
		comment.setContent(request.getParameter("comment"));
		comment.setRegDate(regDate);
		comment.setParentCommentId(parentCommentId);
		comment.setParentPostId(idx);		
		comment.setChildComment(isChildComment);		
		comment.setDeleted(isDeleted);	
		
		if (!isChildComment)
			dao.addComment(comment);
		else{
//			add 1 up to comment.seq
			dao.addReplyComment(comment);
		}
			
		m = "comment has been added..."+idx;
		
		this.addNotice();
		
//		System.out.println(m);
		
		return "redirect:/post/"+idx;
	}
	
	public String viewApplicationForm(
			@PathVariable int postIdx, 
			@PathVariable int applicationIdx, 
			HttpServletRequest request) throws Exception{
		
		request = setUser(request);
		
		Board article = new Board();
		Applicant writer = new Applicant();
		Application application = new Application();		
		
//		writer = dao.getUser((Integer)request.getSession().getAttribute("loginUserIdx"));
		writer = dao.getApplicant((Integer)request.getSession().getAttribute("loginUserIdx"));
		request.setAttribute("writer", writer);
		
		article = dao.getPost(postIdx);
		request.setAttribute("article", article);
		
		
		if(applicationIdx > 0){
//			0���� ũ�� �ش� ������ ��������
//			�ش� �������� ���� �ִ� ����� �ۼ��ڿ� ������ ��!
//			�������ڰ� �ۼ��� �Ǵ� �����ڰ� �ƴ϶�� ���� �������� �̵�	
			
//			�������� ���� �������� ����� ������ writer��ü�� ������ �����ͼ� �������ش�.
			System.out.println("application.status; " + application.getStatus());
			
		}else{
//			0�̸� �ű� �ۼ� �� �����ֱ�
			application.setWriterSchool(writer.getDisplaySchool());
			application.setWriterDegree(writer.getDisplayDegree());
			application.setWriterCompany(writer.getDisplayOrgName());
			application.setWriterRole(writer.getDisplayRole());
			application.setSelfIntro_copied(writer.getSelfIntro());
			application.setExpectingCost(article.getExpectingCost());
			application.setExpectingDays(article.getExpectingDays());		
			application.setIdx(0);
		}	
		
		request.setAttribute("application", application);
		return "applicationForm";
	}
	
	public String saveApplication(
			@PathVariable int postIdx, 
			@PathVariable int applicationIdx, 
			HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("UTF-8");
//		return to the view to check saved content
//		get the latest index application idx 
		int applicationIdxJustCreated = 0;
		String applicationStatusDesignated = request.getParameter("setApplicationStatus");
		Application application = new Application();
		String selfIntro_copied = request.getParameter("selfIntro_copied");
		String writerPlan = request.getParameter("writerPlan");
		String expectingCost = request.getParameter("expectingCost")
				== null?"0":request.getParameter("expectingCost");
		String expectingDays = request.getParameter("expectingDays")
				== null?"0":request.getParameter("expectingDays");
		
		String currentTime = LocalDateTime.now().toString();
		
		Integer loginUserIdx = 0;
		HttpSession session = request.getSession(true);
		if (!session.getAttribute("loginUserIdx").equals(null)){
			loginUserIdx = (Integer)session.getAttribute("loginUserIdx");
		}
		
		int writerIdx = loginUserIdx;
//		System.out.println("loginUserIdx;"+writerIdx);
		
		application.setWriterIdx(writerIdx);
		application.setPostIdx(postIdx);		
		application.setLastUpdatedDate(currentTime);
		application.setSelfIntro_copied(selfIntro_copied);
		application.setWriterPlan(writerPlan);
		application.setExpectingCost(Integer.parseInt(expectingCost));
		application.setExpectingDays(Integer.parseInt(expectingDays));		
		
		application.setStatus(applicationStatusDesignated);		
		if (applicationStatusDesignated.equals("DRAFT")){
//			������ ���λ��� �����ϰ� ���� �����Ѵ�.
			
		}else if(applicationStatusDesignated.equals("SUBMITTED")){
//			������ ���λ����� �ھ��ְ� ��� �ѱ��.
			Applicant writer = new Applicant();			
//			writer = dao.getUser((Integer)request.getSession().getAttribute("loginUserIdx"));
			writer = dao.getApplicant(writerIdx);
			application.setWriterSchool(writer.getDisplaySchool());
			application.setWriterDegree(writer.getDisplayDegree());
			application.setWriterCompany(writer.getDisplayOrgName());
			application.setWriterRole(writer.getDisplayRole());
			
		}else
			return "error";
		
		if (applicationIdx==0){
			application.setCreatedDate(currentTime);
//			insert			
			applicationIdxJustCreated = dao.createApplication(application);
			application.setIdx(applicationIdxJustCreated);
			
		}else{
//			update			
		}
//		System.out.println("application["+application.getIdx()+"] is being saved with status["+applicationStatusDesignated+"]...."+application.getLastUpdatedDate());
		return "redirect:/post/"+ postIdx +"/a/"+application.getIdx();
	}
	
	public String viewApplication(
			@PathVariable int postIdx, 
			@PathVariable int applicationIdx, 
			HttpServletRequest request) throws Exception{
		
		if(applicationIdx==0){
			return "redirect:/post/"+postIdx+"/a/"+applicationIdx+"/e";
		}else{
			Board article = new Board();
			Applicant writer = new Applicant();
			Application application = new Application();		
			
//			writer = dao.getUser((Integer)request.getSession().getAttribute("loginUserIdx"));
			writer = dao.getApplicant((Integer)request.getSession().getAttribute("loginUserIdx"));
			request.setAttribute("writer", writer);
			
			article = dao.getPost(postIdx);
			request.setAttribute("article", article);			
			application = dao.getApplication(applicationIdx);
			request.setAttribute("application", application);
		}
		System.out.println("loading application view...");
		
		return "applicationView";
	}
	
	@Override
	public String updateContact(
			@PathVariable int idx,
			@PathVariable int contactIdx,
			HttpServletRequest request) throws Exception{		
		
		String contactNumber = request.getParameter("contactNumber") 
				== null?"":request.getParameter("contactNumber");
		int userIdx=idx;
		String isMainContact = request.getParameter("isMainContact")
				== null?"0":request.getParameter("isMainContact");
//		String contactNumberIdx = request.getParameter("contactNumberIdx")
//				 == null?"":request.getParameter("contactNumberIdx");
		// ���� Ȯ��.
		
		Contact contact = new Contact();
		contact.setUserIdx(idx);
		contact.setContactNumber(contactNumber);
		contact.setMain(isMainContact);
//		System.out.println(isMainContact);
		
//		initialize main school if the new one is the main
		if(contact.isMain().equals("1"))
			dao.initiateMainContact(idx);
		
		if(contactIdx == 0){
			// add			
			dao.createNewContact(contact);
		}else{
			// ����...?
		}

		ArrayList<Contact> contactList = dao.getContactNumberList(idx);
		request.setAttribute("contactList", contactList);
		
		// gets all the contacts order by isMain and set it to the request attribute.
		return "updateContactResult";
	}
	
	@Override
	public String getContactList(
			@PathVariable int idx, 
			HttpServletRequest request) throws Exception{
		ArrayList<Contact> contactList = dao.getContactNumberList(idx);
		System.out.println("getting contactlist of user["+idx+"] total:"+ contactList.size());
		request.setAttribute("contactList", contactList);
		
		// gets all the contacts order by isMain and set it to the request attribute.
		return "updateContactResult";
	}
	
	@Override
	public String updateSchool(
			@PathVariable int idx, 
			@PathVariable int schoolIdx, 
			HttpServletRequest request) 
					throws Exception{
		// ���� Ȯ��.
		// get request parameter and store them.
		String school = request.getParameter("school");
		String degree = request.getParameter("degree");
		String startYear = request.getParameter("school_startYear");
		String startMonth = request.getParameter("school_startMonth");
		String endYear = request.getParameter("school_endYear");
		String endMonth = request.getParameter("school_endMonth");
		String isMainSchool = request.getParameter("isMainSchool")
				== null?"0":request.getParameter("isMainSchool");
		AcademicBackground schoolInfo = new AcademicBackground();
		schoolInfo.setSchoolName(school);
		schoolInfo.setDegree(degree);
		schoolInfo.setStartYear(startYear);
		schoolInfo.setStartMonth(startMonth);
		schoolInfo.setEndYear(endYear);
		schoolInfo.setEndMonth(endMonth);
		schoolInfo.setIsMain(isMainSchool);
		schoolInfo.setUserIdx(idx);		
		
//		initialize main school if the new one is the main
		if(schoolInfo.getIsMain().equals("1"))
			dao.initializeMainSchool(idx);
		if(schoolIdx==0){
			//add...
			dao.createNewSchool(schoolInfo);
		}else{
			
		}
		ArrayList<AcademicBackground> schoolList = dao.getSchoolList(idx);
		request.setAttribute("schoolList", schoolList);
		
		return "updateSchoolResult";
	}
	
	@Override
	public String getSchoolList(
			@PathVariable int idx, 
			HttpServletRequest request) throws Exception{
		ArrayList<AcademicBackground> schoolList = dao.getSchoolList(idx);
		request.setAttribute("schoolList", schoolList);
		
		return "updateSchoolResult";
	}
	
	@Override
	public String updateCareer(
			@PathVariable int idx, 
			@PathVariable int careerIdx, 
			HttpServletRequest request) 
					throws Exception{
		String orgName = request.getParameter("orgName");
		String role = request.getParameter("role");
		String startYear = request.getParameter("career_startYear");
		String startMonth = request.getParameter("career_startMonth");
		String endYear = request.getParameter("career_endYear");
		String endMonth = request.getParameter("career_endMonth"); 
		String isMainCareer = request.getParameter("isMainCareer")
				== null?"0":request.getParameter("isMainCareer");
		Career career = new Career();
		career.setOrgName(orgName);
		career.setRole(role);
		career.setStartYear(startYear);
		career.setStartMonth(startMonth);
		career.setEndYear(endYear);
		career.setEndMonth(endMonth);
		career.setIsMain(isMainCareer);
		career.setUserIdx(idx);
		
		System.out.println("startYear of career;"+startYear);
		if(career.getIsMain().equals("1"))
			dao.initializeMainCareer(idx);
		
		if(careerIdx==0){
			dao.createNewCareer(career);
		}else{
			
		}		
		
		ArrayList<Career> careerList = dao.getCareerList(idx);
		request.setAttribute("careerList", careerList);
		
		return "updateCareerResult";
	}
	
	@Override
	public String getCareerList(
			@PathVariable int idx, 
			HttpServletRequest request) 
					throws Exception{
		ArrayList<Career> careerList = dao.getCareerList(idx);
		request.setAttribute("careerList", careerList);
		return "updateCareerResult";
	}
	
	@Override
	public String deleteContact(
			@PathVariable int contactIdx,
			@PathVariable int userIdx,
			HttpServletRequest request) 
					throws Exception{
		dao.deleteContact(contactIdx);
		ArrayList<Contact> contactList = dao.getContactNumberList(userIdx);		
		request.setAttribute("contactList", contactList);
		return "updateContactResult";
	}
	
	public int getLoginUserIdx(HttpServletRequest request){
		Integer loginUserIdx = 0;
		HttpSession session = request.getSession(true);
		if (!session.getAttribute("loginUserIdx").equals(null)){
			loginUserIdx = (Integer)session.getAttribute("loginUserIdx");
		}
		return loginUserIdx;
	}
	
	public String viewApplicationList(
			@PathVariable Integer idx, 
			HttpServletRequest request) throws Exception{
//		������ ��� ���� �ִ� ����� ������ ����� ������ ��!
		request = setUser(request);
//		���� ����ڰ� ������ ���� ���� �ִ��� Ȯ��!
		Board article = new Board();
		article = dao.getPost(idx);
		Integer writerIdx = article.getWriterIdx();
		if(this.getLoginUserIdx(request) != article.getWriterIdx()){
			System.out.println(
					"this.getLoginUserIdx(request)==article.getWriterIdx() ? "
					+ (this.getLoginUserIdx(request)==article.getWriterIdx()));
			request.setAttribute("errMessage", "������ ��Ȳ�� �����ڸ� ������ �� �ֽ��ϴ�.");
			return "error";
		} else{
			ArrayList<Application> applicationList = dao.getApplicationListOfaPost(idx);
			request.setAttribute("applicationList", applicationList);
			request.setAttribute("article", article);			
		}
		
		return "applicationList";
	}
	
	public String getAdvisoryList(
			@RequestParam(value="tab", required=false) String tab,
			@RequestParam(value="s", required=false) String sort,
			HttpServletRequest request) throws Exception{
		
//		tab; category
//		sort; sorting option
//		how to sorting; in javaClass not sql
		String postType;
		postType= "a";		// advisory �˻���..
		
//		System.out.println("tab=?"+tab);
		request = getPostList(request, postType);
		
		return "viewPostList";
	}
	public String getProjectList(
			@RequestParam(value="tab", required=false) String tab,
			@RequestParam(value="s", required=false) String sort,
			HttpServletRequest request) throws Exception{
//		tab; category
//		sort; sorting option
//		how to sorting; in javaClass not sql
		String postType;
		postType= "p";		// project �˻���..
		
//		System.out.println("tab=?"+tab);
		request = getPostList(request, postType);
		
		
		return "viewPostList";		
		
	}
	
	public HttpServletRequest getPostList(HttpServletRequest request, String postType) throws Exception{
		
		request = setUser(request);
		ArticleForList param_article = new ArticleForList();
		ArrayList<ArticleForList> articleList = new ArrayList<ArticleForList>();
		// set post type to get...
		
//		postType= "p";		// ������Ʈ �˻� ��..
		String pageTitle = "����ڹ�";
		if (postType.equals("a"))
			pageTitle =  "����ڹ�";
		else if(postType.equals("p"))
			pageTitle = "������Ʈ";
		param_article.setPostType(postType);
		
		articleList = dao.getArticleList(param_article);
		System.out.println("articleList.size();"+articleList.size());
		request.setAttribute("articleList", articleList);		
		request.setAttribute("pageTitle", pageTitle);
		request.setAttribute("postListType", postType);
		return request;
	}
	
	public String getSHA256(String str){
		String SHA = ""; 
		try{
			MessageDigest sh = MessageDigest.getInstance("SHA-256"); 
			sh.update(str.getBytes()); 
			byte byteData[] = sh.digest();
			StringBuffer sb = new StringBuffer(); 
			for(int i = 0 ; i < byteData.length ; i++){
				sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
			}
			SHA = sb.toString();
			
		}catch(NoSuchAlgorithmException e){
			e.printStackTrace(); 
			SHA = null; 
		}
		return SHA;
	}
	
//	public String testGetSecurityCode(
//			String str,
//			HttpServletRequest request) throws Exception{
//		String secuCode = getSHA256(str);
//		 
//		request.setAttribute("secuCode", secuCode);
//		System.out.println("secu code: " + secuCode);
//		
//		return null;
//	}
	
	public void addNotice(
//			int reciever, 
//			String noticeBody
			){
//		�������� �˸����ΰ�?
//		������ ���õ� ���ΰ�?
//		���ϴ� ������ �����ΰ�?
		
		System.out.println("adding notice");
	}
	
//	jsp page���� ����� ��ü Ȱ���ϰ� �� ����. 
	public HttpServletRequest setUser(HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		
		int loginUserIdx = 0;//		
		if (session.getAttribute("loginUserIdx") != null)
			loginUserIdx = (Integer) session.getAttribute("loginUserIdx");	
					
		User user = (User)dao.getUser(loginUserIdx);
//		this.setCurrentUser(user);
		setCurrentUser(user);
		request.setAttribute("loginUser", user);
		
		return request;		
	}

	public static User getCurrentUser() {
		return currentUser;
	}

	public static void setCurrentUser(
			User currentUser) {
		BoardService.currentUser = currentUser;
	}
	
//	@Override
//	public String showEmailAddressForm(
//			HttpServletRequest request) throws Exception{		
//		return "emailForm_forgotPassword";
//	}
//	@Override
//	public String validateEmailAddress(
//			HttpServletRequest request) throws Exception{
//		request.setCharacterEncoding("UTF-8");
//		System.out.println(request.getParameter("email"));
//		return "resetPassword_requestSecurityCode";
//	}
//	@Override
//	public String validateSecurityCode(
//			@RequestParam(value="c", required=true) String securityCode,
//			HttpServletRequest request) throws Exception{
//		return null;
//	}
}

