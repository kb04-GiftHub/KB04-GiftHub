package mulcam.kb04.gifthub.GiftHub.serviceimpl;

import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mulcam.kb04.gifthub.GiftHub.repository.GiftUsedRepository;
import mulcam.kb04.gifthub.GiftHub.service.GiftUsedService;

@Service
public class GiftUsedServiceImpl implements GiftUsedService {
	@Autowired
	private GiftUsedRepository giftUsedRepository;

	@Override
	public Long getCountByMonth(int month) {
		return giftUsedRepository.countByMonth(month);
	}
}
