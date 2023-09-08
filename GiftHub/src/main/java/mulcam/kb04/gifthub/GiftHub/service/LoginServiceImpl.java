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
	public Store save(StoreDto storeDto) {
		Store store = Store.dtoToEntity(storeDto);
		repository.save(store);
		
		return null;
	}

}
