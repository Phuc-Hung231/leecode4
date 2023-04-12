/* 
Cho một chuỗi s, hãy kiểm tra xem có thể lặp lại một chuỗi con substr để tạo thành chuỗi s hay không. 
Chuỗi substr phải có độ dài lớn hơn 1.
 */

bool canRepeatSubstring(String s) {     // khai báo hàm nhận chuỗi s làm đầu vào
    final n = s.length;   // n = chiều dài của chuỗi s
    for (var len = 2; len <= n ~/ 2; len++) {   // duyệt qua các độ dài len của chuỗi con substr
        if (n % len != 0) continue; // nếu độ dài của chuỗi s không chia hết cho chiều dài của chuỗi con substr.
        final substr = s.substring(0, len);  // thì độ dài của chuỗi s không phải bội số của len tức là độ dài chuỗi substr 
                                            // chắc chắn không thể tạo thành chuỗi s từ việc lặp lại substr. 
        var i = len;  // 
        while (i < n && s.substring(i, i + len) == substr) {      // ở bước này, substring tách các chuỗi con 
            i += len;
        }
        if (i == n) return true; // Tìm được chuỗi substr có thể lặp lại để tạo thành chuỗi s.
    }
    return false; // Không tìm được chuỗi substr thỏa mãn yêu cầu.
}

void main() {
  String inputStr = "ababab";
  bool result = canRepeatSubstring(inputStr);
  print(result); // true
}

/* 
Ý tưởng thực hiện bài toán:

Để chuỗi substr có thể lặp đi lặp lại i lần tạo thành chuỗi s thì trước tiên độ dài chuỗi s phải chia hết cho độ dài của substr

ví dụ subtr = ab, s = ababab --> 6%2 == 0 --> thỏa mãn, nếu s là aba --> 3%2 == 1 sai 

Nếu s.length chia hết cho substr.leng thì vẫn chưa chắc là chuỗi substr có thật sự tạo được thành chuỗi s hay không

Để xác định, ta thực hiện một vòng lặp while với điều kiện  được tạo thành từ  phương thức substring để thực hiện tách chuỗi con và so sánh xem substr có phải
chuỗi cần tìm không

B1: tạo biến var i = substr.length;
B2: chạy 1 vòng lặp while với i < s.length và chuỗi con tách được bằng substring từ s trong khoảng từ vị trí i đến vị trí i + i hoặc i + substr.leng có 
bằng substr hay không
B3: nếu kết quả trả về cho thấy i = s.length thì đúng, không phải thì return false. 

ví dụ: substr = ab, s1 = abababab, s2 = abcabc

--> lenght của cả s1 và s2 đều chia hết cho substr.lengt 

Nhưng, lấy substring theo điều kiện trên, i = substr.length = 2 thì vòng while sẽ là 

với i < s.length (đúng) và chuỗi con tách ra được từ s bắt đầu từ vị trí i =2 (là sau chữ ab đầu tiên) cho đến vị trí i+substr.leng == substr

nếu đúng là tách ra các chuỗi con sau đó vẫn là substr thì có nghĩa s = substr-substr-.. Nối dài như thế mà tạo thành

Nếu sai thì false

Với s1, tách ra đều được các chuỗi ab == substr --> đúng

Với s2, tách ra ngay lần đầu ta đã được ca != ab của substr --> sai 

Em có 1 vấn đề với bài này là leetcode không nhận bài, em k rõ là cách làm chưa đúng với tất cả các trường hợp hay tư duy thuật toán còn chưa đúng :((

 */



