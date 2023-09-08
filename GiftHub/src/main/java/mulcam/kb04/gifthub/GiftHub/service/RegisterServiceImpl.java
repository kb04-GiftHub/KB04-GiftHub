package mulcam.kb04.gifthub.GiftHub.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;
import mulcam.kb04.gifthub.GiftHub.entity.Store;
import mulcam.kb04.gifthub.GiftHub.repository.StoreRepository;

@Component
public class RegisterServiceImpl implements RegisterService {

	@Autowired
	private StoreRepository repository;
	
	@Override
	public void save(StoreDto storeDto) {
		Store store = Store.dtoToEntity(storeDto);
		repository.save(store);
	}

	@Override
	public int countByStoreId(String id) {
		int cnt = repository.countByStoreId(id);
		return cnt;
	}

}
