package mulcam.kb04.gifthub.GiftHub.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mulcam.kb04.gifthub.GiftHub.entity.Store;
import mulcam.kb04.gifthub.GiftHub.repository.StoreRepository;
import mulcam.kb04.gifthub.GiftHub.service.FindStoreService;

@Service
public class FindStoreServiceImpl implements FindStoreService {
	@Autowired
	private StoreRepository storeRepository;

	@Override
	public List<Store> findAllStores() {
		return storeRepository.findAll();
	}

}
