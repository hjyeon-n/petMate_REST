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
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.ssd.petMate.domain.Gpurchase;
import com.ssd.petMate.domain.GpurchaseCart;
import com.ssd.petMate.domain.GpurchaseLineItem;
import com.ssd.petMate.domain.Order;
import com.ssd.petMate.service.GLineItemFacade;
import com.ssd.petMate.service.GpurchaseFacade;
import com.ssd.petMate.service.OrderFacade;

@Controller
@SessionAttributes({"cartList", "price"})
public class OrderController {	
	
	@Autowired
	private OrderFacade orderFacade;
	
	@Autowired
	private GLineItemFacade gLineItemFacade;
	
	@Autowired
	private GpurchaseFacade gpurchaseFacade;
	
	@ModelAttribute("gpurchaseOrder")
	public Order formBacking(HttpServletRequest request) {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			Order order = new Order();
			order.setPrice((int)request.getSession().getAttribute("price"));
			return order;
		}
		else
			return new Order();
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
	
	//공구게시판 장바구니 삭제
	@Transactional
	@ResponseBody
	@DeleteMapping("/gpurchase-cart/{boardNum}")
	public String gpurchaseCartDelete(HttpServletRequest request,
			@PathVariable(required = false) int boardNum) {
		String userID = (String) request.getSession().getAttribute("userID");
		Gpurchase gpurchase = gpurchaseFacade.getGpurchaseDetail(boardNum);
		GpurchaseCart gpurchaseCart = new GpurchaseCart(userID, boardNum);
		
		gpurchaseFacade.deleteGpurchaseCart(gpurchaseCart);
		
//		좋아요 개수 가지고 오기
		int cartAdded = gpurchaseFacade.countCartByboardNum(boardNum);
//		좋아요 개수 update
		gpurchase.setCartAdded(cartAdded);
		gpurchaseFacade.gpurchaseCartUpdate(gpurchase);
		
		return "success";
	}	
	
	//장바구니 -> 오더 주문 리스트 이동
	@PostMapping(value = "/gpurchase-cart/order", produces="application/text; charset=utf8")
	@ResponseBody
	public String gpurchaseCartToOrder(@RequestParam(value = "gpurchaseCartList[]") List<String> gpurchaseCartList, @RequestParam(value = "price") Integer price, Model model) {
		int i;
		Gpurchase gpurchase;
		List<Gpurchase> cartList = new ArrayList<Gpurchase>();
		int size = cartList.size();
		for(i = 0; i < size; i++) {
			gpurchase = gpurchaseFacade.getGpurchaseDetail(Integer.parseInt(gpurchaseCartList.get(i)));
			cartList.add(gpurchase);
		}
		model.addAttribute("cartList", cartList);
		model.addAttribute("price", price);
		String result = "주문하시겠습니까?";
		return result;
	}
	
	@GetMapping("/gpurchase/order")
	public String gpurchaseOrderForm() {
		return "order/GpaymentForm";
	}
	
	//공구게시판 주문
	@Transactional
	@PostMapping("/gpurchase/order")
	public String gpurchaseOrder(@Valid @ModelAttribute("gpurchaseOrder") Order order, BindingResult result,
			@ModelAttribute("cartList") List<Gpurchase> cartList, HttpServletRequest request, SessionStatus status) {
			
			if (result.hasErrors()) {
				return "order/GpaymentForm";
			}
			
			String userID = (String) request.getSession().getAttribute("userID");
			order.setUserID(userID);
			GpurchaseCart gpurchaseCart;
			Gpurchase gpurchase;
			
			//order 생성
			orderFacade.insertOrder(order);
			int orderNum = order.getOrderNum();
			
			//orderNum에 대한 lineItem 매칭
			GpurchaseLineItem gLineItem = new GpurchaseLineItem();
			
			for(int i = 0; i < cartList.size(); i++) {
				gLineItem.CartToLineItem(cartList.get(i), orderNum);
				gLineItemFacade.insertGpurchaseLineItem(gLineItem);
				gpurchaseFacade.updateParticipant(cartList.get(i).getBoardNum());
			}
			
			//cart제거(주문한 상품 장바구니에서 제거)
			for(int i = 0; i < cartList.size(); i++) {
//				해당하는 cart 정보 가져오기
				gpurchaseCart = new GpurchaseCart(userID, cartList.get(i).getBoardNum());
//				cart 정보 삭제 
				gpurchaseFacade.deleteGpurchaseCart(gpurchaseCart);
//				해당 boardNum에서 장바구니 담은 수 조정
				gpurchase = gpurchaseFacade.getGpurchaseDetail(cartList.get(i).getBoardNum());
				int cartAdded = gpurchaseFacade.countCartByboardNum(cartList.get(i).getBoardNum());
				gpurchase.setCartAdded(cartAdded);
				gpurchaseFacade.gpurchaseCartUpdate(gpurchase);
			}
			
			status.setComplete();
		return "order/commit";
	}	
}