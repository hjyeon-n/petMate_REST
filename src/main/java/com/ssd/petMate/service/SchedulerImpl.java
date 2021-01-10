package com.ssd.petMate.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssd.petMate.dao.GpurchaseCartDao;
import com.ssd.petMate.dao.GpurchaseDao;
import com.ssd.petMate.domain.Gpurchase;

@Service
@Transactional
public class SchedulerImpl implements SchedulerFacade { 
	
	@Autowired
	private GpurchaseDao gpurchaseDao;
	
	@Autowired
	private GpurchaseCartDao gpurchaseCartDao;
	
	@Autowired		// applicationContext.xml에 정의된 scheduler 객체를 주입 받음
	private ThreadPoolTaskScheduler scheduler;
	
	public void testScheduler(Date edate, int boardNum) {
		Runnable updateTableRunner = new Runnable() {	
			// anonymous class 정의
			@Override
			public void run() {   // 스케쥴러에 의해 미래의 특정 시점에 실행될 작업을 정의			
				System.out.println("update!!");
				Gpurchase gpurchase = gpurchaseDao.getGpurchaseDetail(boardNum);
				String boardTitle = gpurchase.getBoardTitle();
				String newTitle = "";
				if (gpurchase.getGoalNum() <= gpurchase.getParticipant()) {
					gpurchase.setStatus("success");
					gpurchaseDao.updateResult(gpurchase);
					newTitle = "[공구성공]" + boardTitle;
				}
				else {
					gpurchase.setStatus("fail");
					gpurchaseDao.updateResult(gpurchase);
					newTitle = "[공구실패]" + boardTitle;
				}
				gpurchase.setBoardTitle(newTitle);
				gpurchaseDao.updateGpurchase(gpurchase);
				gpurchaseCartDao.deleteFinished();
			}
		};
		// 스케줄 생성: edate에 updateTableRunner.run() 메소드 실행
		scheduler.schedule(updateTableRunner, edate);  
		
		System.out.println("updateTableRunner has been scheduled to execute at " + edate);
	}
}