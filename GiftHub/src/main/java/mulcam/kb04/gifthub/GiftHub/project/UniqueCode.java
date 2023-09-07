package mulcam.kb04.gifthub.GiftHub.project;

public class UniqueCode {
	private static long lastTimestamp = -1;
    private static int sequence = 0;
	
    public synchronized static String generateUniqueBarcode() {
        long currentTimestamp = System.currentTimeMillis();

        // 현재 시간이 이전 시간과 같다면 시퀀스를 증가시킴
        if (currentTimestamp == lastTimestamp) {
            sequence++;
        } else {
            sequence = 0;
        }

        lastTimestamp = currentTimestamp;

        // 시간 정보와 시퀀스를 결합하여 고유한 값을 생성
        String uniqueValue = currentTimestamp + "-" + sequence;

        return uniqueValue;
    }
}
