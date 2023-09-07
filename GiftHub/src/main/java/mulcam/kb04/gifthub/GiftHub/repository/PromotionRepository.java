package mulcam.kb04.gifthub.GiftHub.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


import mulcam.kb04.gifthub.GiftHub.entity.Promotion;

@Repository
public interface PromotionRepository extends JpaRepository<Promotion, Integer> {
	Promotion findByPromotionNo(Integer promotionNo);
	List<Promotion> findByStoreId(String storeId);
}
