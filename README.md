# Plugin cho composer của NodeBB (Luận văn CNTN 2016 - HCMUS)

Plugin được viết dựa trên source code gốc của [nodebb-plugin-composer-default](https://github.com/NodeBB/nodebb-plugin-composer-default)
Plugin chỉnh sửa giao diện người dùng của composer mặc định của NodeBB
Plugin thêm chức năng thêm các trường dữ liệu tùy chọn vào composer, ngoài ra plugin cũng hỗ trợ hiển thị các thông tin này ở trang người dùng

## Cài đặt

1. Mở command line ở thư mục chứa source code của compser này và chạy lệnh `npm link`
2. Mở command line ở thư mục chứa source code của NodeBB và chạy lệnh `npm link nodebb-plugin-thesis-composer-default`
3. Vào trang admin của NodeBB */admin/extend/plugins*:
* Tìm và deactivate plugin *nodebb-plugin-composer-default*
* Tìm và activate plugin *nodebb-plugin-thesis-composer-default*
4. Rebuild và restart NodeBB

## Thêm các trường dữ liệu tùy chọn

Để thêm được chức năng này, đầu tiên admin cần cho phép người dùng có thể thêm ảnh thumbnail khi đăng một topic: `admin > settings > upload > Allow users to upload topic thumbnails`

Sau khi mở chức năng này, người dùng giờ đây có thể thêm thumbnail và các trường dữ liệu tùy chọn.

Việc thêm thumbnail và các trường dữ liệu chỉ được áp dụng cho việc thêm mới một topic, chỉnh sửa một topic. Không được áp dụng cho việc thêm mới một reply-post và chỉnh sửa reply-post
![Image](screenshots/thumbnail-optional-data.png?raw=true)

Giao diện khi thêm thumbnail
![Image](screenshots/thumbnail.png?raw=true)

Bài viết có thumbnail và không có thumbnail
![Image](screenshots/thumbnail-none-thumbnail.png?raw=true)

Giao diện khi thêm trường dữ liệu tùy chọn
![Image](screenshots/optional-data.png?raw=true)

Người dùng có thể bỏ trống các trường nhưng một khi đã nhập, dữ liệu phải đảm bảo tính đúng đắn.
Dữ liệu nhập vào sẽ luôn được kiểm tra tính đúng đắn ở phía server, nếu dữ liệu nhập vào không phù hợp sẽ thông báo cho người dùng.
Hai trường dữ liệu đặc biệt là Currency và Expired Date:
* Đối với Currency, khung nhập liệu có hỗ trợ autocomplete để hạn chế lỗi nhập sai từ người dùng (thông tin vẫn được kiểm tra lại một lần nữa ở server)
![Image](screenshots/currency.png?raw=true)

* Đối với Expired Date, người dùng nhập liệu bằng cách chọn ngày để luôn đảm bảo format ngày nhập (DD-MM-YYYY)luôn đúng (thông tin vẫn được kiểm tra lại một lần nữa ở server)
![Image](screenshots/expired-date.png?raw=true)

Dữ liệu tùy chọn được hiển thị
![Image](screenshots/display-data.png?raw=true)
## Giao diện composer cũ và mới

### Composer trên desktop

#### Composer mặc định

![Desktop Old Composer](screenshots/desktop-old.png?raw=true)

##### Composer đã chỉnh sửa

![Desktop New Composer 1](screenshots/desktop-new1.png?raw=true)
![Desktop New Composer 2](screenshots/desktop-new2.png?raw=true)

### Composer trên Mobile Devices

![Mobile Composer](screenshots/mobile.png?raw=true)
