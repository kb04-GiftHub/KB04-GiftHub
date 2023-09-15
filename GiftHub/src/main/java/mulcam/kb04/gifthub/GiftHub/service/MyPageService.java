package mulcam.kb04.gifthub.GiftHub.service;

import java.util.List;

import org.springframework.stereotype.Service;

import mulcam.kb04.gifthub.GiftHub.dto.CustomerDto;
import mulcam.kb04.gifthub.GiftHub.dto.JjimDto;
import mulcam.kb04.gifthub.GiftHub.dto.StoreDto;

@Service
public interface MyPageService {
	public StoreDto findByStoreId(String id);
	public CustomerDto findByCustomerId(String id);
	
	public void save(StoreDto storeDto);
	public void MemberSave(CustomerDto customerDto);
	
	public List<Object[]> findByCustomerIdToList(String id);
	public Object findByGiftNo(long no);
	
	public List<Object[]> findByCustomerIdToJjimList(String id);
	
	public JjimDto save(JjimDto jjimDto);
	
}