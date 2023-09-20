package mulcam.kb04.gifthub.GiftHub.service;

import org.springframework.stereotype.Service;

import mulcam.kb04.gifthub.GiftHub.dto.CustomerDto;
import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;

@Service
public interface LoginService {
	public StoreDto findByStoreId(String id);
	public CustomerDto findByCustomerId(String id);
	
	public int countByStoreId(String id);
	public int countByCustomerId(String id);
	
	public void updateStauts(String id);
}
