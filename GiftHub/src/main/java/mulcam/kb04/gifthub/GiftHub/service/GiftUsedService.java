package mulcam.kb04.gifthub.GiftHub.service;

import java.util.List;
import java.util.Map;

import mulcam.kb04.gifthub.GiftHub.dto.GiftDto;
import mulcam.kb04.gifthub.GiftHub.entity.Gift;

public interface GiftUsedService {
	Map<Integer, Long> getCountByMonth();
}
