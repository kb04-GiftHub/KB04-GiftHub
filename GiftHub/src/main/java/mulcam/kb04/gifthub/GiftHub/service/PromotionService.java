package mulcam.kb04.gifthub.GiftHub.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import mulcam.kb04.gifthub.GiftHub.dto.PromotionDto;
import mulcam.kb04.gifthub.GiftHub.entity.Promotion;
import mulcam.kb04.gifthub.GiftHub.entity.Store;

@Service
public interface PromotionService {
	PromotionDto findByPromotionNo(int promotionNo);
	
	void deleteBypromotionNo(int promotionNo);
    List<PromotionDto> findByStoreId(String storeId);

    PromotionDto save(PromotionDto promotionDto);
    
    PromotionDto savePromotion(PromotionDto promotionDto);
}
