package mulcam.kb04.gifthub.GiftHub.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import mulcam.kb04.gifthub.GiftHub.entity.GiftUsed;
@Repository
public interface GiftUsedRepository extends JpaRepository<GiftUsed, Integer> {
    
    @Query("SELECT COUNT(g) FROM GiftUsed g WHERE FUNCTION('MONTH', g.usedDate) = :month")
    Long countByMonth(@Param("month") int month);
}
