package mulcam.kb04.gifthub.GiftHub.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;
import mulcam.kb04.gifthub.GiftHub.entity.Store;
import mulcam.kb04.gifthub.GiftHub.repository.StoreRepository;

@Component
public class LoginServiceImpl implements LoginService {

	@Autowired
	private StoreRepository repository;
	
	@Override
	public StoreDto findByStoreId(String id) {
		Store store = repository.findByStoreId(id);
		StoreDto storeDto = StoreDto.entityToDto(store);
		return storeDto;
	}

	@Override
	public int countByStoreId(String id) {
		int cnt = repository.countByStoreId(id);
		return cnt;
	}

	

}
