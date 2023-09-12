package mulcam.kb04.gifthub.GiftHub.service;

import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface GiftUsedService {
	Map<Integer, Long> getCountByMonth();
}
