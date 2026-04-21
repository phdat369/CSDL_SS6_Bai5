-- Phân tích: 
-- Khi ta dùng where not in để lấy ra room_id có trong bảng rooms và không có trong bảng bookings thì có khả năng trả về 0 là vì: 
-- Trong room_id trong bảng bookings ví dụ 1 bản ghi bị null thì trong mà null không thể so sánh được, từ đó nó trả về 0 gây sai lệch cho bài 

-- Cách sửa: 
-- Để sửa lỗi này thì trong not in chúng ta nên thêm điều kiện là where room_id is not null để lọc ra các cái nào null và để lại các cái không null để so sánh 

-- Viết code 
select room_id,room_name 
from rooms 
where room_id not in (
   select room_id
   from bookings
   where room_id is not null
);