package com.ssd.petMate.Controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import com.ssd.petMate.domain.Order;
import com.ssd.petMate.domain.Secondhand;
import com.ssd.petMate.domain.SecondhandCart;
import com.ssd.petMate.domain.SecondhandLineItem;
import com.ssd.petMate.service.OrderFacade;
import com.ssd.petMate.service.SLineItemFacade;
import com.ssd.petMate.service.SecondhandFacade;

@Controller
@SessionAttributes({"sCartList","sprice"})
public class SOrderController {	
	
	@Autowired
	private OrderFacade orderImpl;
	
	@Autowired
	private SLineItemFacade sLineItemImpl;
	
	@Autowired
	private SecondhandFacade secondhandImpl;
	
	@ModelAttribute("secondhandOrder")
	public Order formBacking2(HttpServletRequest request) {
		Order order = new Order();
		if (request.getMethod().equalsIgnoreCase("GET")) 
			order.setPrice((int)request.getSession().getAttribute("sprice"));
		return order;
		
	}
	
	@ModelAttribute("bankList")
	public List<String> bankList() {
		List<String> bankList = new ArrayList<String>();
		bankList.add("BC");
		bankList.add("하나");
		bankList.add("우리");
		bankList.add("신한");
		bankList.add("삼성");
		bankList.add("현대");
		bankList.add("롯데");
		bankList.add("KB");
		bankList.add("NH");
		bankList.add("외환");
		return bankList;
	}
	
	//장바구니 -> 오더
	@PostMapping(value = "/secondhand-cart/order", produces="application/text; charset=utf8")
	@ResponseBody
	public String secondhandCartToOrder(@RequestParam(value = "secondhandCartList[]") List<String> secondhandCartList, @RequestParam(value = "sprice") Integer sprice, Model model) {
		int i;
		Secondhand secondhand;
		List<Secondhand> sCartList = new ArrayList<Secondhand>();
		for(i = 0; i < secondhandCartList.size(); i++) {
			secondhand = secondhandImpl.getSecondhandDetail(Integer.parseInt(secondhandCartList.get(i)));
			sCartList.add(secondhand);
		}
		model.addAttribute("sCartList", sCartList);
		model.addAttribute("sprice", sprice);
		String result = "주문하시겠습니까?";
		return result;
	}
	
	@GetMapping("/secondhand/order")
	public String secondhandOrderForm(@ModelAttribute("sCartList") List<Secondhand> sCartList) {
		return "order/SpaymentForm";
	}
	
	
	//공구게시판 주문
	@Transactional
	@PostMapping("/secondhand/order")
	public String secondhandOrder(@Valid @ModelAttribute("secondhandOrder") Order order, BindingResult result ,@ModelAttribute("sCartList") List<Secondhand> sCartList, HttpServletRequest request, SessionStatus status) {
			
			if (result.hasErrors()) {
				return "order/SpaymentForm";
			}
			Secondhand secondhand;
			SecondhandCart secondhandCart;
			String userID = (String) request.getSession().getAttribute("userID");
			order.setUserID(userID);
			orderImpl.insertOrder(order);
			int orderNum = order.getOrderNum();
			SecondhandLineItem sLineItem = new SecondhandLineItem();
			for(int i = 0; i < sCartList.size(); i++) {
				sLineItem.CartToLineItem(sCartList.get(i), orderNum);
				sLineItemImpl.insertSecondhandLineItem(sLineItem);
				secondhand = sCartList.get(i);
				secondhand.setBoardTitle("[판매완료] " + sCartList.get(i).getBoardTitle());
				secondhandImpl.secondhandIsSold(sCartList.get(i));
			}
			for(int i = 0; i < sCartList.size(); i++) {
				secondhandCart = new SecondhandCart(userID, sCartList.get(i).getBoardNum());
				secondhandImpl.deleteSecondhandCart(secondhandCart);
			}
			status.setComplete();
		return "order/commit";
	}	
}