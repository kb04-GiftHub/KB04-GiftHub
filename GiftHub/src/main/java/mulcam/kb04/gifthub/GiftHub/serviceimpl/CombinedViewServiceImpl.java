package mulcam.kb04.gifthub.GiftHub.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mulcam.kb04.gifthub.GiftHub.entity.CombinedView;
import mulcam.kb04.gifthub.GiftHub.repository.CombinedViewRepository;
import mulcam.kb04.gifthub.GiftHub.service.CombinedViewService;

@Service
public class CombinedViewServiceImpl implements CombinedViewService {
	@Autowired
	private CombinedViewRepository repository;

	@Override
	public List<CombinedView> findByStoreId(String storeId) {
		return repository.findByStoreId(storeId);
	}
}
