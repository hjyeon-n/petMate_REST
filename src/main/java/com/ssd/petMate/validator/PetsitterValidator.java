package com.ssd.petMate.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.ssd.petMate.domain.Petsitter;

public class PetsitterValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Petsitter.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Petsitter petsitter = (Petsitter) target;
		
		//게시글 제목, 내용 입력 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "boardTitle", "blank");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "boardContent", "blank");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "petLocal", "blank");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "petAddress", "blank");
		
		//게시글 제목 길이
		if (petsitter.getBoardTitle().length() > 25) {
			errors.rejectValue("boardTitle", "long");
		}
		
		//펫시터 게시판 옵션 체크
		if (Integer.parseInt(petsitter.getPetSize()) == 0) {
			errors.rejectValue("sizeCodes", "check");
		}
		
		if (Integer.parseInt(petsitter.getPetDay()) == 0) {
			errors.rejectValue("dayCodes", "check");
		}
		
		if (petsitter.getPetPrice() < 15000 | petsitter.getPetPrice() > 25000) {
			errors.rejectValue("petPrice", "price");
		}
		
		if (petsitter.getPetAddress().length() > 20) {
			errors.rejectValue("petAddress", "addressLength");
		}
		
	}

}
