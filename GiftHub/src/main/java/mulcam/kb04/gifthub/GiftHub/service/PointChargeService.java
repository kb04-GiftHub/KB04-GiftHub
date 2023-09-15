package mulcam.kb04.gifthub.GiftHub.service;

import org.springframework.stereotype.Service;

import mulcam.kb04.gifthub.GiftHub.dto.CustomerDto;
import mulcam.kb04.gifthub.GiftHub.dto.PointChargeDto;

@Service
public interface PointChargeService {
	public CustomerDto findByCustomerId(String id);
	public void save(PointChargeDto chargeDto);
}