package mulcam.kb04.gifthub.GiftHub.service;

import org.springframework.stereotype.Service;

import mulcam.kb04.gifthub.GiftHub.dto.CustomerDto;
import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;

@Service
public interface RegisterService {
	public void save(StoreDto storeDto);
	public void memberSave(CustomerDto customerDto);
	
	public int countByStoreId(String id);
	public int memberCountByStoreId(String id);
}
