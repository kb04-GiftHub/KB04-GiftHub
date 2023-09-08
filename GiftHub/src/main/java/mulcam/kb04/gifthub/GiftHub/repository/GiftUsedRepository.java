package mulcam.kb04.gifthub.GiftHub.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import mulcam.kb04.gifthub.GiftHub.dto.GiftDto;
import mulcam.kb04.gifthub.GiftHub.entity.GiftUsed;

@Repository
public interface GiftUsedRepository extends JpaRepository<GiftUsed, Integer> {
	@Query("SELECT FUNCTION('MONTH', g.usedDate) as month, COUNT(g) as count FROM GiftUsed g GROUP BY FUNCTION('MONTH', g.usedDate)")
	List<Object[]> countByMonth();
}
