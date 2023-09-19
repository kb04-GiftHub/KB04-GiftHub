package mulcam.kb04.gifthub.GiftHub.service;

import java.util.List;
import java.util.Map;

import mulcam.kb04.gifthub.GiftHub.entity.Store;

public interface BuyService {
	public Map<Integer, Long> getCountByMonth(Store storeId);

	public List<Object[]> findByStoreId(Store storeId);
}
