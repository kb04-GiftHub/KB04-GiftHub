package mulcam.kb04.gifthub.GiftHub.service;

import org.springframework.stereotype.Service;

import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;

@Service
public interface RegisterService {
	public void save(StoreDto storeDto);
	public int countByStoreId(String id);
}