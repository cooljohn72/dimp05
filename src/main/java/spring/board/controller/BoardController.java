package spring.board.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.beans.*;

@Controller	// 컨트롤러 등록
public abstract class BoardController {
	
	@RequestMapping("/")	// done..
	public abstract String landing(HttpServletRequest request);	
	
	//--- 사용자 정보 가져오
	@RequestMapping(value="/user/{idx}", method=RequestMethod.GET)	//--- 요거도 된다... 
	public abstract String showUser(@PathVariable Integer idx, HttpServletRequest request) throws Exception;
	
	@RequestMapping(value="/user/{idx}/p/edit", method=RequestMethod.POST)
	public abstract String submitProfile(@PathVariable Integer idx, HttpServletRequest request) throws Exception;
	
	//--- activity, 보관함(folder), 개인정보, 알림 가져오기 
	@RequestMapping(value="/user/{idx}/{target}", method=RequestMethod.GET)
	public abstract String showUserInfo(
			@PathVariable Integer idx, 
			@PathVariable String target, 
			HttpServletRequest request) throws Exception;
	
//	//--- 개인정보 수정 폼 가져오기 tab: b(basic), c(career)
//	@RequestMapping(value="/user/{idx}/p/edit/{tab}", method=RequestMethod.GET)	
//	public abstract String showProfileEditForm(
//			@PathVariable Integer idx, 
//			@PathVariable String tab, 
//			Model model);
//	
//	//--- 개인정보 수정 하기.
//	@RequestMapping(value="/user/{idx}/p/edit/{tab}", method=RequestMethod.POST)
//	public abstract String updateProfile(
//			@PathVariable Integer idx, 
//			@PathVariable String tab, 
//			RedirectAttributes redirectAttrs,
//			HttpServletRequest request);
//	
	
//	@RequestMapping(value="/user/{idx}/activity", method=RequestMethod.GET)
//	public abstract String showActivity(@PathVariable Integer idx);
//	
//	@RequestMapping(value="/requestactivation", method=RequestMethod.GET)
//	public abstract String showActivationRequest(
//			HttpServletRequest request, 
//			RedirectAttributes redirectAttributes) throws Exception;
//	public abstract String showActivationRequest(@PathVariable Integer idx, HttpServletRequest request) throws Exception;
	@RequestMapping(value="/requestactivation", method=RequestMethod.POST)
	public abstract String generateActivationCode(
			HttpServletRequest request, 
			RedirectAttributes redirectAttributes) throws Exception;
	
	@RequestMapping(value="/validateUser", method=RequestMethod.GET)
	public abstract String checkActivationCode(
			@RequestParam(value="c", required=true) String code,
			HttpServletRequest request,			
			RedirectAttributes redirectAttributes) throws Exception; 

	// sign up
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public abstract String showSignUp(HttpServletRequest request);
	
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public abstract String signUpSubmit(
			Model model, 
			HttpServletRequest request, 
			RedirectAttributes redirectAttributes) throws Exception;
	
	@RequestMapping(value="/signin", method=RequestMethod.GET)
	public abstract String showSignInForm(
			HttpServletRequest request, 
			RedirectAttributes redirectAttributes) throws Exception;
	
	@RequestMapping(value="/logout")
	public abstract String logOut(HttpServletRequest request) throws Exception;
	
	@RequestMapping(value="/signin", method=RequestMethod.POST)
	public abstract String signInSubmit(Model model, HttpServletRequest request) throws Exception;
	
		
	// setting up nick name
	@RequestMapping(value="/nickName/{idx}", method=RequestMethod.GET)
	//public abstract ModelAndView showNickNameForm(HttpServletRequest request) throws Exception;
	public abstract ModelAndView showNickNameForm(
			@PathVariable Integer idx
			, HttpServletRequest request
			, @ModelAttribute User user) throws Exception;
	
	@RequestMapping(value="/nickName", method=RequestMethod.POST)
	public abstract String nickNameSubmit(Model model, HttpServletRequest request) throws Exception;
		
	@RequestMapping(value = "/final", method = RequestMethod.GET)
	public abstract String finalPage();
	
//	##나중에 고치자.	
//		/post/{idx};GET --> view form 
//		/post/{idx}:POST--> save form if idx==0:insert, idx>=0:update  
	@RequestMapping(value="/new/post", method=RequestMethod.GET)
	public abstract String getNewPostForm(Model model, HttpServletRequest request);
	
	@RequestMapping(value="/new/post", method=RequestMethod.POST)
	public abstract String saveNewPost(Model model, HttpServletRequest request) throws Exception;
//	##/. 나중에 고치
	@RequestMapping(value="/post/{idx}", method=RequestMethod.GET)
	public abstract String getPost(@PathVariable Integer idx, HttpServletRequest request) throws Exception;
//	public abstract String getPost(@PathVariable idx, HttpServletRequest request);
	
	@RequestMapping(value="/post/{idx}/comment", method=RequestMethod.GET)
	public abstract String getComment(@PathVariable Integer idx, HttpServletRequest request) throws Exception;
	
	@RequestMapping(value="/post/{idx}/comment", method=RequestMethod.POST)
	public abstract String addComment(@PathVariable Integer idx, HttpServletRequest request) throws Exception;
	
//	@RequestMapping(value="/post/{idx}/C?howTo={howTo}", method=RequestMethod.POST)
	@RequestMapping(value="/post/{idx}/C", method=RequestMethod.POST)
	public abstract String updateComment(
			@PathVariable Integer idx, 
//			@RequestParam(value="howTo", required=true) String howTo,
			HttpServletRequest request) throws Exception;
	
//	ApplicationS
	@RequestMapping(value="/post/{idx}/as", method=RequestMethod.GET)
	public abstract String viewApplicationList(@PathVariable Integer idx, HttpServletRequest request) throws Exception;
	
//	## application 
//	view application form
	@RequestMapping(value="/post/{postIdx}/a/{applicationIdx}", method=RequestMethod.GET)
	public abstract String viewApplication(
			@PathVariable int postIdx, 
			@PathVariable int applicationIdx, 
			HttpServletRequest request) throws Exception;
	
//	editing form
//	@RequestMapping(value="/post/{postIdx}/application/edit/{applicationIdx}", method=RequestMethod.GET)
	@RequestMapping(value="/post/{postIdx}/a/{applicationIdx}/e", method=RequestMethod.GET)
	public abstract String viewApplicationForm(
			@PathVariable int postIdx, 
			@PathVariable int applicationIdx, 
			HttpServletRequest request) throws Exception;
	
	@RequestMapping(value="/post/{postIdx}/a/{applicationIdx}/e", method=RequestMethod.POST)
	public abstract String saveApplication(
			@PathVariable int postIdx, 
			@PathVariable int applicationIdx, 
			HttpServletRequest request) throws Exception;
	
//	##/. application
	
//	## handling contact from here
	@RequestMapping(value="/user/addContact/{idx}/{contactIdx}", method=RequestMethod.POST)
	public abstract String updateContact(
			@PathVariable int idx, 
			@PathVariable int contactIdx, 
			HttpServletRequest request) 
					throws Exception;
	
	@RequestMapping(value="/user/contactList/{idx}", method=RequestMethod.GET)
	public abstract String getContactList(
			@PathVariable int idx, 
			HttpServletRequest request) 
					throws Exception;
	
	@RequestMapping(value="/user/contactList/remove/{contactIdx}/{userIdx}", method=RequestMethod.POST)
	public abstract String deleteContact(
			@PathVariable int contactIdx, 
			@PathVariable int userIdx,
			HttpServletRequest request) 
					throws Exception;
	
//	##/. handling contact
//	학력 추가하기 
	@RequestMapping(value="/user/addSchool/{idx}/{schoolIdx}", method=RequestMethod.POST)
	public abstract String updateSchool(
			@PathVariable int idx, 
			@PathVariable int schoolIdx, 
			HttpServletRequest request) 
					throws Exception;
	
	@RequestMapping(value="/user/schoolList/{idx}", method=RequestMethod.GET)
	public abstract String getSchoolList(
			@PathVariable int idx, 
			HttpServletRequest request) 
					throws Exception;
	
	
//	경력 추가하기 
	@RequestMapping(value="/user/addCareer/{idx}/{careerIdx}", method=RequestMethod.POST)
	public abstract String updateCareer(
			@PathVariable int idx, 
			@PathVariable int careerIdx, 
			HttpServletRequest request) 
					throws Exception;
//	getting career list
	@RequestMapping(value="/user/careerList/{idx}", method=RequestMethod.GET)
	public abstract String getCareerList(
			@PathVariable int idx, 
			HttpServletRequest request) 
					throws Exception;
	
	@RequestMapping(value="/advisory", method=RequestMethod.GET)
	public abstract String getAdvisoryList(
			@RequestParam(value="tab", required=false) String tab,
			@RequestParam(value="s", required=false) String sort,
			HttpServletRequest request) throws Exception;
	
	@RequestMapping(value="/project", method=RequestMethod.GET)
	public abstract String getProjectList(
			@RequestParam(value="tab", required=false) String tab,
			@RequestParam(value="s", required=false) String sort,
			HttpServletRequest request) throws Exception;
	
////	1. request email address submit form
//	@RequestMapping(value="/resetpassword", method=RequestMethod.GET)
//	public abstract String showEmailAddressForm(
//			HttpServletRequest request) throws Exception;
////	2. submit email and issues security code if available email address
//	@RequestMapping(value="/resetpassword", method=RequestMethod.POST)
//	public abstract String validateEmailAddress(
//			HttpServletRequest request) throws Exception;
////	3. check the security code and show new password form if the code is correct
//	@RequestMapping(value="/resetpassword/?c={securityCode}", method=RequestMethod.GET)
//	public abstract String validateSecurityCode(
//			@RequestParam(value="c", required=true) String securityCode,
//			HttpServletRequest request) throws Exception;
////	4. update the new password
	
//	@RequestMapping(value="/scodetest/{str}")
//	public abstract String testGetSecurityCode(
//			@PathVariable String str,
//			HttpServletRequest request) throws Exception; 
}