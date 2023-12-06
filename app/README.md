# Ứng dụng Tra cứu Pháp Điển

![](/.github/images/time-tracker-screenshots.png)
Đây là một ứng dụng hỗ trợ tra cứu [Pháp Điển Việt Nam](https://phapdien.moj.gov.vn/Pages/home.aspx)

> Dự án Tra cứu Pháp Điển Việt Nam được lấy tài liệu từ dựa trên [trang web Pháp Điển ](https://phapdien.moj.gov.vn/Pages/home.aspx) và [Cơ sở dữ liệu Quốc gia về Văn bản Pháp luật](https://vbpl.vn/pages/portal.aspx).

## Xem trước trang web

Phiên bản xem trước trang web của ứng dụng có sẵn tại đây:

- [Pháp Điển | Demo Flutter Web](https://starter-architecture-flutter.web.app)

## Tính năng

1. **Tra cứu Tổng quát Tài liệu:**

- Giúp tra cứu tài liệu dựa trên từ khóa cho dù không khớp từ khóa

2. **Tra cứu theo Chủ đề và Đề mục:**

- Cung cấp khả năng tìm kiếm tài liệu dựa trên các chủ đề và đề mục cụ thể.
- Tích hợp hệ thống danh mục để người dùng dễ dàng lọc và tìm kiếm theo chủ đề mong muốn.

3. **Tra cứu bằng Chat Bot**

- Sử dụng Chat Bot tích hợp LLM để trả lời các câu hỏi của người dùng.
- Hỗ trợ việc nhập câu hỏi tự do và cung cấp các câu trả lời thông tin chi tiết và chính xác.
- Thu nhỏ phạm vi tra cứu bằng cách chọn chủ đề hoặc để mục cụ thể giúp câu trả lời từ bot trở lên chính xác hơn

4. **Câu Hỏi Gợi Ý**

- Cung cấp gợi ý câu hỏi cho người dùng dựa trên nhu cầu tìm kiếm và lịch sử trước đó.
- Tối ưu hóa trải nghiệm người dùng bằng cách đề xuất câu hỏi phù hợp và liên quan.

5. **Lịch Sử Chat**

- Ghi lại lịch sử chat giữa người dùng và Chat Bot để người dùng có thể xem lại và theo dõi các tương tác trước đó.
- Hỗ trợ việc tái tạo câu hỏi hoặc tra cứu thông tin đã trao đổi trước đó.

6. **Đồng Bộ Dữ liệu trên Nhiều Thiết Bị**

- Cho phép người dùng tiếp tục trải nghiệm mà không bị mất dữ liệu khi chuyển đổi giữa các thiết bị.

Tính năng trên đảm bảo ứng dụng của bạn mang lại trải nghiệm tìm kiếm linh hoạt, thông tin chi tiết và tương tác hiệu quả với Chat Bot tích hợp LLM.

## Kế Hoạch Phát Triển

#### **1. Đánh Giá và Phản Hồi**

- Tổ chức phiên đánh giá và thu thập phản hồi từ cộng đồng người dùng để hiểu rõ họ mong đợi và gặp phải những vấn đề gì.
- Sử dụng các nền tảng như GitHub để theo dõi các vấn đề (issues) và yêu cầu tính năng (feature requests).

#### **2. Tối Ưu Hóa Hiệu Suất và Ổn Định**

- Tiếp tục tối ưu hóa mã nguồn và tăng cường hiệu suất của ứng dụng.
- Xử lý và khắc phục lỗi, vấn đề bảo mật, nếu có.

#### **3. Mở Rộng Tính Năng**

- Phát triển và thêm tính năng mới dựa trên phản hồi từ cộng đồng và xu hướng công nghệ mới.
- Tăng cường tính năng tương tác, ví dụ: thêm khả năng tùy chỉnh giao diện người dùng, tích hợp các công nghệ mới, hoặc cải thiện trải nghiệm người dùng.

#### **4. Đa Ngôn Ngữ và Tích Hợp Phiên Dịch**

- Hỗ trợ nhiều ngôn ngữ để mở rộng sự tiếp cận đối tượng.
- Cung cấp tích hợp phiên dịch tự động để người dùng có thể sử dụng ứng dụng bằng nhiều ngôn ngữ khác nhau.

#### **5. Tăng Cường An Toàn và Bảo Mật**

- Kiểm tra và nâng cấp các tính năng bảo mật của ứng dụng.
- Áp dụng các biện pháp bảo mật mới và thường xuyên kiểm tra tính an toàn của mã nguồn.

#### **6. Hỗ Trợ Cộng Đồng và Tài Trợ**

- Xây dựng và duy trì diễn đàn cộng đồng để người dùng có thể chia sẻ kiến thức và giúp đỡ nhau.
- Tìm kiếm tài trợ và quảng bá để đảm bảo sự tiếp tục phát triển của dự án.

#### **7. Tích Hợp Đối Tác và API Mở Rộng**

- Hợp tác với các đối tác để tích hợp các dịch vụ và tính năng bổ sung.
- Phát triển API để mở rộng khả năng tích hợp của ứng dụng với các dự án khác.

#### **8. Tuân Thủ Bản Quyền và Giấy Phép**

- Kiểm tra và đảm bảo rằng mã nguồn mở của bạn tuân thủ các giấy phép mở rộng và các quy định của cộng đồng.
- Giữ mã nguồn mở và đảm bảo rằng cộng đồng người dùng có thể tự do sử dụng và đóng góp vào dự án.

Kế hoạch này là một khung chung và có thể điều chỉnh tùy thuộc vào phản hồi và sự phát triển của dự án trong tương lai.

> Đây là một kế hoạch tạm thời. Không có thời gian hoàn thành cụ thể cho bất kỳ điểm nào ở trên.

## Tra cứu Pháp điển Flutter với LLM và Chat Bot

Dưới đây là một số package bạn đang sử dụng trong dự án và mô tả ngắn gọn về chúng.

| STT | Tên Thư Viện                | Ghi Chú - Trường Hợp Sử Dụng                                                                                         | Tài Liệu                                                        |
| --- | --------------------------- | -------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------- |
| 1   | flutter_riverpod            | Quản lý trạng thái và dependency injection trong ứng dụng Flutter.                                                   | [Pub.dev](https://pub.dev/packages/flutter_riverpod)            |
| 2   | flutter_hooks3              | Cung cấp hook để tích hợp trạng thái và vòng đời vào ứng dụng Flutter.                                               | [Pub.dev](https://pub.dev/packages/flutter_hooks)               |
| 3   | hooks_riverpod              | Cung cấp hook cụ thể cho Riverpod, hỗ trợ quản lý trạng thái và tương tác.                                           | [Pub.dev](https://pub.dev/packages/hooks_riverpod)              |
| 4   | flextras                    | Quản lý và tổ chức layout linh hoạt trong ứng dụng Flutter.                                                          | [Pub.dev](https://pub.dev/packages/flextras)                    |
| 5   | boxy                        | Cung cấp công cụ để tạo hiệu ứng và animation động trong giao diện người dùng.                                       | [Pub.dev](https://pub.dev/packages/boxy)                        |
| 6   | flutter_portal              | Hỗ trợ tạo portal để hiển thị thành phần ở nơi không gian UI khác nhau.                                              | [Pub.dev](https://pub.dev/packages/flutter_portal)              |
| 7   | flutter_animate             | Thực hiện hiệu ứng animation một cách dễ dàng trong ứng dụng Flutter.                                                | [Pub.dev](https://pub.dev/packages/flutter_animate)             |
| 8   | page_indicator_plus         | Cung cấp chỉ số trang để theo dõi và hiển thị vị trí trong ứng dụng.                                                 | [Pub.dev](https://pub.dev/packages/page_indicator_plus)         |
| 9   | animations                  | Cung cấp animation đơn giản và mạnh mẽ cho các thành phần trong ứng dụng Flutter.                                    | [Pub.dev](https://pub.dev/packages/animations)                  |
| 10  | gap                         | Giúp quản lý khoảng trắng và padding một cách hiệu quả trong giao diện người dùng.                                   | [Pub.dev](https://pub.dev/packages/gap)                         |
| 11  | sliver_tools2               | Cung cấp công cụ để làm việc với Sliver trong Flutter.                                                               | [Pub.dev](https://pub.dev/packages/sliver_tools)                |
| 12  | google_fonts                | Tích hợp dễ dàng các font từ Google Fonts vào ứng dụng Flutter.                                                      | [Pub.dev](https://pub.dev/packages/google_fonts)                |
| 13  | flex_color_scheme           | Hỗ trợ quản lý và tùy chỉnh màu sắc trong giao diện người dùng.                                                      | [Pub.dev](https://pub.dev/packages/flex_color_scheme)           |
| 14  | json_annotation             | Tạo mã serialization và deserialization cho các lớp Dart từ JSON.                                                    | [Pub.dev](https://pub.dev/packages/json_annotation)             |
| 15  | copy_with_extension         | Cung cấp mã code generation cho phương thức copyWith trong Dart.                                                     | [Pub.dev](https://pub.dev/packages/copy_with_extension)         |
| 16  | riverpod_annotation         | Hỗ trợ code generation cho Riverpod.                                                                                 | [Pub.dev](https://pub.dev/packages/riverpod_annotation)         |
| 17  | dio                         | Thực hiện các yêu cầu HTTP một cách đơn giản và mạnh mẽ.                                                             | [Pub.dev](https://pub.dev/packages/dio)                         |
| 18  | awesome_dio_interceptor     | Cung cấp các interceptor tiện lợi cho Dio để xử lý yêu cầu HTTP.                                                     | [Pub.dev](https://pub.dev/packages/awesome_dio_interceptor)     |
| 19  | curl_logger_dio_interceptor | Cung cấp interceptor để ghi lại yêu cầu HTTP dưới dạng câu lệnh cURL.                                                | [Pub.dev](https://pub.dev/packages/curl_logger_dio_interceptor) |
| 20  | fuzzy                       | Hỗ trợ xử lý và tìm kiếm mờ trong chuỗi.                                                                             | [Pub.dev](https://pub.dev/packages/fuzzy)                       |
| 21  | diacritic                   | Hỗ trợ xử lý dấu và chuẩn hóa chuỗi có dấu.                                                                          | [Pub.dev](https://pub.dev/packages/diacritic)                   |
| 22  | flutter_test                | Gói flutter_test là một phần của Flutter SDK, hỗ trợ việc viết và chạy các bài kiểm tra đơn vị cho ứng dụng Flutter. | [Flutter Testing](https://flutter.dev/docs/testing)             |
| 23  | flutter_lints               | Gói flutter_lints giúp áp dụng các quy tắc lập trình và kiểm tra lỗi trong mã nguồn Flutter.                         | [Pub.dev](https://pub.dev/packages/flutter_lints)               |
| 24  | build_runner                | Hỗ trợ quá trình code generation trong ứng dụng.                                                                     | [Pub.dev](https://pub.dev/packages/build_runner)                |
| 25  | json_serializable           | Giúp tạo mã serialization và deserialization từ JSON cho các lớp Dart.                                               | [Pub.dev](https://pub.dev/packages/json_serializable)           |
| 26  | copy_with_extension_gen     | Cung cấp mã code generation cho phương thức copyWith trong Dart.                                                     | [Pub.dev](https://pub.dev/packages/copy_with_extension_gen)     |
| 27  | riverpod_generator          | Hỗ trợ code generation cho Riverpod.                                                                                 | [Pub.dev](https://pub.dev/packages/riverpod_generator)          |
| 28  | riverpod_lint               | Hỗ trợ kiểm tra và đảm bảo tuân thủ quy tắc khi sử dụng Riverpod.                                                    | [Pub.dev](https://pub.dev/packages/riverpod_lint)               |
| 29  | custom_lint                 | Áp dụng các quy tắc lint tùy chỉnh trong mã nguồn Flutter.                                                           | [Pub.dev](https://pub.dev/packages/custom_lint)                 |
| 30  | retrofit_generator          | Hỗ trợ code generation cho thư viện Retrofit, giúp quản lý các yêu cầu HTTP dễ dàng.                                 | [Pub.dev](https://pub.dev/packages/retrofit_generator)          |

Lưu ý: Đối với mỗi package, hãy kiểm tra phiên bản cụ thể mà bạn đang sử dụng để đảm bảo tính tương thích.

Xem tệp [pubspec.yaml](pubspec.yaml) để biết danh sách đầy đủ.

## Hướng dẫn cài đặt

## Yêu cầu

Để sử dụng dự án này, bạn cần cài đặt [Flutter](https://flutter.dev) trên máy tính của mình. Nếu bạn chưa cài đặt Flutter, bạn có thể làm theo hướng dẫn trên trang chính thức của Flutter.

### Bước 1: Clone Dự Án

Clone dự án từ repository GitHub bằng cách chạy lệnh sau trong terminal hoặc command prompt:

```bash
git clone https://github.com/definev/phapdien.git
cd app
```

### Bước 2: Cài Đặt Các Dependencies

Chạy lệnh sau để cài đặt tất cả các dependencies và packages cần thiết cho dự án:

```bash
flutter pub get
```

### Bước 3: Cài Đặt Môi Trường

Tạo tệp `local.json` trong thư mục `env`. Tệp này sẽ chứa các cấu hình cần thiết cho ứng dụng. Dưới đây là mô tả tổng quan về các trường chính trong `local.json`:

```json
{
  "BASE_URL": "http://localhost:7777"
}
```

### Bước 4: Chạy Ứng Dụng

#### Chế Độ Debug

Chạy ứng dụng trong chế độ debug bằng lệnh:

```bash
flutter run
```

#### Chế Độ Release

Chạy ứng dụng trong chế độ release bằng lệnh:

```bash
flutter run --release
```

#### Xuất File APK với Tất Cả Cấu Trúc Kiến Trúc

Để xuất file APK với tất cả các cấu trúc kiến trúc hỗ trợ, sử dụng lệnh:

```bash
flutter build apk
```

Sau khi hoàn tất các bước trên, bạn sẽ có thể chạy ứng dụng trên thiết bị của mình hoặc máy ảo.

Đó là tất cả. Chúc bạn vui vẻ!

## [Giấy phép: Apache 2.0](LICENSE.md)

Ứng dụng Tra cứu Pháp Điển được phát hành dưới Giấy phép Apache 2.0 - một giấy phép mở rộng có thể tìm thấy tại [LICENSE.md](LICENSE.md).

Đọc kỹ nội dung của [Giấy phép Apache 2.0](LICENSE.md) để hiểu rõ hơn về các điều khoản và điều kiện sử dụng.
