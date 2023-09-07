package mulcam.kb04.gifthub.GiftHub.serviceimpl;

import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mulcam.kb04.gifthub.GiftHub.repository.GiftUsedRepository;
import mulcam.kb04.gifthub.GiftHub.service.GiftUsedService;

@Service
public class GiftUsedServiceImpl implements GiftUsedService {

	@Autowired
	private GiftUsedRepository giftUsedRepository;

	@Override
	public Map<Integer, Long> getCountByMonth() {
		List<Object[]> counts = giftUsedRepository.countByMonth();

		// Initialize a map with all months set to 0
		Map<Integer, Long> countMap = IntStream.rangeClosed(1, 12).boxed()
				.collect(Collectors.toMap(Function.identity(), v -> 0L));

		// Fill the map with the counts from the database
		for (Object[] count : counts) {
			countMap.put((Integer) count[0], (Long) count[1]);
		}
		return countMap;
	}
}
