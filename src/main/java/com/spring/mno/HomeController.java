package com.spring.mno;

import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.mno.common.Criteria;
import com.spring.mno.community.domain.CommunityVO;
import com.spring.mno.community.service.CommunityService;

/**
 * Handles requests for the application home page.
 */
@Controller
	public class HomeController {
		@RequestMapping(value="/",method =RequestMethod.GET)
		public String home(Model model) {
			Date date=new Date();
			model.addAttribute("serverTime",date);
			return "home";
		}
	}
	

