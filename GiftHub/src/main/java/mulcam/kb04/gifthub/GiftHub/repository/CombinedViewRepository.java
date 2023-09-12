package mulcam.kb04.gifthub.GiftHub.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import mulcam.kb04.gifthub.GiftHub.entity.CombinedView;

public interface CombinedViewRepository extends JpaRepository<CombinedView, Integer> {
	List<CombinedView> findByStoreId(String storeId);

	long countByStoreId(String storeId);
}
