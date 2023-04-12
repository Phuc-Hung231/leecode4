/* 
Cho hai chuỗi s và t, hãy kiểm tra xem chúng có phải là hai chuỗi đồng dạng không 
 */


bool isIsomorphic(String s, String t) {
  if (s.length != t.length) return false; // kiểm tra 2 chuỗi nhập vào có cùng độ dài không? Nếu hai chuỗi khác độ dài thì không đồng dạng
  
  Map<String, String> map = {}; // Map này để lưu ánh xạ giữa các ký tự

  for (int i = 0; i < s.length; i++) {   // chạy vòng lặp này để duyệt qua các kí tự trong s, 
    String c1 = s[i];         // mỗi vòng lặp sẽ tương ứng với một cặp kí tự của 2 chuỗi (do các cặp đều ở cùng 1 vị trí)
    String c2 = t[i];
    
    if (map.containsKey(c1)) { // nếu ký tự này đã được ánh xạ
      if (map[c1] != c2) return false; // kiểm tra ánh xạ có đúng không
    } else {  // nếu không thì kiểm tra thêm 1 bước nữa để check ánh xạ ngược
      if (map.containsValue(c2)) return false; // kiểm tra ánh xạ ngược có bị trùng không
      map[c1] = c2; // thêm ánh xạ mới vào Map
    }
  }

  return true; // hai chuỗi đồng dạng
}

void main() {
  String s = "egg";
  String t = "add";
  bool result = isIsomorphic(s, t);
  print(result); // true
  
  s = "foot";
  t = "ball";
  result = isIsomorphic(s, t);
  print(result); // false
}


/* 
Trình bày ý tưởng:

1: kiểm tra hai chuỗi s và t có cùng độ dài không. Nếu khác độ dài thì chuỗi không đồng dạng --> false, đúng thì tiếp tục
 
2: Khởi tạo 1 map để lưu lại ánh xạ giữa các kí tự 

3: Chạy 1 vòng lặp for để làm thao tác duyệt qua các kí tự của s, đồng thời, khởi tạo 2 string tương ứng với các cặp kí tự của s và t để đối chiếu 

 s[i] tương ứng với t[i]

 4: Trong quá trình duyệt:

- Nếu ký tự chưa được ánh xạ thì kiểm tra xem ký tự tương ứng trong chuỗi t đã được ánh xạ với một ký tự khác trong chuỗi s hay chưa (kiểm tra ánh xạ ngược)
Nếu đã có thì kết luận là 2 chuỗi không đồng dạng --> false
 
- Nếu ký tự này đã được ánh xạ với một ký tự khác trong chuỗi s thì kiểm tra ánh xạ này có trùng với ký tự tương ứng trong chuỗi t hay 
 không. Nếu khác nhau, kết luận là hai chuỗi không đồng dạng --> false.

 Ví dụ: s == foot, t == ball

 s[1] = f --> map = b 
 s[2] = o --> map = ba
 s[3] = o đã được ánh xạ với kí tự a trong chuỗi t 
 

 --> kiểm tra lại xem s[3] có trùng với t[3] không? 

 t[3] đáng nhẽ phải là a nhưng t[3] lại là l --> khác nhau --> kết luận 2 chuỗi này khác nhau

 Ví dụ khác: s == egg; t == add

 S[1] = e --> map = a
 S[2] = g --> map = d
 S[3] = g đã được ánh xạ với kí tự d trong chuỗi t

 --> kiểm tra xem t[3] có phải là d không --> t[3] = d --> đúng

 Tương tự với bước kiểm tra ánh xạ ngược

 Bài giải này có tham khảo bài giải được thực hiện bằng java trên google + hỏi gpt xem các đoạn code đó có ý nghĩa là gì

 */