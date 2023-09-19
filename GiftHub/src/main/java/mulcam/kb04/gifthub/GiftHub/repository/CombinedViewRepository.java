package mulcam.kb04.gifthub.GiftHub.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import mulcam.kb04.gifthub.GiftHub.entity.CombinedView;

public interface CombinedViewRepository extends JpaRepository<CombinedView, Integer> {
	List<CombinedView> findByStoreId(String storeId);

	long countByStoreId(String storeId);

	@Query("SELECT FUNCTION('MONTH', c.useddate) as month, COUNT(c) as count FROM CombinedView c WHERE c.storeId = :storeId GROUP BY FUNCTION('MONTH', c.useddate)")
	List<Object[]> countByMonth(@Param("storeId") String storeId);

}
