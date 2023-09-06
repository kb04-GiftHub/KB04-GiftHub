package mulcam.kb04.gifthub.GiftHub.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mulcam.kb04.gifthub.GiftHub.repository.GiftUsedRepository;

@Service
public class GiftUsedService {

	@Autowired
	private GiftUsedRepository giftUsedRepository;

	public long getCountBetweenDates(Date startDate, Date endDate) {
		return giftUsedRepository.countByUsedDateBetween(startDate, endDate);
	}
}
