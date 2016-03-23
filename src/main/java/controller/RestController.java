package controller;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.web.dao.SpringDao;


@Controller
public class RestController {
	
	@Autowired
	private SpringDao dao;
		
	@RequestMapping("/ibatisTest")
	public void ibatisTest(){
		ArrayList<String> list = new ArrayList<String>();
			try {
				list = dao.ibatisTest();
	    		        for(String str : list) {
	    			       System.out.println(str);	//왜 결과가 중복으로 찍히지...쩝... 일단 신경쓰지마... 나중에select문에서도 동일한 상황 생기면 그때 보자.
	       		        }
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String landing(ModelMap model) {
		model.addAttribute("msg", "OracleJava Community Spring4");
		
		return "index";
	}
	
	@RequestMapping(value="/signUp", method=RequestMethod.GET)
	public String showSignUp()
	{
		return "signupForm";
	}
	
	
//	
//	@RequestMapping(value="/hello", method=RequestMethod.GET)
//	public String hello(ModelMap model) {
//		model.addAttribute("msg", "OracleJava Community Spring4");
//		
//		return "hello";
//	}
//	
//	//아래 hi 메소드로 들어오는 인자값은 URL경로의일부로 넘겨줘야 한다.
//	//http://localhost:8080/spring4rest/hi/oraclejavacommunity
//	// ---> msg에 oraclejavacommunity문자열이 할당
//	@RequestMapping(value="/hi/{msg}", method=RequestMethod.GET)
//	public String hi(@PathVariable String msg, ModelMap model) {
//		model.addAttribute("msg",msg);
//		return "hello";
//	}
//	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String WritePost()
	{
		return "write";
	}
	
	@RequestMapping("/user")	//--- 요거도 된다... 
	public String showUser()
	{
		return "user";
	}
//	
//	@RequestMapping(value="/user", method=RequestMethod.GET)
//	public String showUser()
//	{
//		return "user";
//	}
//	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String showList()
	{
		return "list";
	}
//	
//	@RequestMapping("/detect-device")
//    public @ResponseBody String detectDevice(Device device) {
//        String deviceType = "unknown";
//        if (device.isNormal()) {
//            deviceType = "normal";
//        } else if (device.isMobile()) {
//            deviceType = "mobile";
//        } else if (device.isTablet()) {
//            deviceType = "tablet";
//        }
//        return "Hello " + deviceType + " browser!";
//    }
//	
}
