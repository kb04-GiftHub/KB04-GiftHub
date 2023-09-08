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
//    Promotion save(PromotionDto promotionDto);
//    
	void deleteBypromotionNo(int promotionNo);
    List<PromotionDto> findByStoreId(String storeId);
//    Optional<Promotion> findByPromotionNoAsEntity(int promotionNo);
//    void deleteById(int promotionNo);
//    Optional<Promotion> findById(int promotionNo);
    PromotionDto save(PromotionDto promotionDto);
}
