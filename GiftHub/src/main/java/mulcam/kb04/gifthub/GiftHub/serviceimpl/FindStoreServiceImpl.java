package mulcam.kb04.gifthub.GiftHub.serviceimpl;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;
import mulcam.kb04.gifthub.GiftHub.entity.Store;
import mulcam.kb04.gifthub.GiftHub.repository.StoreRepository;
import mulcam.kb04.gifthub.GiftHub.service.FindStoreService;

@Service
public class FindStoreServiceImpl implements FindStoreService {
	@Autowired
	private StoreRepository storeRepository;

	@Override
	public List<StoreDto> findAllStores() {
		List<Store> stores = storeRepository.findAll();
		return stores.stream().map(store -> {
			return StoreDto.builder().storeId(store.getStoreId()).storePwd(store.getStorePwd())
					.storeName(store.getStoreName()).storeEmail(store.getStoreEmail()).storeTel(store.getStoreTel())
					.storeAdd1(store.getStoreAdd1()).storeAdd2(store.getStoreAdd2()).storeAdd3(store.getStoreAdd3())
					.storeStatus(store.getStoreStatus()).categoryNo(store.getCategoryNo().getCategoryNo()).build();
		}).collect(Collectors.toList());
	}
}
