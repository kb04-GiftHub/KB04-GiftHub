package mulcam.kb04.gifthub.GiftHub.service;

import java.util.List;

import org.springframework.stereotype.Service;

import mulcam.kb04.gifthub.GiftHub.dto.CustomerDto;
import mulcam.kb04.gifthub.GiftHub.dto.GiftDto;

@Service
public interface GiftService {
	public CustomerDto findByCustomerId(String id);

//	public List<GiftDto> findByCustomerIdToList(String id);
	public List<Object[]> findByCustomerIdToList(String id);
}
