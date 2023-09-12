package mulcam.kb04.gifthub.GiftHub.service;

import java.util.List;

import org.springframework.stereotype.Service;

import mulcam.kb04.gifthub.GiftHub.dto.PromotionDto;

@Service
public interface PromotionService {
	PromotionDto findByPromotionNo(int promotionNo);
	
	void deleteBypromotionNo(int promotionNo);
    List<PromotionDto> findByStoreId(String storeId);

    PromotionDto save(PromotionDto promotionDto);
       
    PromotionDto insertPromotion(PromotionDto promotionDto);
    
    List<PromotionDto> getAllPromotions();
    
    List<PromotionDto> getPromotionsByType(int promotionType);

	Object findPromotionAndStore(int promotionNo);
    
}
