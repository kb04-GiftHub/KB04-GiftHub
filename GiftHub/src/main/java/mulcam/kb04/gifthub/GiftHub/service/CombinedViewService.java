package mulcam.kb04.gifthub.GiftHub.service;

import java.util.List;

import mulcam.kb04.gifthub.GiftHub.entity.CombinedView;

public interface CombinedViewService {
	List<CombinedView> findByStoreId(String storeId);

	long getCountByStoreId(String storeId);
}
