package mulcam.kb04.gifthub.GiftHub.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;


import mulcam.kb04.gifthub.GiftHub.entity.Promotion;

public interface PromotionRepository extends JpaRepository<Promotion, String> {

	Promotion findByPromotionNo(Integer promotionNo);
	List<Promotion> findByStoreId(String storeId);
}
