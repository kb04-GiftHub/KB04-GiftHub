package mulcam.kb04.gifthub.GiftHub.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import mulcam.kb04.gifthub.GiftHub.entity.PointCharge;
@Repository
public interface PointChargeRepository extends JpaRepository<PointCharge, Integer> {

}
