class ErrorCode {
  static const localizedValuesErrorCode = <String, Map<String, String>>{
    'en': {
      '500': 'Server error. Please try again later',
      '200': 'Success',
      '10000': 'Invalid request id',
      '10001': 'Invalid input format',
      '10002': 'User not found',
      '10003': 'Invalid authentication',
      '10004': 'User existed',
      '10010': 'OTP is still valid. Please wait for a moment.',
      '10011': 'Invalid mobile number format',
      '10012': 'User with mobile number existed',
      '10019': 'User with mobile number existed',
      '10013': 'Invalid email format',
      '10014': 'User with email existed',
      '10015': 'Cannot change user password. Please try again later',
      '10016': 'Failed to create user',
      '10017': 'Failed to create chat user',
      '10020': 'OTP is invalid',
      '10021': 'OTP is expired',
      '10030': 'Register live ticket failed',
      '10040': 'Create ticket order failed',
      '10041': 'Cannot query user point',
      '10042': 'Update ticket order failed',
      '10043': 'User has already bought the ticket',
      '10044': 'Ticket program not found',
      '10045': 'Order ticket failed.',
      '10046': 'Invalid order',
      '10047': 'Purchase order failed.',
      '10048': 'Check point failed.',
      '50000': 'No Live found.',
      '50001': 'Exist live.',
      '50002': 'Exist live.',
      '50003': 'Fail to create stream.',
      '50004': 'Fail to create stream.',
      '50005': 'Update live error',
      '50006': 'This live is already reserved',
      '50010': 'No Shop found.',
      '50020': 'Lipstar user not found.',
      '50030': 'You have already submit a review',
      '10100': 'Invalid room type',
      '10200': 'Favorite failed',
      '10201': 'Login Successfully',
      '10202': 'Create broadcast schedule successfully',
      '10214': 'Update info successfully',
      '10213': 'Update password successfully',
      '20213': 'Your existing password does not match',
      '21213': 'The new password matches the current password',
      '10217': 'Register membership successfully',
      '23000': 'You reported this video!'
    },
    'vi': {
      '500': 'Lỗi máy chủ. Vui lòng thử lại sau',
      '200': 'Thành công',
      '10000': 'Dùng để check request id',
      '10001': 'Lỗi dữ liệu đầu vào',
      '10002': 'Không tìm thấy user trong hệ thống',
      '10003': 'Lỗi đăng nhập, mật khẩu không đúng',
      '10004': 'User đã tồn tại trong hệ thống',
      '10010': 'OTP vẫn còn hiệu lực. Vui lòng đợi trong giây lát.',
      '10011': 'Hello World',
      '10012': 'Số điện thoại đã tồn tại',
      '10019': 'Hello World',
      '10013': 'Email sai định dạng',
      '10014': 'Email đã tồn tại trong hệ thống',
      '10015': 'Đổi mật khẩu không thành công',
      '10016': 'Tạo user không thành công',
      '10017': 'Tạo user chat không thành công',
      '10020': 'OTP không hợp lệ',
      '10021': 'OTP hết hạn',
      '10030': 'Đăng ký vé trực tiếp không thành công',
      '10040': 'Tạo yêu cầu đặt vé không thành công',
      '10041': 'Không thể truy vấn điểm người dùng',
      '10042': 'Cập nhật đơn hàng vé không thành công',
      '10043': 'Người dùng đã mua vé',
      '10044': 'Không tìm thấy chương trình vé',
      '10045': 'Vé đặt hàng không thành công.',
      '10046': 'Đơn hàng không hợp lệ',
      '10047': 'Đơn đặt hàng không thành công.',
      '10048': 'Kiểm tra điểm không thành công.',
      '50000': 'Không tìm thấy live.',
      '50001': 'Tồn tại live.',
      '50002': 'Tồn tại live.',
      '50003': 'Không tạo được stream.',
      '50004': 'Không tạo được stream.',
      '50005': 'Cập nhật lỗi live',
      '50006': 'Buổi phát sóng này đã được đặt trước',
      '50010': 'Không tìm thấy cửa hàng.',
      '50020': 'Không tìm thấy người dùng Lipstar.',
      '50030': 'You have already submit a review',
      '10100': 'Loại phòng không hợp lệ',
      '10200': 'Yêu thích không thành công',
      '10201': 'Đăng nhập thành công',
      '10202': 'Tạo lịch phát sóng thành công',
      '10214': 'Cập nhật thông tin thành công',
      '10217': 'Đăng ký thành viên thành công',
      '10213': 'Cập nhật mật khẩu thành công',
      '20213': 'Mật khẩu hiện tại của bạn không khớp',
      '21213': 'Mật khẩu mới trùng với mật khẩu hiện tại',
      '23000': 'Bạn đã báo cáo video này!'
    },
    'ko': {
      '500': '서버 오류. 나중에 다시 시도하세요',
      '200': '완료되었습니다',
      '10000': '요청 ID를 확인하는 데 사용합니다',
      '10001': '입력 데이터 오류',
      '10002': '시스템에서 사용자를 찾을 수 없습니다',
      '10003': '로그인 오류, 잘못된 비밀번호입니다',
      '10004': '사용자가 이미 시스템에 존재합니다',
      '10010': 'OTP는 아직 유효합니다. 잠시만 기다려주세요.',
      '10011': '안녕하세요 세계',
      '10012': '전화번호가 이미 존재합니다',
      '10019': '안녕하세요 세계',
      '10013': '이메일 형식이 잘못되었습니다',
      '10014': '이메일이 시스템에 이미 존재합니다',
      '10015': '비밀번호 변경 실패했습니다',
      '10016': '사용자 생성 실패했습니다',
      '10017': '사용자 채팅 생성에 실패했습니다',
      '10020': 'OTP가 유효하지 않습니다',
      '10021': 'OTP가 만료되었습니다',
      '10030': '직접 티켓 등록 실패했습니다',
      '10040': '예약 티켓 요청을 생성하기 실패했습니다',
      '10041': '사용자 포인트를 쿼리할 수 없습니다',
      '10042': '티켓 주문 업데이트 실패했습니다',
      '10043': '티켓을 구매한 사용자',
      '10044': '티켓 프로그램을 찾을 수 없습니다',
      '10045': '티켓 주문에 실패했습니다.',
      '10046': '주문이 유효하지 않습니다',
      '10047': '주문이 실패했습니다.',
      '10048': '포인트 확인에 실패했습니다.',
      '50000': '라이브를 찾을 수 없습니다.',
      '50001': 'Tồn tại live.',
      '50002': 'Tồn tại live.',
      '50003': '라이브를 생성하지 못했습니다.',
      '50004': '라이브를 생성하지 못했습니다.',
      '50005': '라이브 오류 업데이트',
      '50006': '이 방송은 예약되어 있습니다',
      '50010': '가계를 찾을 수 없습니다.',
      '50020': '아티스를 찾을 수 없습니다.',
      '50030': 'You have already submit a review',
      '10100': '채팅방 유효하지 않습니다',
      '10200': '즐겨찾기 실패했습니다',
      '10201': '로그인 성공되었습니다',
      '10202': '방송 예정했습니다',
      '10214': '정보 업데이트를 성공되었습니다',
      '10213': '비밀번호 업데이트 성공되었습니다',
      '20213': '현재 비밀번호가 일치하지 않습니다',
      '21213': '새로운 비밀번호와 현재 비밀번호가 일치합니다',
      '10217': 'Register membership successfully',
      '23000': '이 동영상을 신고하셨습니다!'
    }
  };
}
