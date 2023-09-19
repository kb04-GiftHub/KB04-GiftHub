package mulcam.kb04.gifthub.GiftHub.serviceimpl;

import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mulcam.kb04.gifthub.GiftHub.entity.Store;
import mulcam.kb04.gifthub.GiftHub.repository.BuyRepository;
import mulcam.kb04.gifthub.GiftHub.service.BuyService;

@Service
public class BuyServiceImpl implements BuyService {
	@Autowired
	BuyRepository buyRepository;

	@Override
	public Map<Integer, Long> getCountByMonth(Store store) {
		List<Object[]> counts = buyRepository.countByMonth(store);
		System.out.println(counts);
		Map<Integer, Long> countMap = IntStream.rangeClosed(1, 12).boxed()
				.collect(Collectors.toMap(Function.identity(), v -> 0L));

		for (Object[] count : counts) {
			countMap.put((Integer) count[0], (Long) count[1]);
		}
		return countMap;
	}

	@Override
	public List<Object[]> findByStoreId(Store storeId) {
		return buyRepository.findStoreDetailsByStoreId(storeId);
	}

}
