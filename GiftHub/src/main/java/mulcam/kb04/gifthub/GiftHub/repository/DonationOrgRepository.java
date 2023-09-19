package mulcam.kb04.gifthub.GiftHub.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import mulcam.kb04.gifthub.GiftHub.entity.DonationOrg;

@Repository
public interface DonationOrgRepository extends JpaRepository<DonationOrg, Integer> {
	DonationOrg findByOrgNo(int orgNo);
}
