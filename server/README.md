# Pháp Điển Server

Dự án Pháp điển là một hệ thống tra cứu pháp luật toàn diện và tiện lợi, nhằm hỗ trợ người sử dụng trong việc tìm kiếm và hiểu rõ thông tin về các quy định pháp luật.

## Yêu cầu

Đảm bảo bạn đã cài đặt các công cụ sau trên hệ thống của bạn:

- [Docker](https://www.docker.com)
- [Pinecone](https://www.pinecone.io)
- [Dart](https://dart.dev/get-dart)

## Bước 1: Tạo `production.json` trong thư mục `env`

Tạo tệp `production.json` trong thư mục `env`. Tệp này sẽ chứa các cấu hình cần thiết cho server. Dưới đây là mô tả tổng quan về các trường chính trong `production.json`:

```json
{
  "OPENAI_API_KEYS": ["KEY-1", "KEY-2"],
  "PINECONE_API_KEY": "KEY_DEMO",
  "PINECONE_INDEX_NAME": "KEY_DEMO",
  "PINECONE_ENVIRONMENT": "KEY_DEMO",
  "PINECONE_PROJECT_ID": "KEY_DEMO"
}
```

## Bước 2: Chạy Server Local

Thực hiện lệnh sau để bắt đầu máy chủ local:

```bash
make start_local_server
```

## Bước 3: Crawl Dữ Liệu

Trong cửa sổ terminal mới, chạy lệnh sau để bắt đầu quá trình crawl dữ liệu. Lưu ý rằng quá trình này có thể mất một khoảng thời gian:

```bash
make crawling
```

## Bước 4: Chuyển Dữ Liệu Crawl Thành Map

Chuyển đổi dữ liệu crawl thô thành map bằng cách chạy lệnh sau:

```bash
make convert_crawl_data_to_map
```

## Bước 5: Tạo Tài Khoản Pinecone

Truy cập [Đăng Ký Pinecone](https://app.pinecone.io/?sessionType=signup) để tạo tài khoản.

## Bước 6: Thiết Lập Indexes trên Pinecone

1. Chọn mô hình "OpenAI".
2. Tạo các indexes như hình dưới đây:

![Thiết Lập Pinecone](https://prod-files-secure.s3.us-west-2.amazonaws.com/93ec6950-f751-467e-a19b-2d79981b8848/218340d2-fad1-40fa-b0f6-7304ff092f57/Untitled.png)

## Bước 7: Cấu Hình Thông Tin Pinecone

Điền `project_id`, `environment`, `api_key`, và `index_name` của Pinecone vào tệp `production.json`.

## Bước 8: Vector Hóa Dữ Liệu vào Pinecone

Chạy lệnh sau để đưa dữ liệu đã vector hóa vào Pinecone:

```bash
make pinecone_feeding
```

## Bước 9: Chạy Docker Local

Bật các container Docker local bằng lệnh sau:

```bash
make docker_up
```

## Bước 10: Truy Cập Tài Liệu API

Truy cập [http://localhost:7777/api_docs](http://localhost:7777/api_docs) để khám phá tài liệu API của server.

Nếu bạn gặp bất kỳ vấn đề nào hoặc cần sự hỗ trợ, đừng ngần ngại liên hệ.
